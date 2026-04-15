# BenchLog — Project Plan

> A Claude-Code-maintained knowledge base of important AI / LLM / agent benchmarks.
> Owner: Lei Wang. Run by Claude. Read by humans.

---

## 1. Goals

1. **Personal-first**: a place I (Lei) can open and quickly learn what a benchmark measures, see examples, and find the latest model results.
2. **Team-shareable**: clean enough that a teammate can browse on GitHub without context.
3. **Self-maintaining**: I run `claude` in the repo, say "update", and Claude does the rest — fetches sources, summarizes, updates files, commits, pushes.
4. **No PDFs**: every reference is a link. Knowledge lives in markdown.
5. **History-preserving**: old entries are never overwritten silently. Updates append; replacements are logged.

## 2. Non-goals

- Not a benchmark *runner* — we don't execute evals, we summarize them.
- Not a paper aggregator — we filter HARD for benchmark-relevant papers only.
- Not a leaderboard service — we record snapshots, not real-time leaderboards.
- No PDF storage, no model weights, no eval harness code.

## 3. Architecture: "Claude-native, no code"

The repo contains **only markdown + a `CLAUDE.md` workflow spec**. There is no Python, no scheduler, no scraper code. Claude Code itself is the runtime.

**Why?** Adding Python means dependencies, environments, breakage. The user's stated workflow is "我每天 run 下" — that's already Claude. So Claude does fetching (via `WebFetch`), summarization, file writes, and git operations. Zero infrastructure.

### Daily run, conceptually

```
┌─────────────────────────────────────────────────────────┐
│  User: cd BenchLog && claude                            │
│  User: "update"                                         │
└─────────────────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────┐
│  Claude reads CLAUDE.md → follows daily workflow:       │
│   1. git pull                                           │
│   2. Fetch sources (WebFetch):                          │
│       - huggingface.co/papers (today)                   │
│       - arxiv.org/list/cs.CL/recent                     │
│       - openai.com/news, anthropic.com/news             │
│       - (optional) user-pasted Twitter URLs             │
│   3. Filter for benchmark-relevant items                │
│   4. For each new benchmark → create benchmarks/<cat>/  │
│      <Name>.md from template                            │
│   5. For each new model result → append to existing     │
│      benchmark file's leaderboard table                 │
│   6. Write digests/YYYY-MM-DD.md                        │
│   7. Update README highlights section                   │
│   8. git add . && git commit && git push                │
└─────────────────────────────────────────────────────────┘
```

## 4. Repo structure

```
BenchLog/
├── README.md                 # Landing page: what is this, navigation, latest highlights
├── CLAUDE.md                 # The daily-update spec — Claude reads this every run
├── PLAN.md                   # This file
├── TEMPLATES/
│   ├── benchmark.md          # Template for a new benchmark entry
│   └── digest.md             # Template for a daily digest
├── benchmarks/
│   ├── coding/               # HumanEval, SWE-bench, LiveCodeBench, BigCodeBench...
│   ├── reasoning/            # GPQA, MATH, AIME, ARC-AGI, HLE...
│   ├── agent/                # GAIA, WebArena, OSWorld, τ-bench, SWE-bench...
│   ├── knowledge/            # MMLU, MMLU-Pro...
│   ├── multimodal/           # MMMU, MathVista, ChartQA, VideoMME...
│   ├── safety/               # HarmBench, AdvBench, AgentHarm...
│   └── long-context/         # RULER, LongBench, ∞Bench...
├── digests/
│   └── YYYY-MM-DD.md         # One file per daily run
├── leaderboards/
│   └── overview.md           # Cross-benchmark snapshot of frontier models
└── sources/
    └── tracked.md            # The list of URLs we monitor
```

## 5. File schemas

### 5.1 Benchmark entry (`benchmarks/<category>/<Name>.md`)

Required sections — Claude must fill all of them, marking `_unknown_` if information genuinely cannot be found:

```markdown
# <Benchmark Name>

> One-sentence description.

| | |
|---|---|
| **Category** | coding / reasoning / agent / ... |
| **Released** | YYYY-MM |
| **Paper** | [arXiv:XXXX.XXXXX](url) |
| **Project / Code** | [github / website](url) |
| **Maintainer** | <org> |
| **Size** | N tasks |
| **License** | ... |

## What it measures
2–4 paragraphs. Why it exists, what gap it fills, what skill it tests.

## Task format
Input/output schema. Scoring rule. Pass@1 / pass@k / accuracy / etc.

## Example
A real, concrete example (input + expected output). Lifted from the paper or repo.

## Leaderboard (snapshot)
| Model | Score | Date | Source |
|-------|------:|------|--------|
| ... | ... | YYYY-MM-DD | [link]() |

## Critique & known issues
Contamination risks, ambiguity, label noise, saturation, gaming.

## Related benchmarks
Internal links to sibling entries.

## Update log
- YYYY-MM-DD: what changed
```

### 5.2 Daily digest (`digests/YYYY-MM-DD.md`)

```markdown
# Digest — YYYY-MM-DD

## TL;DR
3 bullets max.

## New benchmark entries
- [Name](../benchmarks/cat/Name.md) — one-line why it matters

## Updated entries (new model scores, revisions)
- [Name](../benchmarks/cat/Name.md) — what changed

## Trending benchmark-related papers (not yet promoted to entries)
- [Title](paper-url) — one-line summary, and: should this become an entry?

## Sources scanned
- HF Daily Papers (N items reviewed, M relevant)
- arXiv cs.CL/cs.AI new (...)
- OpenAI news, Anthropic news (...)

## Open questions for next run
- ...
```

## 6. Sources (initial list)

| Source | URL | How |
|---|---|---|
| HuggingFace Daily Papers | https://huggingface.co/papers | `WebFetch` |
| arXiv recent cs.CL | https://arxiv.org/list/cs.CL/recent | `WebFetch` |
| arXiv recent cs.AI | https://arxiv.org/list/cs.AI/recent | `WebFetch` |
| OpenAI news | https://openai.com/news/ | `WebFetch` |
| Anthropic news | https://www.anthropic.com/news | `WebFetch` |
| Papers With Code (benchmarks) | https://paperswithcode.com/sota | `WebFetch` (selective) |
| Twitter / X | n/a | User pastes URLs in prompt |

## 7. Initial seed (bootstrap content)

Day-zero entries so the repo is useful immediately:

- **Coding**: HumanEval, MBPP, SWE-bench Verified, LiveCodeBench, BigCodeBench
- **Reasoning**: GPQA Diamond, MATH, AIME 2025, ARC-AGI-2, HLE (Humanity's Last Exam)
- **Agent**: GAIA, WebArena, OSWorld, τ-bench
- **Knowledge**: MMLU-Pro
- **Multimodal**: MMMU, MathVista
- **Long context**: RULER

~17 entries. Enough breadth to demonstrate the categorization.

## 8. Update / history rules

- **Never overwrite a leaderboard row silently.** If a score is corrected, the old row stays with a strikethrough and the new row is appended below.
- **Every change appends to the entry's `## Update log`.**
- **Every run produces exactly one digest file** named with that day's date. If run multiple times in one day, append to the same file under a `## Run N` subheading.
- **Old digests are immutable.** Never edit a past day's digest after the fact.

## 9. Open questions deferred until after first run

- Twitter ingestion: skip for v1 (require user to paste URLs). Re-evaluate after we see how often it matters.
- Cross-benchmark leaderboard automation: do manually for v1, automate later if the hand-maintenance becomes annoying.
- Tagging system / search: rely on directory structure + GitHub search for v1.

## 10. Success criteria for v1

- [ ] Repo has 15+ benchmark entries, each with all required sections
- [ ] CLAUDE.md is precise enough that a fresh Claude session can run the daily flow without further instructions
- [ ] One end-to-end daily run completes successfully and produces a digest
- [ ] README looks good on GitHub (renders cleanly, easy to navigate)
- [ ] Pushed to `main` on `demoleiwang/BenchLog`
