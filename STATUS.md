# STATUS — BenchLog current state

_This file is auto-loaded at the start of every Claude session via the `SessionStart` hook. Read it first to know what's already been done and what's pending. Claude MUST update this file at the end of every working session._

_Last updated: 2026-04-28 (session 3 — DeepSeek V4 launch + Opus 4.7 primary source + 10 prior-session benchmark entries committed)_

---

## Repo at a glance

- **URL**: https://github.com/demoleiwang/BenchLog
- **Branch**: `main`
- **Entries**: **57 benchmarks** across 7 active categories; 3 digests (2026-04-15, 2026-04-24, 2026-04-28); cross-benchmark overview with 25 frontier models.
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

## Current benchmark inventory (57)

| Category | Count | Entries |
|---|---:|---|
| Agent | 28 | — see grouping below |
| Coding | 8 | HumanEval, SWE-bench Verified, SWE-bench Pro, Multi-SWE-Bench, LiveCodeBench, **Aider-Polyglot, BigCodeBench**, ArtifactsBench |
| Reasoning | 7 | GPQA Diamond, AIME 2025 (+ 2024 + 2026 companion), HMMT 2025 (+ Feb 2026 rows), ARC-AGI-2, HLE, FrontierMath, FrontierScience |
| Knowledge | 4 | MMLU-Pro, SuperGPQA, HealthBench, **SimpleQA** (+ Verified + Chinese-SimpleQA companion) |
| Multimodal | 5 | MMMU, MMMU-Pro, **CharXiv, MathVista, VideoMME** |
| Long-context | 2 | RULER, **LongBench-v2** |
| Safety | 4 | ClawsBench, **AgentHarm, HarmBench, WMDP** |

Session 3 additions in **bold** (10 new entries).

### Agent sub-groups (28 entries)

- **Assistant / general** (2): GAIA, AgentBench
- **Tool use** (5): τ-bench (+ τ²-bench + TAU2 overall), BFCL, MCPMark, MCP-Bench, Tool-Decathlon
- **GUI / Web / Mobile** (9): OSWorld, WebArena, VisualWebArena, Mind2Web, Online-Mind2Web, AndroidWorld, ScreenSpot-Pro, ClawBench, Terminal-Bench
- **Deep research** (4): BrowseComp (+ BrowseComp-ZH), DeepSearchQA, WideSearch, DeepResearch-Bench
- **Planning / skills** (3): DeepPlanning, SkillsBench, VitaBench
- **Domain-specific** (4): SWE-Lancer, MLE-Bench, **MLR-Bench**, GDPval
- **Trajectory-aware eval** (1): **Claw-Eval**

Round 7 (2026-04-15) additions in **bold** — 6 entries from frontier-lab tech reports + Lei's "Claw-Eval, MLR-Bench, FrontierScience" prompt.

## Leaderboard coverage (sources ingested across all runs)

**Tech reports / model cards with cross-tabulated benchmark data:**
- **DeepSeek V4-Pro** (huggingface.co/deepseek-ai/DeepSeek-V4-Pro, 2026-04-24) — **richest source on agent / coding / SimpleQA / MMLU-Pro**; covers Opus 4.6 max, GPT-5.4 xHigh, Gemini 3.1 Pro high, K2.6 Thinking, GLM-5.1 Thinking, V4-Pro Max
- **Claude Opus 4.7 launch** (anthropic.com/news/claude-opus-4-7, 2026-04-16) — Anthropic primary; SWE-bench Verified 87.6%, SWE-bench Pro 64.3%, CursorBench 70%
- **Kimi K2.6** (huggingface.co/moonshotai/Kimi-K2.6) — covers GPT-5.4, Claude Opus 4.6, Gemini 3.1 Pro, Kimi K2.5, Kimi K2.6 across agent / coding / reasoning / vision
- **GPT-5.5 launch** (openai.com/index/introducing-gpt-5-5 — 403s but kingy.ai / infoq / startup-fortune aggregators reproduce OpenAI's self-reported data verbatim) — covers GPT-5.5 / 5.5 Pro / Opus 4.7 / Gemini 3.1 Pro / GPT-5.4
- **Claude Mythos Preview** (red.anthropic.com/2026/mythos-preview) — covers Mythos vs Opus 4.6 / GPT-5.4 across coding / reasoning / cyber / long-context
- **Hy3-preview** (huggingface.co/tencent/Hy3-preview) — Hy3 base + instruct vs Kimi-K2 BASE / DeepSeek-V3 BASE / GLM-4.5 BASE; most Instruct benchmarks are image-only
- Kimi K2.5 (huggingface.co/moonshotai/Kimi-K2.5) — covers GPT-5.2, Claude 4.5 Opus, Gemini 3 Pro, DeepSeek V3.2, Kimi K2.5
- Qwen3.5-397B-A17B (huggingface.co/Qwen/Qwen3.5-397B-A17B) — covers same frontier list + vision
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

**Frontier models now covered in leaderboards/overview.md:** Kimi K2.5, Kimi K2.6, **Kimi K2.6 Thinking (DS-reported)**, Qwen3.5-397B, GPT-5.2, GPT-5.4, GPT-5.5, GPT-5.5 Pro, Claude 4.5 Opus, Claude Opus 4.6, **Claude Opus 4.7 (Anthropic primary, new)**, Claude Mythos Preview, Gemini 3 Pro, Gemini 3.1 Pro, DeepSeek V3.2, **DeepSeek V4-Pro Max, DeepSeek V4-Flash (new)**, **GLM-5.1 Thinking (DS-reported, new)**, Hy3-preview / Tencent Hunyuan 3, Meta Muse Spark, Claude Sonnet 4/4.5, MiroThinker 1.7/v1.5/v1.0, Kimi K2, MiniMax-M2, GLM-4.5, Qwen3-Instruct-2507, DeepSeek-V3, LLaMA-3.1-405B, GPT-4o, GPT-4.1, Claude 3.5 Sonnet.

## Confirmed model versions (for cross-reference)

Versions confirmed via benchmark pages / leaderboards:

### Session 1 (2026-04-15):
- **Claude Opus 4.6** (2026-04) — top on PinchBench/SkillsBench at 93.3% best. Confirmed existing.
- **Claude Sonnet 4.6** (2026-04) — ClawBench paper reports 33.3%. Confirmed existing.
- **GPT-5.4 / GPT-5.4 Thinking / GPT-5.4 Pro** — system card 2026-03-05, benchmark data sparse. PinchBench shows GPT-5.4 at 90.5%.
- **GPT-5.2** — 2025/early 2026, widely used in Kimi K2.5 and Qwen 3.5 comparison tables.
- **MiniMax M2.7** — confirmed via PinchBench (89.8% best).
- **Qwen 3.5-27B** — smaller variant, on PinchBench at 90.0% best.
- **Trinity Large Thinking** (Arcee AI) — new frontier contender, PinchBench 91.9%.

### Session 3 (2026-04-28) — new releases since session 2:
- **Claude Opus 4.7** (Anthropic, 2026-04-16) — public, generally available. SWE-bench Verified 87.6%, SWE-bench Pro 64.3%, CursorBench 70%. Same pricing as Opus 4.6 ($5/$25 per M tokens). Primary source: anthropic.com/news/claude-opus-4-7. **Resolves session-2 STATUS open item #12.**
- **DeepSeek V4-Pro / V4-Flash** (DeepSeek, 2026-04-24) — V4-Pro 1.6T total / 49B active; V4-Flash 284B / 13B; both 1M context, FP4+FP8, Apache 2.0. Codeforces 3,206 (V4-Pro) tops GPT-5.4's 3,168 — first model to beat GPT-5 on competitive programming. LiveCodeBench v6 93.5 (new SOTA). SWE-bench Verified 80.6 (V4-Pro) / 79.0 (V4-Flash). MRCR 1M shows Opus 4.6 still leads at 92.9 vs V4-Pro 83.5. Source: huggingface.co/deepseek-ai/DeepSeek-V4-Pro. **Resolves session-2 STATUS open item #11.**
- **Kimi K2.6 Thinking** — DS V4 card calls Kimi K2.6 "K2.6 Thinking" (vs base K2.6 in Kimi's own card). Confirms Moonshot ships a thinking variant; need to verify naming.
- **GLM-5.1 Thinking** (Z.ai) — appears as peer model in DS V4 launch table. SWE Pro 58.4, GPQA 86.2, HMMT Feb 2026 89.4, MMLU-Pro 86.0. Need to find primary release source for own entry next session.

### Session 2 (2026-04-24) — releases:
- **Claude Mythos Preview** (Anthropic, 2026-04-08, codename Capybara) — consortium-only under Project Glasswing (12 tech/finance cos, $100M credits). SOTA on SWE-bench Verified 93.9%, GPQA 94.6%, HLE w/ tools 64.7%, OSWorld 79.6%. Source: red.anthropic.com/2026/mythos-preview/. **Resolves session-1 STATUS open item #4.**
- **Kimi K2.6** (Moonshot, 2026-04-20) — 1T/32B MoE, 256K, native multimodal. Agent Swarm scales to **300 sub-agents, 4,000 steps**. Full benchmark table in HF card. Source: huggingface.co/moonshotai/Kimi-K2.6.
- **Hy3-preview** (Tencent Hunyuan team, 2026-04) — 295B MoE / 21B active + 3.8B MTP. Agent-focused "reconstruction" model. Most Instruct benchmarks rendered as PNG images in HF card (blocker for WebFetch). Source: huggingface.co/tencent/Hy3-preview.
- **GPT-5.5 / GPT-5.5 Pro** (OpenAI, 2026-04-23) — headline is agentic coding. Terminal-Bench 82.7%, BrowseComp Pro 90.1% (new SOTA), ARC-AGI-2 85.0%. 1M context; pricing $5/$30 per MTok (Pro: $30/$180). Source: openai.com/index/introducing-gpt-5-5 (403s but data reproduced via kingy.ai / infoq).
- **GPT-5.4** — now widely cross-reported in Kimi K2.6 and OpenAI GPT-5.5 launch tables. AIME 2026 99.2, HMMT Feb 2026 97.7.
- **Claude Opus 4.7** — appears in GPT-5.5 comparison tables. HLE no-tools 46.9%, GPQA 94.2%, BrowseComp 79.3%. No direct Anthropic launch post found yet.
- **Gemini 3.1 Pro (thinking high)** — widely cross-reported. Tops LiveCodeBench v6 (91.7), MMMU-Pro w/python (85.3), AIME 2026 (98.3).
- **DeepSeek V4** — still unreleased 2026-04-24. Rumored 1T/1M context, Huawei Ascend 950PR silicon, Apache 2.0. Benchmark claims (81% SWE-bench, 90% HumanEval) are leaks, unverified.

## Active discrepancies to verify

- **Meta Muse Spark on HLE**: BenchLog has 58% (from a direct WebFetch of [ai.meta.com/blog/introducing-muse-spark-msl/](https://ai.meta.com/blog/introducing-muse-spark-msl/) in Run 3). Subsequent search-aggregator coverage (Run 7) consistently reports **50.2%**. Primary-source fetch may have mis-extracted; treat the 58% as suspect and re-verify by manual page read or alternative source. Same source for FrontierScience Research = 38% (Run 3) / 38.3% (Run 7) — close enough that rounding explains it; 50.2 vs 58 is not.

## Known sources that FAIL WebFetch

- **openai.com/\*** returns 403 on every launch page. Mitigate via arxiv + HF dataset mirrors + `deploymentsafety.openai.com` + `developers.openai.com/api/docs`.
- **OpenAI system card PDFs** — WebFetch can't parse binary PDFs. Need user to paste text or use a text-extraction alternative.
- **z.ai/blog** — returned empty HTML for GLM-4.6. Use arxiv (`2508.06471` is GLM-4.5 paper) as fallback.
- **Hugging Face pages that render benchmark tables as images** — WebFetch cannot read images (GLM-4.6 example).

## Known open questions / deferred work

1. ~~**GPT-5.4 Pro / GPT-5.4 Thinking** — launch page 403s.~~ **Partially resolved 2026-04-24:** GPT-5.5 launch (via aggregators) publishes GPT-5.4 cross-reported scores. GPT-5.4 BrowseComp 82.7%, GPQA 92.8%, HLE w/ tools 52.1%, Terminal-Bench 75.1%. GPT-5.4 Pro specific scores still not broken out separately (GPT-5.5 Pro is the current Pro tier). User's "89+" memory for GPT-5.4 Pro now corroborated by GPT-5.5 Pro BrowseComp 90.1%.
2. **Lei reported** MiroThinker-1.7 "近 90%" on BrowseComp — still above highest public 74.0%. If internal H1 numbers exist, needs a source URL.
3. **ByteDance Seed 2.0** — still not found on HF. **Ask Lei**.
4. ~~**Claude Mythos**~~ — **RESOLVED 2026-04-24:** `red.anthropic.com/2026/mythos-preview/` is the canonical URL. Anthropic released the preview 2026-04-08 under consortium access (Project Glasswing).
5. **GLM-4.6** — benchmark table still PNG-only. **Carry over.**
6. **Gemini 3 Pro / 3.1 Pro** — now extensively cross-reported via Kimi K2.6 and OpenAI GPT-5.5 launch. Direct Google launch blog still not fetched; nonblocking.
7. **"One-million-bench"** — still unresolved. Skip unless user clarifies.
8. **LARY** (arxiv 2604.11689) — still a promotion candidate. **Carry over.**
9. **BFCL V4 live leaderboard** — still just partial rows + pointer to live page. **Carry over.**
10. **RULER leaderboard** — stub only. Target: MiniMax-M1, GLM-4.6, Kimi K2.6 (256K) context reports. **Carry over.**
11. ~~**DeepSeek V4**~~ — **RESOLVED 2026-04-28:** V4-Pro / V4-Flash launched 2026-04-24 on HF. Numbers ingested.
12. ~~**Claude Opus 4.7**~~ — **RESOLVED 2026-04-28:** Anthropic primary at anthropic.com/news/claude-opus-4-7 (released 2026-04-16). SWE-bench Verified 87.6%, SWE-bench Pro 64.3%.
13. **Hy3-preview Instruct scores** — most numbers are in PNG files in HF card. **Carry over.**
14. **Promote-next-run benchmarks** (carried from 2026-04-24 + 2026-04-28 digests): Cybench / CyberGym, Graphwalks, MRCR v2, MRCR 1M, CorpusQA 1M, USAMO, MCP Atlas / MCPAtlas Public, SWE-Bench Multilingual, IMO-AnswerBench, SciCode, OJBench, MathVision, BabyVision, BixBench, Apex / Apex Shortlist (DS V4 metric — verify origin).
15. **GLM-5.1 Thinking primary source** — track release on z.ai or HF.
16. **Kimi K2.6 Thinking naming clarification** — separate variant or harness label?

## Next-session TODOs

- [ ] **Ask Lei** for the MiroThinker-H1 scaffold / benchmark numbers (if internal).
- [ ] **Ask Lei** about Seed 2.0 — correct name / source URL.
- [x] ~~**Ask Lei** about Claude Mythos~~ — RESOLVED via red.anthropic.com/2026/mythos-preview/.
- [ ] **Fetch GLM-4.6** via alternative channel.
- [ ] **Populate RULER leaderboard** from long-context-focused tech reports (Kimi K2.6 256K card; GPT-5.5 MRCR v2 data).
- [x] ~~**Add safety benchmarks**~~ — committed 2026-04-28: AgentHarm, HarmBench, WMDP entries.
- [ ] **Fetch BFCL V4 full top-10 from live page** during next daily run.
- [ ] **Continue daily HF Papers / arxiv scan**; LARY promotion decision still open.
- [ ] **Add SWE-Bench Multilingual** as own entry (or extend Multi-SWE-Bench).
- [ ] **Write new benchmark entries for promoted candidates**: Cybench, Graphwalks, MRCR (v2 and 1M), CorpusQA 1M, USAMO, MCP Atlas, IMO-AnswerBench, SciCode, OJBench, MathVision, BabyVision, BixBench, Apex / Apex Shortlist.
- [x] ~~**Find primary Anthropic source for Claude Opus 4.7**~~ — RESOLVED 2026-04-28 (anthropic.com/news/claude-opus-4-7).
- [x] ~~**DeepSeek V4 release watch**~~ — RESOLVED 2026-04-28 (V4-Pro / V4-Flash on HF).
- [x] ~~**Check untracked files**~~ — RESOLVED 2026-04-28: all 10 committed (Aider-Polyglot, BigCodeBench, SimpleQA, LongBench-v2, CharXiv, MathVista, VideoMME, AgentHarm, HarmBench, WMDP).
- [ ] **Find GLM-5.1 Thinking primary source** (z.ai or HF) and seed leaderboard entries.
- [ ] **Verify Kimi K2.6 Thinking naming** — separate variant or harness?
- [ ] **Backfill DS V4 numbers into Aider-Polyglot, BigCodeBench, MathVista, CharXiv, VideoMME entries** — DS V4 card likely has these but the WebFetch summary didn't include them. Re-fetch with focused prompts next run.

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
