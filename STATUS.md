# STATUS — BenchLog current state

_This file is auto-loaded at the start of every Claude session via the `SessionStart` hook. Read it first to know what's already been done and what's pending. Claude MUST update this file at the end of every working session._

_Last updated: 2026-04-15 (session 1, end-of-session refresh)_

---

## Repo at a glance

- **URL**: https://github.com/demoleiwang/BenchLog
- **Branch**: `main`
- **Entries**: **24 benchmarks** across 6 active categories; 1 digest (2026-04-15); cross-benchmark overview
- **Architecture**: pure markdown + CLAUDE.md; Claude Code is the runtime. No Python, no scheduler, no scrapers.

## Owner / audience

- **Owner**: Lei Wang (`lei.wang@miromind.ai`), researcher at **MiroMind AI** (team built **MiroThinker** deep-research agent family).
- **Audience**: personal learning tool first; team-sharable second. Not aimed at the open-source community.
- **Research focus**: **agentic intelligence**. Agent benchmarks weigh more than pure-LLM ones. BrowseComp / GAIA / HLE / τ²-bench are high-priority to keep current.

## Hard rules (from CLAUDE.md — re-read if unsure)

1. **No PDFs, no downloads.** All references are URLs.
2. **Every leaderboard row MUST have a source URL.** Enforced by the PostToolUse lint hook.
3. **Never invent numbers, dates, authors.** Use `_unknown_` when a fact isn't verifiable.
4. **Past digests are immutable.**
5. **Small semantic commits** — one-concept-per-commit.
6. **Benchmark-relevance bar is high.** A paper that *uses* MMLU is not relevant; one that *proposes / critiques / extends* a benchmark is.

## Current benchmark inventory (24)

| Category | Count | Entries |
|---|---:|---|
| **Agent** | 11 | GAIA, τ-bench (+ τ²-bench section), OSWorld, WebArena, BrowseComp, SWE-Lancer, MLE-Bench, GDPval, **Terminal-Bench**, **BFCL**, **AgentBench** |
| **Coding** | 5 | HumanEval, SWE-bench Verified, **SWE-bench Pro**, LiveCodeBench, **ArtifactsBench** |
| **Reasoning** | 4 | GPQA Diamond, AIME 2025, ARC-AGI-2, HLE |
| **Multimodal** | 2 | MMMU, **MMMU-Pro** |
| **Long-context** | 1 | **RULER** |
| **Knowledge** | 1 | MMLU-Pro |
| Safety | 0 | (directory exists, empty) |

Additions marked **bold** were added in session 1 extensions.

## Leaderboard coverage (sources ingested)

- Kimi K2 Instruct model card (huggingface.co/moonshotai/Kimi-K2-Instruct)
- DeepSeek-V3 model card (huggingface.co/deepseek-ai/DeepSeek-V3)
- MiniMax-M2 model card (huggingface.co/MiniMaxAI/MiniMax-M2)
- Claude Sonnet 4.5 launch blog (anthropic.com/news/claude-sonnet-4-5)
- Kimi K1.5 arxiv (2501.12599)
- GLM-4.5 arxiv (2508.06471)
- Qwen3-235B-Instruct-2507 model card
- **MiroThinker-1.7 model card + GitHub README** (huggingface.co/miromind-ai/MiroThinker-1.7)
- **Scale Labs SWE-bench Pro launch** (labs.scale.com/papers/swe-bench-pro)
- **Tencent ArtifactsBench site** (artifactsbenchmark.github.io)

Frontier models covered in leaderboards/overview.md: Claude Sonnet 4/4.5, Claude Opus 4, Claude 3.5 Sonnet, Kimi K2, Kimi K1.5, **MiroThinker 1.7 / v1.5 / v1.0**, MiniMax-M2, GLM-4.5, GPT-5 thinking, GPT-4.1, GPT-4o, Gemini 2.5 Pro, Qwen3-Instruct-2507, DeepSeek-V3, LLaMA-3.1-405B.

## Known open questions / deferred work

1. **GLM-4.6 benchmark table is a PNG image** on the HF page — WebFetch can't read images. Need: either the z.ai blog text, or a paste of the table from Lei.
2. **Gemini 3 Pro** — HLE score present (38.3% via lastexam.ai) but no SWE-bench / MMLU-Pro / other scores yet (no clean WebFetch source).
3. **OpenAI `openai.com/*` returns 403** on every WebFetch. Mitigation: arxiv + HF dataset mirrors.
4. **"One-million-bench"** — no canonical reference located. Ask Lei.
5. **Lei reported** MiroThinker "快到 90%" on BrowseComp and GPT-5.4 Pro at 89+. Verified = MiroThinker-1.7 at 74.0% (per GitHub README + HF card). "GPT-5.4 Pro" — no verifiable source found. Ask Lei for URLs if higher numbers should be tracked.
6. **LARY** (arxiv 2604.11689) still flagged as promotion candidate. Needs decision: does `embodied/robotics` belong in scope?
7. **BFCL** leaderboard rows intentionally left as pointer to live page — next daily update should fetch current top-10 from gorilla.cs.berkeley.edu.
8. **Terminal-Bench v3** is in development — watch for release.
9. **RULER leaderboard** is stub-only; MiniMax-M1 (1M context) and GLM-4.6 (200K) likely report RULER numbers.

## Next-session TODOs

- [ ] **Fetch BFCL live leaderboard** and populate rows.
- [ ] **Fetch GLM-4.6** via alternative channel (paste from Lei, or find a text source).
- [ ] **Fetch Gemini 3 Pro** via working URL.
- [ ] **Populate RULER leaderboard** from model tech reports (long-context-focused models).
- [ ] **Add safety benchmarks** (AgentHarm, HarmBench, AdvBench).
- [ ] **Evaluate more recent HF Daily Papers** for benchmark-relevant items.
- [ ] **Continue daily scan**; LARY promotion decision still open.

## Repo conventions — quick reference

- Each `benchmarks/<cat>/<Name>.md` uses `TEMPLATES/benchmark.md`. Required sections enforced by linter.
- Leaderboard rows: **every row needs a markdown link in the Source column**. Linter will reject otherwise.
- Update log: append a line per session that touches the entry.
- Digest naming: `digests/YYYY-MM-DD.md`. Past digests are immutable; same-day re-runs append under `## Run N`.
- Commit style: small, semantic, one concept per commit; include `Co-Authored-By: Claude Opus 4.6 (1M context) <noreply@anthropic.com>`.

## Quick-reference file map

- [`README.md`](README.md) — human entry point
- [`PLAN.md`](PLAN.md) — design rationale
- [`TECH_PIPELINE.md`](TECH_PIPELINE.md) — architecture + tooling decisions
- [`CLAUDE.md`](CLAUDE.md) — Claude's operating manual
- [`STATUS.md`](STATUS.md) — this file
- [`benchmarks/<cat>/<Name>.md`](benchmarks/) — per-benchmark entries
- [`digests/YYYY-MM-DD.md`](digests/) — one per daily run
- [`leaderboards/overview.md`](leaderboards/overview.md) — cross-benchmark snapshot
- [`.claude/hooks/lint-benchmark-entry.sh`](.claude/hooks/) — PostToolUse linter
- [`.claude/settings.json`](.claude/settings.json) — SessionStart hook + PostToolUse hook
- [`tests/run-fixtures.sh`](tests/) — linter validation fixtures
