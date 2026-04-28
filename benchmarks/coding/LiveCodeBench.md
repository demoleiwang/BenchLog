# LiveCodeBench

> A contamination-resistant coding benchmark that continuously ingests problems from LeetCode, AtCoder, and Codeforces and windows them by release date, so you can evaluate a model only on problems that appeared after its training cutoff.

|  |  |
|---|---|
| **Category** | coding |
| **Released** | 2024-03 (v1 paper) |
| **Paper** | [arXiv:2403.07974](https://arxiv.org/abs/2403.07974) |
| **Project / Code** | [livecodebench.github.io](https://livecodebench.github.io/) · [github.com/LiveCodeBench/LiveCodeBench](https://github.com/LiveCodeBench/LiveCodeBench) |
| **Maintainer** | Jain et al. (UC Berkeley + collaborators) |
| **Size** | continuously growing (hundreds of problems, filterable by release date) |
| **License** | _unknown_ |
| **Status** | active; widely cited for frontier-coding claims |

## What it measures

Functional correctness on competitive-programming-style problems, with the explicit design goal of defeating data contamination by dating every problem and letting evaluators cut the benchmark to a time window *after* the model's training cutoff.

The core claim is that HumanEval-class benchmarks are contaminated (problems leaked into training data) and that frontier scores on those benchmarks therefore overstate true capability. LiveCodeBench answers this by continuously sourcing new problems from public contest platforms and exposing a date-range filter.

## Task format

- **Input:** competitive-programming-style problem statement.
- **Output:** full program that reads from stdin and writes to stdout.
- **Scoring:** pass@1 on hidden tests; reported separately per time window (e.g. "problems from 2024-08 through 2024-12").
- **Splits:** time-windowed. Quote the window explicitly when reporting a score.

## Example

Problems follow the LeetCode / Codeforces / AtCoder format (given input constraints, produce an algorithm). A representative task would be a medium-difficulty LeetCode problem such as "Given a list of intervals, merge all overlapping intervals and return the result sorted by start."

_Source: representative category per [livecodebench.github.io](https://livecodebench.github.io/)._

## Leaderboard (snapshot)

Scores are meaningless without a date-window. Always cite the window. Rows below cluster by window: `v6` (commonly quoted in 2025 model cards), `CoT/standard` (DeepSeek-V3 card), and Artificial Analysis composite (AA).

| Model | Score (pass@1) | Window / note | Source |
|---|---:|---|---|
| DeepSeek V4-Pro Max | 93.5 | v6, Pass@1 | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| Gemini 3.1 Pro (thinking high, Kimi-reported) | 91.7 | v6, Pass@1 | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Kimi K2.6 | 89.6 | v6, Pass@1 | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Claude Opus 4.6 (max effort, Kimi-reported) | 88.8 | v6, Pass@1 | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Hy3-preview base (Tencent Hunyuan 3) | 34.86 | v6, 1-shot, base model | [huggingface.co/tencent/Hy3-preview](https://huggingface.co/tencent/Hy3-preview) |
| Gemini 3 Pro (Kimi-reported) | 87.4 | v6, Pass@1 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| GPT-5.2 (Qwen-reported) | 87.7 | v6 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Kimi K2.5 | 85.0 | v6, Pass@1 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Claude 4.5 Opus (Qwen-reported) | 84.8 | v6 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Qwen3.5-397B-A17B | 83.6 | v6 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| DeepSeek V3.2 (Kimi-reported) | 83.3 | v6, Pass@1 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Claude 4.5 Opus (Kimi-reported) | 82.2 | v6, Pass@1 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| MiniMax-M2 | 83 | AA composite | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Claude Sonnet 4.5 | 71 | AA composite | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Claude Sonnet 4 | 66 | AA composite | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Kimi K2 | 53.7 | v6, Pass@1 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Qwen3-235B-Instruct-2507 | 51.8 | v6, Pass@1 | [huggingface.co/Qwen/Qwen3-235B-A22B-Instruct-2507](https://huggingface.co/Qwen/Qwen3-235B-A22B-Instruct-2507) |
| Kimi K1.5 | 47.3 | short-CoT | [arXiv:2501.12599](https://arxiv.org/abs/2501.12599) |
| Claude Sonnet 4 | 48.5 | v6, Pass@1 (Kimi-reported) | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude Opus 4 | 47.4 | v6, Pass@1 (Kimi-reported) | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| DeepSeek-V3 | 46.9 | v6, Pass@1 (Kimi-reported) | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| GPT-4.1 | 44.7 | v6, Pass@1 (Kimi-reported) | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| DeepSeek-V3 | 40.5 | CoT, Pass@1, 2024-12 | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| DeepSeek-V3 | 37.6 | standard, Pass@1, 2024-12 | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| Claude 3.5 Sonnet | 36.3 | CoT, Pass@1, 2024-12 | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| GPT-4o (0513) | 33.4 | CoT, Pass@1, 2024-12 | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| Qwen2.5-72B | 31.1 | CoT, Pass@1, 2024-12 | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |

_"AA composite" refers to Artificial Analysis's blended-window LiveCodeBench metric, which aggregates several time windows; not directly comparable to a single-window v6 number._

## Critique & known issues

- **Contest-style, not engineering-style.** Measures algorithmic problem-solving, not production code. Complements — does not substitute for — SWE-bench.
- **Window dependence is easy to abuse.** Reporters can cherry-pick windows where their model looks best; treat "LiveCodeBench: X%" without a named window as marketing.
- **Contest difficulty mix drifts.** The problem difficulty distribution on LeetCode / Codeforces changes month to month; year-over-year trend comparisons are fuzzy.
- **Agent features unused.** Pure code-in / code-out; no tool use, no file navigation. Frontier coding agents outperform base models by wider margins on SWE-bench than on LiveCodeBench.

## Related benchmarks

- [HumanEval](HumanEval.md) — older, smaller, saturated
- [SWE-bench Verified](SWE-bench-Verified.md) — repo-level, agent-style alternative
- APPS — earlier competitive-programming benchmark, static

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 13 model rows from DeepSeek-V3, Kimi K2, and MiniMax-M2 model cards
- 2026-04-15 (session 1 extension): added 7 frontier rows — GPT-5.2 (87.7), Gemini 3 Pro (87.4), Kimi K2.5 (85.0), Claude 4.5 Opus (84.8/82.2), Qwen3.5-397B (83.6), DeepSeek V3.2 (83.3)
- 2026-04-24: added 4 rows — Gemini 3.1 Pro 91.7, Kimi K2.6 89.6, Claude Opus 4.6 88.8, Hy3-preview base 34.86. Sources: Kimi K2.6 and Hy3-preview model cards.
- 2026-04-28: added **DeepSeek V4-Pro Max 93.5 (new SOTA)** plus Codeforces rating 3,206 (highest competitive-programming score yet, vs GPT-5.4 3,168). Source: huggingface.co/deepseek-ai/DeepSeek-V4-Pro.
