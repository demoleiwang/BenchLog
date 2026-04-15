# TECH_PIPELINE.md

> The end-to-end technical pipeline for BenchLog. This document is for evaluating and improving the system over time. It complements [`PLAN.md`](PLAN.md) (design rationale) and [`CLAUDE.md`](CLAUDE.md) (operating manual for Claude).

---

## 1. Architecture in one picture

```
┌─────────────────────────────────────────────────────────────────────┐
│                         USER LAYER                                  │
│  $ cd BenchLog && claude                                            │
│  > update                                                           │
└────────────────────────────┬────────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────────┐
│                       CLAUDE LAYER (runtime)                        │
│  Reads CLAUDE.md → executes Daily Update Flow                       │
│                                                                     │
│   ┌──────────┐   ┌──────────┐   ┌──────────┐   ┌──────────┐         │
│   │  FETCH   │──▶│  FILTER  │──▶│ CLASSIFY │──▶│  WRITE   │         │
│   └────┬─────┘   └─────┬────┘   └─────┬────┘   └─────┬────┘         │
│        │               │              │              │              │
│   WebFetch x N    benchmark-      new entry vs.   templates,        │
│                   relevance       update vs.      Edit/Write,       │
│                   rules           digest-only     append rules      │
└────────────────────────────────────────────────────┬────────────────┘
                                                     │
                                                     ▼
┌─────────────────────────────────────────────────────────────────────┐
│                       VALIDATION LAYER                              │
│   PostToolUse hook → .claude/hooks/lint-benchmark-entry.sh          │
│   Checks: required sections, leaderboard source links, no PDFs,     │
│           no edits to past digests, internal link integrity         │
└────────────────────────────────────────────────────┬────────────────┘
                                                     │
                                                     ▼
┌─────────────────────────────────────────────────────────────────────┐
│                         GIT LAYER                                   │
│   Small semantic commits → push to origin/main                      │
│   - "Add <Bench> entry"                                             │
│   - "Update leaderboards: <B1>, <B2>"                               │
│   - "Digest YYYY-MM-DD"                                             │
└─────────────────────────────────────────────────────────────────────┘
```

## 2. Stage-by-stage breakdown

### Stage 1 — FETCH

**Inputs**: `sources/tracked.md` (URL list)
**Tool**: Claude's `WebFetch` (one call per source)
**Output**: For each source, an LLM-summarized list of items: `{title, link, abstract, date}`

**Why WebFetch over WebSearch**: Sources are known and stable. WebFetch is deterministic and idempotent; WebSearch results vary by region/time and would add nondeterminism.

**Failure modes**:
- Source page changes structure → LLM extraction may miss items. Mitigation: Claude logs items reviewed in the digest, so silent drops surface.
- Source page is rate-limited or down → log under "Sources scanned" with `error`, do not skip silently.

### Stage 2 — FILTER (benchmark-relevance)

**Rule** (from `CLAUDE.md`): a paper is benchmark-relevant if it **proposes**, **critiques**, **extends** a benchmark, or **reports a frontier score** on a tracked one. Papers that merely *use* a benchmark are out.

**Bias**: high precision over recall. False negatives are recoverable next day; false positives bloat the repo.

### Stage 3 — CLASSIFY

For each kept item, Claude picks one of four routes:

| Route | When | Action |
|---|---|---|
| `new-entry` | New benchmark, nontrivial | Create `benchmarks/<cat>/<Name>.md` from `TEMPLATES/benchmark.md` |
| `update-entry` | New score / revision for tracked benchmark | Append leaderboard row + `## Update log` line |
| `digest-only` | Interesting but borderline | List under "Trending" in digest |
| `skip` | False positive on closer read | No-op |

**Default when uncertain**: `digest-only`. Promotion to a full entry is cheap; deletion is awkward.

### Stage 4 — WRITE

Templates live in `TEMPLATES/`. Claude uses the `Write` tool for new files and `Edit` for appends. Existing entries are append-only for leaderboards and update logs.

**Strict rules**:
- Every leaderboard row has a source link.
- Unknown fields are `_unknown_` (forbidden to invent).
- Examples must be lifted verbatim from the paper / repo, with source link.
- Past digests are immutable (only today's digest is writable).

### Stage 5 — VALIDATION (hook layer)

A `PostToolUse` hook fires after every `Write` or `Edit` to a file matching `benchmarks/**/*.md` or `digests/**/*.md`. It runs `.claude/hooks/lint-benchmark-entry.sh` and surfaces failures back to Claude before Claude continues.

**What the linter checks**:

| Check | Severity | Why |
|---|---|---|
| Required sections present (`## What it measures`, `## Task format`, `## Example`, `## Leaderboard (snapshot)`, `## Critique & known issues`, `## Update log`) | error | Schema integrity |
| Every leaderboard data row contains a markdown link `[...](...)` in the Source column | error | "No score without a source" rule |
| No links to local `*.pdf` files | error | "No PDFs" rule |
| No edits to digest files older than today | error | Past digests are immutable |
| Internal `[link](relative/path.md)` targets exist on disk | warn | Catch dangling references |
| `_unknown_` count ≤ 3 in a new file | warn | Encourages digging deeper |

The hook is **advisory not blocking** for warnings, **blocking** for errors.

### Stage 6 — GIT

Small semantic commits (one-concept-per-commit), then `git push origin main`. No force-push. If push fails, surface the error and stop.

## 3. Tools we use, and what we considered

Source: claude-code-guide research, 2026-04-15.

| Feature | Decision | Why |
|---|---|---|
| `WebFetch` | **YES** (in use) | Five known stable URL sources — deterministic, idempotent |
| `Write` / `Edit` / `Read` / `Glob` / `Grep` | **YES** (in use) | Standard file ops |
| `Bash` (git, hook script) | **YES** (in use) | Git operations and validator invocation |
| `PostToolUse` hook | **YES** (adopted, this commit) | Catches most schema/link errors before commit; ~15-min setup, ~80% of manual-review overhead removed |
| Slash commands (`/promote <id>`, `/add-score <bench> <model> <val>`) | **MAYBE** (deferred) | Build only after a repetitive pattern emerges (~10+ runs). Premature ergonomics else. |
| Skills (packaging the daily flow) | **NO for now** | CLAUDE.md is mandatory context already; Skills shine for reusable, optional playbooks. Revisit if BenchLog spawns sibling repos. |
| Subagent parallelism (one per source) | **NO** | Filtering, not fetching, is the slow step. Coordination cost > ~30s saved. |
| Custom MCP (arxiv / HF / PWC) | **NO** | Net negative cost/benefit at this scale. Would consider if a maintained third-party arxiv MCP appears. |
| `WebSearch` | **NO** (default), **AD HOC** when scope is open-ended | E.g. user asks "find any new SWE-bench scores reported anywhere this week" — fine to use, not part of daily sync |
| Memory tool / Files API / Batch / extended thinking | **NO** | Wrong problem class — workflow is I/O-bound, not compute- or context-bound |

**Trigger to revisit Skills**: a second BenchLog-shaped repo is created, OR a teammate wants to run the same playbook independently.

**Trigger to revisit subagents**: source list exceeds ~15 feeds, OR user asks for "audit every entry's leaderboard against the latest published numbers" (an embarrassingly-parallel backfill task).

## 4. Quality bar / evaluation metrics

How we judge whether the pipeline is working:

| Metric | Target | Where measured |
|---|---|---|
| **Schema completeness** | 100% of entries pass linter `error` checks | Linter exit code |
| **Source-link coverage** | 100% of leaderboard rows have a source link | Linter |
| **No-invention rate** | 0 invented numbers / dates / authors | Spot-checks during user review |
| **Digest write-rate** | ≥ 1 digest per day on update days | `ls digests/` |
| **Entry growth** | Steady — no week with > 10 new entries (precision filter is working) | `git log --stat benchmarks/` |
| **Promotion-to-skip ratio** | Healthy spread; 100% promotion suggests filter too lax | Inspect digests' "Trending" section |
| **Stale leaderboards** | Top-5 frontier benchmarks updated within 30 days | Manual quarterly audit |

## 5. Known weak spots

1. **HTML structure drift**: source pages (HF Papers, arxiv listing) can change layout. WebFetch's LLM extraction is robust but not infallible. Watch for sudden drops in "items reviewed" counts in digests.
2. **Twitter/X**: no automated ingestion. User must paste tweet URLs manually. Acceptable for v1.
3. **Cross-benchmark leaderboard (`leaderboards/overview.md`)**: hand-maintained. Will drift. Acceptable for v1.
4. **Entry de-duplication**: two papers may describe the same benchmark under slightly different names (e.g. "AIME 2024" vs "AIME-2024 Math Olympiad Set"). No automated check; relies on Claude's pattern matching.
5. **Score normalization**: different harnesses give different numbers for the "same" benchmark (e.g. SWE-bench Verified pass@1 with vs. without retrieval). Per-entry critique should call this out, but no formal schema enforces it.

## 6. Roadmap

### Near-term (next ~20 daily runs)

- Watch for repetitive natural-language patterns; if "add this paper" / "update SWE-bench with X" recurs, promote to slash commands.
- Tune filter thresholds based on what the user actually deletes from digests.

### Mid-term (after a month of usage)

- Add a `/audit` slash command that re-validates every entry's leaderboard against current published sources (would benefit from subagent parallelism — one agent per ~10 entries).
- If team-sharing demand emerges, package the daily flow as a Skill in a separate plugin so colleagues can install it.

### Long-term / speculative

- A small companion site (GitHub Pages) that renders entries with category filters, a global model-vs-benchmark matrix, and trend charts. No new code in this repo; pure presentation layer that reads the markdown.
- Auto-detect contamination heuristics ("benchmark X was published before model Y's training cutoff") and flag in critique sections.

## 7. Test / validation suite

See [`.claude/hooks/lint-benchmark-entry.sh`](.claude/hooks/lint-benchmark-entry.sh) and [`tests/`](tests/) for fixtures and golden cases. Run manually:

```bash
bash .claude/hooks/lint-benchmark-entry.sh           # lint all benchmark + digest files
bash tests/run-fixtures.sh                            # exercise the linter against known good/bad fixtures
```

The validator is invoked automatically by the `PostToolUse` hook during a Claude session. It also runs against the whole repo if no specific file is passed — useful for periodic audits.

## 8. Change log for this document

- 2026-04-15: Initial version.
