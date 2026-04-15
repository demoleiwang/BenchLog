# STATUS — BenchLog current state

_This file is auto-loaded at the start of every Claude session via the `SessionStart` hook. Read it first to know what's already been done and what's pending. Claude MUST update this file at the end of every working session._

_Last updated: 2026-04-15 (session 1)_

---

## Repo at a glance

- **URL**: https://github.com/demoleiwang/BenchLog
- **Branch**: `main`
- **Commits**: 13
- **Entries**: 17 benchmarks; 1 digest (2026-04-15)
- **Architecture**: pure markdown + CLAUDE.md; Claude Code is the runtime. No Python, no scheduler, no scrapers.

## Owner / audience

- **Owner**: Lei Wang (`lei.wang@miromind.ai`), researcher at **MiroMind AI** (they built MiroThinker).
- **Audience**: personal learning tool first; team-sharable second. Not aimed at the open-source community.
- **Research focus**: **agentic intelligence**. Agent benchmarks weigh more than pure-LLM ones.

## Hard rules (from CLAUDE.md — re-read if unsure)

1. **No PDFs, no downloads.** All references are URLs.
2. **Every leaderboard row MUST have a source URL.** Enforced by the PostToolUse lint hook.
3. **Never invent numbers, dates, authors.** Use `_unknown_` when a fact isn't verifiable.
4. **Past digests are immutable.**
5. **Small semantic commits** — one-concept-per-commit.
6. **Benchmark-relevance bar is high.** A paper that *uses* MMLU is not relevant; one that *proposes / critiques / extends* a benchmark is.

## Current benchmark inventory (17)

| Category | Count | Entries |
|---|---:|---|
| **Agent** | 8 | GAIA, τ-bench (+ τ²-bench section), OSWorld, WebArena, BrowseComp, SWE-Lancer, MLE-Bench, GDPval |
| **Coding** | 3 | HumanEval, SWE-bench Verified, LiveCodeBench |
| **Reasoning** | 4 | GPQA Diamond, AIME 2025, ARC-AGI-2, HLE |
| **Knowledge** | 1 | MMLU-Pro |
| **Multimodal** | 1 | MMMU |
| Long-context | 0 | (directory exists, empty) |
| Safety | 0 | (directory exists, empty) |

## Leaderboard coverage (who has been ingested)

Scores currently sourced from:
- Kimi K2 Instruct model card (huggingface.co/moonshotai/Kimi-K2-Instruct)
- DeepSeek-V3 model card (huggingface.co/deepseek-ai/DeepSeek-V3)
- MiniMax-M2 model card (huggingface.co/MiniMaxAI/MiniMax-M2)
- Claude Sonnet 4.5 launch blog (anthropic.com/news/claude-sonnet-4-5)
- Kimi K1.5 arxiv (2501.12599)
- GLM-4.5 arxiv (2508.06471)
- Qwen3-235B-Instruct-2507 model card
- Original benchmark papers (for paper-era baselines)

Models currently in `leaderboards/overview.md`: 13 (Claude Sonnet 4/4.5, Claude Opus 4, Claude 3.5 Sonnet, Kimi K2, Kimi K1.5, MiniMax-M2, GLM-4.5, GPT-5 thinking, GPT-4.1, GPT-4o, Gemini 2.5 Pro, Qwen3-Instruct-2507, DeepSeek-V3, LLaMA-3.1-405B).

## Known open questions / deferred work

1. **GLM-4.6 benchmark table is a PNG image** on the HF page — WebFetch can't read images. Need: either the z.ai blog text, or a paste of the table from Lei.
2. **Gemini 3 Pro** — no clean WebFetch source yet. HLE scores present via lastexam.ai but other benchmarks missing.
3. **OpenAI `openai.com/*` returns 403** on every WebFetch. Mitigation: arxiv + HF dataset mirrors (already used for GDPval, SWE-Lancer, MLE-Bench, BrowseComp).
4. **"One-million-bench"** mentioned by Lei — no canonical reference located.
5. **LARY** (arxiv 2604.11689) flagged in digest 2026-04-15 as a promotion candidate (new vision-to-action benchmark, 1M+ videos). Needs decision: does `embodied/robotics` belong in scope?
6. **User reported** MiroThinker and "GPT-5.4 Pro" near 90% on BrowseComp. Only verified to **74.0% for MiroThinker-1.7** (huggingface.co/miromind-ai/MiroThinker-1.7 + GitHub README). "GPT-5.4 Pro" — no verifiable source. Ask Lei for URLs if the higher numbers should be tracked.

## Next-session TODOs (pending)

- [ ] **Add Terminal-Bench entry** (Lei's explicit ask — was missing from initial seed).
- [ ] **Add more valuable benchmarks**: SWE-bench Pro, Multi-SWE-Bench, BFCL (Berkeley Function Calling), AgentBench, RULER (long-context), MMMU-Pro, ArtifactsBench.
- [ ] **Fetch GLM-4.6** numbers through a non-image channel.
- [ ] **Fetch Gemini 3 Pro** launch info through a working URL.
- [ ] **Continue daily HF Papers / arxiv scan**; LARY promotion decision still open.
- [ ] **Grow the embodied / robotics category** if LARY or siblings are promoted.

## How to use this file

- **At session start**: the content is already loaded — don't re-read it unless a specific section is needed. Adjust your plan to what's already done.
- **Before starting new work**: check "Next-session TODOs" to avoid redundant work.
- **At session end**: update this file — increment the session counter, add any new TODOs / open questions, refresh the inventory table if it changed. Commit as `Refresh STATUS.md (session N)`.

## Quick-reference file map

- [`README.md`](README.md) — human entry point
- [`PLAN.md`](PLAN.md) — design rationale
- [`TECH_PIPELINE.md`](TECH_PIPELINE.md) — architecture + tooling decisions
- [`CLAUDE.md`](CLAUDE.md) — Claude's operating manual
- [`STATUS.md`](STATUS.md) — this file (read-me-first)
- [`benchmarks/<cat>/<Name>.md`](benchmarks/) — per-benchmark entries
- [`digests/YYYY-MM-DD.md`](digests/) — one per daily run
- [`leaderboards/overview.md`](leaderboards/overview.md) — cross-benchmark snapshot
- [`.claude/hooks/lint-benchmark-entry.sh`](.claude/hooks/) — the PostToolUse linter
- [`tests/run-fixtures.sh`](tests/) — linter validation against good/bad fixtures
