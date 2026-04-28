# Leaderboards — cross-benchmark overview

A hand-curated snapshot of how frontier models score across the benchmarks tracked in this repo. Updated whenever a benchmark entry's leaderboard changes.

> Every number below has a source link. Scores from different labs use different harnesses and different metrics — **do not compare values across rows without reading the source.** The per-benchmark page is authoritative.

## Frontier models, latest reported scores (2026)

| Model | SWE-bench Verified | GPQA Diamond | AIME 2025 | MMLU-Pro | HLE | LiveCodeBench v6 | BrowseComp | TAU2-Bench | Primary source |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
| **Claude Mythos Preview** (2026-04-08) | **93.9** | **94.6** | — | — | **64.7ᵗ** | — | 86.9 | — | [red.anthropic.com/mythos-preview](https://red.anthropic.com/2026/mythos-preview/) |
| **Claude Opus 4.7** (2026-04-16) | **87.6** | 94.2 | — | — | 46.9 / 54.7ᵗ | — | 79.3 | — | [anthropic.com/news/claude-opus-4-7](https://www.anthropic.com/news/claude-opus-4-7) |
| **DeepSeek V4-Pro Max** (2026-04-24) | 80.6 | 90.1 | — | 87.5 | 37.7 / 48.2ᵗ | **93.5** | 83.4 | — | [HF DS-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| **DeepSeek V4-Flash** (2026-04-24) | 79.0 | — | — | — | — | — | — | — | [api-docs.deepseek.com](https://api-docs.deepseek.com/news/news260424) |
| **GPT-5.5 / GPT-5.5 Pro** (2026-04-23) | — (see SWE-bench Pro 58.6) | 93.6 | — | — | 41.4 / 52.2ᵗ (Pro: 43.1 / 57.2ᵗ) | — | 84.4 / **90.1 (Pro)** | 98.0 (Telecom) | [openai.com/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| **Kimi K2.6** (2026-04-20) | 80.2 | 90.5 | 96.4 (AIME 2026) | — | 34.7 / 54.0ᵗ | 89.6 | 83.2 / **86.3ˢ** | — | [HF Kimi K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| **Hy3-preview** (Tencent Hunyuan 3, 2026-04) | 74.4 | 87.2 | — | — | 30 | — (base: 34.86) | 67.1 | — | [HF Hy3-preview](https://huggingface.co/tencent/Hy3-preview) |
| **Claude Opus 4.7** (OpenAI-reported) | — | 94.2 | — | — | 46.9 / 54.7ᵗ | — | 79.3 | — | [openai.com/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| **Gemini 3.1 Pro** (Kimi/OpenAI-reported) | 80.6 | 94.3 | 98.3 (AIME 2026) | — | 44.4 / 51.4ᵗ | 91.7 | 85.9 | — | [HF Kimi K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) · [openai.com](https://openai.com/index/introducing-gpt-5-5/) |
| **Claude Opus 4.6** (Kimi-reported) | 80.8 | 91.3 | 96.7 (AIME 2026) | — | 40.0 / 53.0ᵗ | 88.8 | 83.7 | — | [HF Kimi K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| **GPT-5.4** (Kimi/OpenAI-reported) | — | 92.8 | 99.2 (AIME 2026) | — | 39.8 / 52.1ᵗ | — | 82.7 | 92.8 (Telecom) | [HF Kimi K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) · [openai.com](https://openai.com/index/introducing-gpt-5-5/) |
| **Kimi K2.5** (2026-01) | 76.8 | 87.6 | 96.1 | 87.1 | 50.2ᵗ | 85.0 | 78.4ˢ / 74.9ᶜ / 60.6 | — | [HF Kimi K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| **Qwen3.5-397B-A17B** (2026-02) | 76.4 | 88.4 | — | 87.8 | 48.3ᵗ / 28.7 | 83.6 | 78.6 | 86.7 | [HF Qwen3.5](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| **GPT-5.2** (Kimi/Qwen-reported) | 80.0 | 92.4 | 100 | 86.7 / 87.4 | 45.5ᵗ | 87.7 | 65.8 | 87.1 | [HF Kimi K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) · [HF Qwen3.5](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| **Claude 4.5 Opus** | 80.9 | 87.0 | 92.8 | 89.3 / 89.5 | 43.2ᵗ | 82.2 / 84.8 | 37.0 / 62.4 | 91.6 | [HF Kimi K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) · [HF Qwen3.5](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| **Gemini 3 Pro** | 76.2 | 91.9 | 95.0 | 89.8 / 90.1 | 45.8ᵗ / 48.0ᵛ | 87.4 | 37.8 | 85.4 | [HF Kimi K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) · [HF Qwen3.5](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| **DeepSeek V3.2** | 73.1 | 82.4 | 93.1 | 85.0 | 40.8ᵗ | 83.3 | 51.4 | — | [HF Kimi K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| **Meta Muse Spark** (2026-04-08) | — | — | — | — | 58 (Contemplating) | — | — | — | [ai.meta.com](https://ai.meta.com/blog/introducing-muse-spark-msl/) |
| Claude Sonnet 4.5 | 77.2 / 82.0 | — | 88 (AA) | 88 (AA) | 13.7 | 71 (AA) | 19.6 | — | [anthropic.com](https://www.anthropic.com/news/claude-sonnet-4-5) · [HF MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| **MiroThinker-1.7** (2026-04, MiroMind) | — | — | — | — | 42.9ᵗ | — | 74.0 (plus 75.3 BrowseComp-ZH) | — | [HF MiroThinker-1.7](https://huggingface.co/miromind-ai/MiroThinker-1.7) |
| Kimi K2 | 71.6 / 65.8 | 75.1 | 49.5 | 81.1 | — | 53.7 | — | — | [HF Kimi K2](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| MiniMax-M2 | 69.4 | — | 78 (AA) | 82 (AA) | — | 83 (AA) | 44 | — | [HF MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| GLM-4.5 | 64.2 | — | — | — | — | — | — | 70.1 (TAU-bench) | [arXiv:2508.06471](https://arxiv.org/abs/2508.06471) |
| Qwen3-235B-Instruct-2507 | — | 77.5 | 70.3 | 83.0 | — | 51.8 | — | — | [HF Qwen3-Instruct](https://huggingface.co/Qwen/Qwen3-235B-A22B-Instruct-2507) |
| DeepSeek-V3 | 42.0 | 68.4 / 59.1 | 46.7 | 81.2 / 75.9 | — | 46.9 / 40.5 | — | — | [HF DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |

### Legend

- Bold model names = 2026 frontier releases verified this session.
- `ᵗ` = HLE-Full with tools (higher than base HLE) per reporting convention.
- `ᵛ` = HLE-Verified subset.
- `ˢ` = Agent Swarm scaffold / `ᶜ` = context-management scaffold / no superscript = no scaffold.
- Two numbers like `89.3 / 89.5` = same model scored by different labs (Kimi K2.5 card vs Qwen3.5 card). Both are legitimate; divergences live on the per-benchmark pages.
- Blank cells = not reported in sources currently tracked, NOT "zero".

## How to read this table

- **SWE-bench Verified**: frontier compressed into a 73–82 band; differences within 5 points are within harness noise.
- **BrowseComp**: scaffold dominates. Kimi K2.5 swings from 60.6% (no scaffold) to 78.4% (Agent Swarm) on the same underlying model. Always quote the scaffold.
- **HLE**: frontier ceiling — Muse Spark's 58% (Contemplating mode) is the highest number tracked, but it used a bespoke reasoning mode. Base HLE scores cluster 28–42%; with-tools 40–50%.
- **AIME 2025**: saturation in progress. GPT-5.2 reportedly hit 100%. These numbers likely use thinking-mode + majority-voting.
- Values within cells can't be mechanically summed; use the per-benchmark page for fair comparison.

## Release timeline (this session's frontier batch)

```
2026-01-29   Kimi K2.5           (Moonshot AI)
2026-02      Qwen3.5-397B        (Alibaba)
2026-03-05   GPT-5.4 Thinking    (OpenAI — system card published; benchmark scores NOT in card)
2026-04-08   Meta Muse Spark     (Meta — HLE only disclosed)
2026-04-08   Claude Mythos Prev  (Anthropic — Project Glasswing consortium access only)
2026-04      MiroThinker-1.7     (MiroMind AI — user's team)
2026-04      Hy3-preview         (Tencent Hunyuan team — reconstructed, agent-focused)
2026-04-20   Kimi K2.6           (Moonshot AI — 1T/32B, Agent Swarm 300 sub-agents)
2026-04-16   Claude Opus 4.7     (Anthropic — SWE-bench V 87.6, SWE Pro 64.3, public release)
2026-04-23   GPT-5.5 / 5.5 Pro   (OpenAI — agentic coding lead, 1M context)
2026-04-24   DeepSeek V4-Pro/Flash (DeepSeek — 1.6T/49B + 284B/13B, 1M context, Apache 2.0; LiveCodeBench 93.5 SOTA)
```

**Observations:**

- GPT-5.2 (Kimi- and Qwen-reported) headlines most benchmarks; OpenAI's own benchmark numbers for **GPT-5.4** are not publicly discoverable — the Thinking system card emphasizes cyber/biosec metrics, not SWE-bench / HLE.
- Gemini 3 Pro edges the general-knowledge (MMLU-Pro, MMMU) axis.
- Claude 4.5 Opus leads on agent benchmarks (TAU2-Bench 91.6, BFCL V4 77.5).
- Kimi K2.5 Agent Swarm is current OSS SOTA on BrowseComp at 78.4%.

**2026-04-24 batch (Mythos / K2.6 / Hy3 / GPT-5.5):**

- **Claude Mythos Preview defines a new ceiling** on SWE-bench Verified (93.9%, +13 pt over Opus 4.6), GPQA Diamond (94.6%), HLE w/ tools (64.7%, +10 pt over next best), and OSWorld (79.6%).
- **GPT-5.5 leads agentic coding** (Terminal-Bench 82.7%, Expert-SWE 73.1%) and **GPT-5.5 Pro leads BrowseComp at 90.1%** — the user's session-1 hypothesis of GPT-5.4 Pro "89+" is now confirmed.
- **Kimi K2.6 Agent Swarm 86.3% on BrowseComp** is the new Kimi SOTA; still open-weights. Also tops WideSearch (80.8) and DeepSearchQA (92.5 f1).
- **FrontierMath Tier 4 jumps from 13% (GPT-5 Pro, 2025-10) to 39.6% (GPT-5.5 Pro, 2026-04-23)** — a 3× lift in 6 months.
- **Gemini 3.1 Pro tops LiveCodeBench v6 (91.7) and MMMU-Pro w/ python (85.3)** and is tied or narrowly behind Mythos on GPQA (94.3 vs 94.6).
- **Hy3-preview** is the cheap-efficiency story: 295B/21B active reaches 74.4% SWE-bench Verified and 87.2 GPQA at a much lower parameter count than peers.
- **DeepSeek V4** unreleased — no verified numbers to report despite pre-release leaks of ~81% SWE-bench. Track for next run.

**2026-04-28 follow-on batch (Opus 4.7 primary + DeepSeek V4):**

- **Claude Opus 4.7 (2026-04-16) primary source resolved** — Anthropic launch confirms SWE-bench Verified 87.6% and SWE-bench Pro 64.3% (Anthropic-reported). These are Opus 4.7's own self-reports; the GPT-5.5 launch table's separately-derived Opus 4.7 numbers (94.2 GPQA, 79.3 BrowseComp, 54.7 HLE) are OpenAI-reported and represent an independent harness.
- **DeepSeek V4-Pro Max (2026-04-24)** is open-weights frontier, 1.6T/49B MoE under Apache 2.0. Codeforces rating 3,206 surpasses GPT-5.4's 3,168 — first model to top GPT-5 on competitive programming. **LiveCodeBench v6: 93.5 (new SOTA)**. SWE-bench Verified 80.6 (essentially tied with Opus 4.6).
- **DeepSeek V4-Flash** is the cheap-API story: 284B/13B at $0.28/M output, 79.0% SWE-bench Verified. The cheapest credible coding model now.
- **GLM-5.1 Thinking** appears as a peer model in DeepSeek V4 tables (SWE Pro 58.4, GPQA 86.2, HMMT 89.4) — track for own entry next session.
- April 2026 release cadence: 5-day window (Apr 20–24) saw Kimi K2.6, GPT-5.5, DeepSeek V4-Pro/Flash launch consecutively; the densest frontier-release stretch of 2026 to date.

## Update log

- 2026-04-15: Initial table
- 2026-04-15 (session 1 extension): rebuilt with Kimi K2.5 (2026-01-29) and Qwen3.5-397B (2026-02) as frontier anchors. Pulled GPT-5.2, Claude 4.5 Opus, Gemini 3 Pro, DeepSeek V3.2 cross-reported scores from those cards. Added Muse Spark HLE row. Noted GPT-5.4 Thinking system card (2026-03-05) does not publish core benchmark scores.
- 2026-04-24: added 8 new frontier rows at the top — Claude Mythos Preview (new absolute ceiling), GPT-5.5 / GPT-5.5 Pro (OpenAI 2026-04-23), Kimi K2.6 (open-weights, Agent Swarm 300 sub-agents), Hy3-preview (Tencent), plus Kimi/OpenAI-reported Opus 4.7, Opus 4.6, Gemini 3.1 Pro, GPT-5.4. Re-wrote observations to cover new SOTA holders. Release timeline now anchored at 2026-04-23 GPT-5.5 launch. DeepSeek V4 tracked as pending (not added to overview rows).
- 2026-04-28: added 3 rows — Claude Opus 4.7 (Anthropic primary source resolved, SWE-bench V 87.6 / Pro 64.3), DeepSeek V4-Pro Max (open-weights frontier, LiveCodeBench 93.5 new SOTA, Codeforces 3,206), DeepSeek V4-Flash (cheap tier, $0.28/M output). Release timeline updated: Opus 4.7 (2026-04-16), DeepSeek V4 (2026-04-24). 5-day window Apr 20–24 saw 3 consecutive frontier launches (K2.6 / GPT-5.5 / V4) — densest stretch of 2026.
