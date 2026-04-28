# MMLU-Pro

> A harder, less-contaminated successor to MMLU — 12,032 multi-domain questions curated by TIGER-Lab, with 10 options per question (vs. MMLU's 4) and expert-filtered to remove noisy items.

|  |  |
|---|---|
| **Category** | knowledge / multi-domain reasoning |
| **Released** | 2024-06 |
| **Paper** | [arXiv:2406.01574](https://arxiv.org/abs/2406.01574) |
| **Project / Code** | [huggingface.co/datasets/TIGER-Lab/MMLU-Pro](https://huggingface.co/datasets/TIGER-Lab/MMLU-Pro) · [github.com/TIGER-AI-Lab/MMLU-Pro](https://github.com/TIGER-AI-Lab/MMLU-Pro) |
| **Maintainer** | TIGER-Lab (Wang et al.) |
| **Size** | 12,032 questions across 14 domains |
| **License** | MIT |
| **Status** | active; the standard "broader than GPQA, harder than MMLU" benchmark |

## What it measures

Multi-domain academic knowledge and reasoning, sampled across 14 disciplines — biology, business, chemistry, computer science, economics, engineering, health, history, law, math, other, philosophy, physics, psychology. Questions come from original MMLU, STEM websites, textbooks, and other exam sources, then filtered by experts to remove trivial or ambiguous items.

Two deliberate changes relative to MMLU: (1) ten answer options per question instead of four (raising random baseline from 25% to 10%), and (2) inclusion of more reasoning-heavy items. Together these aim to restore discriminative power at the frontier, where MMLU had saturated.

## Task format

- **Input:** a question with 10 answer choices.
- **Output:** the letter of the chosen option.
- **Scoring:** accuracy.
- **Splits:** single 12k-item test set; per-domain breakdowns are commonly reported.

## Example

**MMLU-Pro sample (business/finance, abridged):**

> A company is analyzing a project requiring an initial investment of $100,000 and yielding cash flows of $30,000 annually for 5 years. Given a discount rate of 10%, what is the net present value (NPV)?
>
> (A) $13,723.60 (B) $25,000.00 ... (J) …

_Source: [huggingface.co/datasets/TIGER-Lab/MMLU-Pro](https://huggingface.co/datasets/TIGER-Lab/MMLU-Pro)._

## Leaderboard (snapshot)

Cross-lab scores use different prompting schemes (direct vs. CoT vs. thinking-mode) and different metric (EM vs. Acc vs. AA composite). Don't compare across rows without reading the source.

| Model | Accuracy | Metric / source-reported-by | Source |
|---|---:|---|---|
| Gemini 3.1 Pro (DS-reported) | 91.0 | EM | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| Claude Opus 4.6 (max effort, DS-reported) | 89.1 | EM | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| GPT-5.4 (xHigh, DS-reported) | 87.5 | EM | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| DeepSeek V4-Pro Max | 87.5 | EM | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| Kimi K2.6 Thinking (DS-reported) | 87.1 | EM | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| GLM-5.1 Thinking (DS-reported) | 86.0 | EM | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| Gemini 3 Pro (Qwen-reported / Kimi-reported) | 89.8 / 90.1 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Claude 4.5 Opus (Qwen-reported / Kimi-reported) | 89.5 / 89.3 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Claude Sonnet 4.5 | 88 | AA composite | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Qwen3.5-397B-A17B | 87.8 | self-reported, 2026-02 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| GPT-5.2 (Qwen-reported / Kimi-reported) | 87.4 / 86.7 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Kimi K2.5 | 87.1 | self-reported, 2026-01-29 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| DeepSeek V3.2 (Kimi-reported) | 85.0 | — | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Claude Opus 4 | 86.6 | EM (Kimi-reported) | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude Sonnet 4 | 84 | AA composite | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Claude Sonnet 4 | 83.7 | EM (Kimi-reported) | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| MiniMax-M2 | 82 | AA composite | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Qwen3-235B-Instruct-2507 | 83.0 | self-reported, 2025-05 | [huggingface.co/Qwen/Qwen3-235B-A22B-Instruct-2507](https://huggingface.co/Qwen/Qwen3-235B-A22B-Instruct-2507) |
| GPT-4.1 | 81.8 | EM (Kimi-reported) | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| DeepSeek-V3 | 81.2 | EM (Kimi-reported) | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Kimi K2 | 81.1 | EM | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude 3.5 Sonnet | 78.0 | EM (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| DeepSeek-V3 | 75.9 | EM (self-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| LLaMA-3.1-405B | 73.3 | EM (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| GPT-4o (0513) | 72.6 | EM (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| Qwen2.5-72B | 71.6 | EM (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |

_Note: DeepSeek-V3 appears with two scores (81.2 and 75.9) because the Kimi K2 team re-ran it in their harness (81.2) while DeepSeek's own report has 75.9. Both are legitimate; the divergence illustrates why we record the reporting lab._

## Critique & known issues

- **Still multiple-choice.** Ceiling effects are mitigated versus MMLU but not eliminated; 10-way options just push saturation a few quarters out.
- **Domain mix is unbalanced.** More STEM than humanities; cross-domain comparisons are noisy.
- **Contamination risk grows with age.** Questions are on Hugging Face and likely in pre-training of any model trained after mid-2024.
- **Prompt/format sensitivity.** CoT vs. direct answering swings scores; also sensitive to answer-letter ordering.
- **Complementary, not substitute.** A high MMLU-Pro score does not imply competence on GPQA Diamond or HLE; keep all three in the dashboard.

## Related benchmarks

- [GPQA Diamond](../reasoning/GPQA-Diamond.md) — harder, narrower, sciences only
- [HLE](../reasoning/HLE.md) — hardest tier
- MMLU (original) — saturated predecessor
- BIG-Bench-Hard — older reasoning-focused subset of BIG-Bench

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 13 model rows from DeepSeek-V3, Kimi K2, and MiniMax-M2 model cards. Noted the lab-harness divergence for DeepSeek-V3 (81.2 vs 75.9).
- 2026-04-15 (session 1 extension): added 7 frontier rows — Gemini 3 Pro (89.8/90.1), Claude 4.5 Opus (89.5/89.3), Qwen3.5-397B (87.8), GPT-5.2 (87.4/86.7), Kimi K2.5 (87.1), DeepSeek V3.2 (85.0). Each model that appears in both Kimi K2.5 and Qwen3.5 tables shows both numbers for transparency.
- 2026-04-28: added 6 DS-reported rows from DeepSeek V4 launch — **Gemini 3.1 Pro 91.0 (new SOTA, EM)**, Opus 4.6 89.1, GPT-5.4 / DeepSeek V4-Pro 87.5, Kimi K2.6 87.1, GLM-5.1 86.0. Source: huggingface.co/deepseek-ai/DeepSeek-V4-Pro.
