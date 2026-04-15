# Leaderboards — cross-benchmark overview

A hand-curated snapshot of how frontier models score across the benchmarks tracked in this repo. Updated whenever a benchmark entry's leaderboard changes.

> Every number below has a source link. Scores from different labs use different harnesses and different metrics — **do not compare values across rows without reading the source.** The per-benchmark page is authoritative.

## Frontier models, latest reported scores (2026)

| Model | SWE-bench Verified | GPQA Diamond | AIME 2025 | MMLU-Pro | HLE | LiveCodeBench v6 | BrowseComp | TAU2-Bench | Primary source |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
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
2026-04      MiroThinker-1.7     (MiroMind AI — user's team)
```

**Observations:**

- GPT-5.2 (Kimi- and Qwen-reported) headlines most benchmarks; OpenAI's own benchmark numbers for **GPT-5.4** are not publicly discoverable — the Thinking system card emphasizes cyber/biosec metrics, not SWE-bench / HLE.
- Gemini 3 Pro edges the general-knowledge (MMLU-Pro, MMMU) axis.
- Claude 4.5 Opus leads on agent benchmarks (TAU2-Bench 91.6, BFCL V4 77.5).
- Kimi K2.5 Agent Swarm is current OSS SOTA on BrowseComp at 78.4%.

## Update log

- 2026-04-15: Initial table
- 2026-04-15 (session 1 extension): rebuilt with Kimi K2.5 (2026-01-29) and Qwen3.5-397B (2026-02) as frontier anchors. Pulled GPT-5.2, Claude 4.5 Opus, Gemini 3 Pro, DeepSeek V3.2 cross-reported scores from those cards. Added Muse Spark HLE row. Noted GPT-5.4 Thinking system card (2026-03-05) does not publish core benchmark scores.
