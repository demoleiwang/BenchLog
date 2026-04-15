# Leaderboards — cross-benchmark overview

A hand-curated snapshot of how frontier models score across the benchmarks tracked in this repo. Updated whenever a benchmark entry's leaderboard changes.

> Every number below has a source link. Scores from different labs use different harnesses and different metrics — **do not compare values across rows without reading the source.** The per-benchmark page is authoritative.

## Frontier models, latest reported scores

| Model | SWE-bench Verified | GPQA Diamond | AIME 2025 | MMLU-Pro | LiveCodeBench v6 | BrowseComp | Source-reported-by |
|---|---:|---:|---:|---:|---:|---:|---|
| Claude Sonnet 4.5 | 77.2% / 82.0%¹ | — | 88 (AA)² | 88 (AA)² | 71 (AA)² | 19.6% | ¹ [anthropic.com/news/claude-sonnet-4-5](https://www.anthropic.com/news/claude-sonnet-4-5); ² [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| GPT-5 (thinking) | 74.9% | — | — | — | — | 54.9% | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Claude Sonnet 4 | 72.7% | 70.0% | 33.1 | 83.7 | 48.5 | 12.2% | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude Opus 4 | 72.5% | 74.9% | 33.9 | 86.6 | 47.4 | — | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Kimi K2 | 71.6% (multi) / 65.8% (single) | 75.1% | 49.5 | 81.1 | 53.7 | — | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| MiniMax-M2 | 69.4% | — | 78 (AA) | 82 (AA) | 83 (AA) | 44% | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| GLM-4.5 | 64.2% | — | — | — | — | — | [arXiv:2508.06471](https://arxiv.org/abs/2508.06471) |
| Gemini 2.5 Pro | 63.8% | — | — | — | — | 9.9% | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| GPT-4.1 | 54.6% | 66.3% | 37.0 | 81.8 | 44.7 | — | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Qwen3-235B-Instruct-2507 | — | 77.5% | 70.3 | 83.0 | 51.8 | — | [huggingface.co/Qwen/Qwen3-235B-A22B-Instruct-2507](https://huggingface.co/Qwen/Qwen3-235B-A22B-Instruct-2507) |
| DeepSeek-V3 | 42.0% | 68.4%³ / 59.1%⁴ | 46.7 | 81.2³ / 75.9⁴ | 46.9³ / 40.5⁴ | — | ³ [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) ; ⁴ [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| Claude 3.5 Sonnet | 50.8% | 65.0% | — | 78.0 | 36.3 (CoT) | — | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| GPT-4o (0513) | 38.8% | 49.9% | — | 72.6 | 33.4 (CoT) | — | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |

## How to read this table

- "AA" means Artificial Analysis composite score (MiniMax-M2's reporting frame). Not directly comparable to a single-window v6 number — see [LiveCodeBench](../benchmarks/coding/LiveCodeBench.md) for why.
- The "Source-reported-by" column names the lab whose harness produced the row's numbers. For DeepSeek-V3 where two labs reported different numbers, both appear with footnote links to the respective sources.
- Blank cells (`—`) mean "not reported in the sources currently tracked", NOT "zero" or "worse".
- For the full leaderboard with more models / more metrics / more context, see the individual benchmark pages under [`../benchmarks/`](../benchmarks/).

## Notes

- **SWE-bench Verified** spread: 38% (GPT-4o) → 82% (Claude Sonnet 4.5 high-compute) across ~10 months illustrates how fast the frontier moves on agent-style coding.
- **BrowseComp** gap between GPT-5 (54.9%) + MiniMax-M2 (44%) and the rest (≤ 20%) highlights that this benchmark rewards deep-research scaffolds more than raw model quality.
- **AIME**: non-thinking models sit at 30–50, thinking-mode and composite-scored frontiers jump to 70–88. Metric choice matters more than model choice.
- Saturated benchmarks (everyone ≥ 90%) lose discriminative power; see [HumanEval](../benchmarks/coding/HumanEval.md).

## Update log

- 2026-04-15: Initial table. 13 models, 6 headline benchmarks, every cell sourced.
