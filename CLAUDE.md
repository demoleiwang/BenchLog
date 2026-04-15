# CLAUDE.md — Daily update workflow for BenchLog

You are maintaining **BenchLog**, a personal knowledge base of AI / LLM / agent benchmarks owned by Lei Wang. This file is your operating manual. Read it fully at the start of every session.

## Golden rules

1. **No PDFs. No downloads.** Every reference is a link to the original source.
2. **Never overwrite history silently.** Old leaderboard rows stay; corrections append. Old digests are immutable.
3. **Every change is logged** in the target entry's `## Update log` section.
4. **When a fact is unknown, write `_unknown_`** — do not invent numbers, dates, or authors.
5. **Benchmark-relevance bar is high.** A paper that merely *uses* MMLU is not benchmark-relevant. A paper that *proposes, critiques, or extends* a benchmark is.
6. **Follow existing structure.** Use the templates in `TEMPLATES/`. Do not introduce new top-level directories without updating this file and PLAN.md.

## Trigger phrases

When the user says any of these, run the **Daily Update Flow** below:

- `update`
- `daily update`
- `update BenchLog`
- `run the update`
- `抓一下最新的` / `更新一下` / `日更`

If the user gives a narrower instruction (e.g. "add Claude 4.6's SWE-bench score" or "write an entry for BenchX"), do just that and still write a digest for the day.

---

## Daily Update Flow

### Step 0 — Sync

```bash
git pull --ff-only
```

If pull fails, stop and ask the user.

### Step 1 — Fetch sources

Use `WebFetch` on each of the sources listed in `sources/tracked.md`. Default set:

- `https://huggingface.co/papers` — today's HF Daily Papers
- `https://arxiv.org/list/cs.CL/recent` — recent cs.CL
- `https://arxiv.org/list/cs.AI/recent` — recent cs.AI
- `https://openai.com/news/` — OpenAI announcements
- `https://www.anthropic.com/news` — Anthropic announcements

For each fetch, extract: title, link, 1-line abstract, date. Do NOT fetch PDFs.

### Step 2 — Filter for benchmark-relevance

A paper is benchmark-relevant if it:

- **Proposes** a new benchmark or evaluation protocol
- **Critiques** an existing benchmark (contamination, label noise, saturation)
- **Extends** or revises a major benchmark (v2, "Verified", "Pro", "Diamond")
- **Reports frontier scores** on a tracked benchmark from a new model

A paper is NOT benchmark-relevant just because it uses benchmarks to evaluate a method. Filter aggressively — low recall is fine, high precision is the goal.

### Step 3 — Classify each kept item

For each benchmark-relevant item, decide:

| Action | When |
|---|---|
| **Create new entry** | It's a new, nontrivial benchmark you haven't seen before. File under `benchmarks/<category>/<Name>.md` using `TEMPLATES/benchmark.md`. |
| **Update existing entry** | It reports a new score, revises methodology, or adds critique to a benchmark already tracked. Append to the entry's leaderboard and its `## Update log`. |
| **Note in digest only** | Interesting but doesn't warrant a full entry yet — list under "Trending benchmark-related papers (not yet promoted)" in the digest. |
| **Skip** | Not benchmark-relevant after closer read. |

### Step 4 — Write new entries from the template

When creating a new benchmark entry:

1. Copy `TEMPLATES/benchmark.md`.
2. Fill every section. Use `_unknown_` for fields you genuinely can't fill.
3. Include at least one **concrete example task**, copied from the paper/repo.
4. Leaderboard: seed with any model scores named in the paper; add source links.
5. Write a critique. If the paper doesn't discuss limitations, infer plausible risks (contamination from web-scraped data, saturation trajectory, etc.) — but label them as inferred.

Place the file in the right category directory. Categories: `coding`, `reasoning`, `agent`, `knowledge`, `multimodal`, `safety`, `long-context`. If none fits, add a new directory AND update this file AND PLAN.md in the same commit.

### Step 5 — Update existing entries

When a new score appears for a tracked benchmark:

1. Open `benchmarks/<cat>/<Name>.md`.
2. Append a row to the leaderboard. Most-recent-first ordering: insert at top of table body.
3. If a prior row is being *corrected* (not superseded by a newer model), strike the old row with `~~...~~` and add the corrected row below it.
4. Add a line to `## Update log`: `YYYY-MM-DD: Added <Model> score <X>. Source: <link>.`

### Step 6 — Write the digest

Create or append to `digests/YYYY-MM-DD.md` using `TEMPLATES/digest.md`.

- One digest file per date. If running multiple times in one day, append a `## Run 2` subheading.
- Populate all sections. Use `_none today_` for empty sections.
- The "Open questions" section is important — surface anything that needs human judgment.

### Step 7 — Update README highlights

Edit `README.md`:

- "Latest digests" section: prepend a link to today's digest.
- "Recently updated" section: list up to 5 most-recently-touched benchmark entries.
- Keep the section small (≤10 items each).

### Step 7.5 — Validate

Run the linter on everything you touched:

```bash
bash .claude/hooks/lint-benchmark-entry.sh <files-you-touched>
```

(It also runs automatically via the `PostToolUse` hook in `.claude/settings.json` after every Write/Edit on benchmarks/digests files. The manual call is a final safety net before commit.)

If errors are reported, fix them before committing. Warnings are advisory but should be addressed when they're easy.

### Step 8 — Commit and push

Make **small, semantic commits**:

- One commit per new benchmark entry: `Add <Name> benchmark entry`
- One commit per batch of leaderboard updates: `Update leaderboards: <Bench1>, <Bench2>`
- One commit for the digest: `Digest YYYY-MM-DD`
- One commit for README: `README: refresh latest digests`

Commit format:

```
<type>: <subject>

<optional body>

Co-Authored-By: Claude Opus 4.6 (1M context) <noreply@anthropic.com>
```

Then: `git push origin main`.

### Step 9 — Report to user

Print a short summary:

- N new entries added: names + paths
- M entries updated: names + what changed
- K papers noted in digest but not promoted
- Digest path
- Open questions for the user to review

---

## Benchmark entry authoring standards

- **Voice**: declarative, compact, no hedging. "The benchmark tests X" not "the benchmark aims to potentially explore X-like behaviors".
- **Examples MUST be real.** Copy from the paper. Quote verbatim. Link the source.
- **Scores MUST have sources.** Every leaderboard row links to the paper / blog / leaderboard page where it was reported.
- **Flag contamination risk** whenever the training data of reporting models plausibly overlaps the benchmark source material.
- **Chinese is fine** in user-facing summaries if the user writes to you in Chinese, but keep entry structure (headings, field names) in English for consistency.

## When unsure

- If you can't decide the category, default to the most specific plausible one. Moving files later is cheap.
- If you can't decide whether a paper deserves a full entry vs. a digest note, default to digest note. Promotion is easy; deletion is awkward.
- If a source URL fails to fetch, log it in the digest under "Sources scanned" with a note, do not silently skip.
- If git operations fail, stop and surface the error to the user. Do not force-push.

## Tests

The validation suite at `tests/run-fixtures.sh` exercises the linter against good/bad fixtures. If you touch the linter, run:

```bash
bash tests/run-fixtures.sh
```

Must report 0 failures before you commit a linter change.

## What NOT to do

- Don't add features the user didn't ask for (tags, search indexes, scripts, cron jobs).
- Don't rewrite past digests.
- Don't delete benchmark entries without explicit user approval.
- Don't modify this CLAUDE.md except to fix genuine errors or record new structural decisions (and flag the change in the commit message).
