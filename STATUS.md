# STATUS — BenchLog current state

_This file is auto-loaded at the start of every Claude session via the `SessionStart` hook. Read it first to know what's already been done and what's pending. Claude MUST update this file at the end of every working session._

_Last updated: 2026-04-15 (session 1, Run 3 end — 3 refresh cycles in one session)_

---

## Repo at a glance

- **URL**: https://github.com/demoleiwang/BenchLog
- **Branch**: `main`
- **Entries**: **24 benchmarks** across 6 active categories; 1 digest (2026-04-15, 3 runs appended); cross-benchmark overview with 14 frontier models.
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
6. **Benchmark-relevance bar is high.**
7. **Label scaffold / harness on every agent-benchmark score** — "BrowseComp 78.4%" means nothing without "(Agent Swarm)".

## Current benchmark inventory (24)

| Category | Count | Entries |
|---|---:|---|
| Agent | 11 | GAIA, τ-bench (+ τ²-bench section + TAU2 overall), OSWorld, WebArena, BrowseComp (+ BrowseComp-ZH), SWE-Lancer, MLE-Bench, GDPval, Terminal-Bench, BFCL, AgentBench |
| Coding | 5 | HumanEval, SWE-bench Verified, SWE-bench Pro, LiveCodeBench, ArtifactsBench |
| Reasoning | 4 | GPQA Diamond, AIME 2025 (+ 2024 companion), ARC-AGI-2, HLE |
| Multimodal | 2 | MMMU, MMMU-Pro |
| Long-context | 1 | RULER |
| Knowledge | 1 | MMLU-Pro |
| Safety | 0 | (directory exists, empty) |

## Leaderboard coverage (sources ingested across all runs)

**Tech reports / model cards with cross-tabulated benchmark data:**
- Kimi K2.5 (huggingface.co/moonshotai/Kimi-K2.5) — **richest source**; covers GPT-5.2, Claude 4.5 Opus, Gemini 3 Pro, DeepSeek V3.2, Kimi K2.5
- Qwen3.5-397B-A17B (huggingface.co/Qwen/Qwen3.5-397B-A17B) — second-richest; covers same frontier list + vision
- Kimi K2 Instruct (huggingface.co/moonshotai/Kimi-K2-Instruct) — covers Claude 4, GPT-4.1, earlier comparisons
- DeepSeek-V3 (huggingface.co/deepseek-ai/DeepSeek-V3) — historical anchors (2024)
- MiniMax-M2 (huggingface.co/MiniMaxAI/MiniMax-M2) — MiniMax-M2, Claude Sonnet 4/4.5, Gemini 2.5 Pro, GPT-5 thinking
- Qwen3-235B-Instruct-2507 (huggingface.co/Qwen/Qwen3-235B-A22B-Instruct-2507)

**Launch blogs / announcements:**
- Anthropic Sonnet 4.5 (anthropic.com/news/claude-sonnet-4-5)
- Meta Muse Spark (ai.meta.com/blog/introducing-muse-spark-msl) — HLE only
- Scale Labs SWE-bench Pro (labs.scale.com/papers/swe-bench-pro)

**Papers:**
- GLM-4.5 (arxiv.org/abs/2508.06471)
- Kimi K1.5 (arxiv.org/abs/2501.12599)

**Project pages:**
- MiroThinker (huggingface.co/miromind-ai/MiroThinker-1.7 + github.com/MiroMindAI/MiroThinker)
- Terminal-Bench (tbench.ai)
- ArtifactsBench (artifactsbenchmark.github.io)
- BFCL (gorilla.cs.berkeley.edu/leaderboard.html)

**Frontier models now covered in leaderboards/overview.md:** Kimi K2.5, Qwen3.5-397B, GPT-5.2 (Kimi/Qwen-reported), Claude 4.5 Opus, Gemini 3 Pro, DeepSeek V3.2, Meta Muse Spark, Claude Sonnet 4/4.5, MiroThinker 1.7/v1.5/v1.0, Kimi K2, MiniMax-M2, GLM-4.5, Qwen3-Instruct-2507, DeepSeek-V3, LLaMA-3.1-405B, GPT-4o, GPT-4.1, Claude 3.5 Sonnet.

## Known sources that FAIL WebFetch

- **openai.com/\*** returns 403 on every launch page. Mitigate via arxiv + HF dataset mirrors + `deploymentsafety.openai.com` + `developers.openai.com/api/docs`.
- **OpenAI system card PDFs** — WebFetch can't parse binary PDFs. Need user to paste text or use a text-extraction alternative.
- **z.ai/blog** — returned empty HTML for GLM-4.6. Use arxiv (`2508.06471` is GLM-4.5 paper) as fallback.
- **Hugging Face pages that render benchmark tables as images** — WebFetch cannot read images (GLM-4.6 example).

## Known open questions / deferred work

1. **GPT-5.4 Pro / GPT-5.4 Thinking** — published system card (2026-03-05) does NOT publish SWE-bench / BrowseComp / HLE scores. Launch page 403s. Benchmark data is currently unreachable via WebFetch. **Ask Lei for any tech-report PDF or extracted table.**
2. **Lei reported** MiroThinker-1.7 "近 90%" on BrowseComp and GPT-5.4 Pro "89+". Neither verifiable from public sources as of this session. Highest public BrowseComp is **Kimi K2.5 Agent Swarm 78.4%**. If Lei has internal MiroThinker-H1 numbers not yet public, he needs to share a source URL to include them.
3. **ByteDance Seed 2.0** — not found on HF. Latest ByteDance-Seed model is Seed1.5-VL (2025-06). May be API-only or different name; **ask Lei**.
4. **Claude Mythos** — referenced as "Mythos preview" in Anthropic news footer, possibly under Project Glasswing. Dedicated URL (`/news/glasswing-mythos`, `/mythos`) returns 404. **Needs working URL**.
5. **GLM-4.6** — benchmark table is a PNG image; WebFetch can't read. Consider pasting the table.
6. **Gemini 3 Pro** — solid cross-reporting via Kimi K2.5 and Qwen3.5; launch blog not directly fetched (deepmind.google might work).
7. **"One-million-bench"** — never resolved. Skip unless user clarifies.
8. **LARY** (arxiv 2604.11689) — still a promotion candidate. Needs category decision.
9. **BFCL V4 live leaderboard** — still just partial rows + pointer to live page. Could extract more top-10.
10. **RULER leaderboard** — stub only. Target fetches: MiniMax-M1, GLM-4.6, long-context-focused tech reports.

## Next-session TODOs

- [ ] **Ask Lei** for the MiroThinker-H1 scaffold / benchmark numbers (if internal).
- [ ] **Ask Lei** about Seed 2.0 — correct name / source URL.
- [ ] **Ask Lei** about Claude Mythos — correct URL.
- [ ] **Fetch GLM-4.6** via alternative channel.
- [ ] **Populate RULER leaderboard** from long-context-focused tech reports (Kimi K2.5 256K context may have RULER numbers — didn't fully extract).
- [ ] **Add safety benchmarks** (AgentHarm, HarmBench, AdvBench).
- [ ] **Fetch BFCL V4 full top-10 from live page** during next daily run.
- [ ] **Continue daily HF Papers / arxiv scan**; LARY promotion decision still open.
- [ ] **Add Multi-SWE-Bench, SecCodeBench** — mentioned in Qwen3.5 table but not yet own entries.

## Useful "labeling" reminders

- **BrowseComp rows** must name the scaffold: no-scaffold / context-mgmt / Agent Swarm / Deep Research. Same model can swing 20+ points.
- **Model names**: use the full verbatim name. "Claude 4.5 Opus" ≠ "Claude Opus 4" — they are different releases. "Kimi K2" ≠ "Kimi K2.5". "GPT-5.2" ≠ "GPT-5" ≠ "GPT-5 (thinking)".
- **Labs' self-reported numbers** should be labelled "self-reported, YYYY-MM"; cross-reported numbers should be labelled "(X-reported)" to flag the harness.
- **AIME metric**: Pass@1 / Avg@64 / AA composite / maj@k — always specify.

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
- [`.claude/settings.json`](.claude/settings.json) — SessionStart + PostToolUse hooks
- [`tests/run-fixtures.sh`](tests/) — linter validation fixtures
