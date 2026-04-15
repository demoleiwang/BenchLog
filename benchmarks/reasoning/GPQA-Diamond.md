# GPQA Diamond

> The hardest subset (198 questions) of the Graduate-Level Google-Proof Q&A benchmark: expert-written multiple-choice questions in biology, physics, and chemistry that are provably resistant to casual web lookup.

|  |  |
|---|---|
| **Category** | reasoning / expert knowledge |
| **Released** | 2023-11 |
| **Paper** | [arXiv:2311.12022](https://arxiv.org/abs/2311.12022) |
| **Project / Code** | [github.com/idavidrein/gpqa](https://github.com/idavidrein/gpqa) |
| **Maintainer** | Rein et al. (NYU, Cohere, Anthropic) |
| **Size** | 448 total; **Diamond = 198**; Extended = 546 |
| **License** | CC BY 4.0 |
| **Status** | active, widely quoted in frontier model launches |

## What it measures

Expert-level reasoning in physics, biology, and chemistry at a PhD-qualifying-exam level. Questions are written by domain PhDs and are validated to be unsolvable by non-experts even with ~30 minutes of unrestricted web access — hence "Google-proof".

"Diamond" is the highest-quality subset: every question is confirmed correct by domain experts AND mis-answered by other expert validators, ensuring it is both reliable and discriminative. GPQA is the reasoning benchmark that frontier labs quote most often after MMLU has saturated.

## Task format

- **Input:** a graduate-level science question with four multiple-choice options.
- **Output:** the chosen letter (A/B/C/D).
- **Scoring:** accuracy.
- **Splits:** Diamond (198), Main (448), Extended (546). Diamond is the leaderboard standard.

## Example

From the dataset (abridged for brevity):

> **Q (physics):** Two quantum states with energies E1 and E2 have a lifetime of 1e-9 and 1e-8 seconds, respectively. We want to clearly distinguish these two energy levels. Which one of the following options could be their energy difference so that they can be clearly resolved?
>
> (A) 10⁻⁴ eV  (B) 10⁻¹¹ eV  (C) 10⁻⁸ eV  (D) 10⁻⁹ eV

_Source: [GPQA dataset on GitHub](https://github.com/idavidrein/gpqa)._

## Leaderboard (snapshot)

Most-recent-first. Numbers vary with prompt style (CoT vs. direct, Avg@8 vs. Pass@1); cite the source and the metric.

| Model | Accuracy | Metric / source-reported-by | Source |
|---|---:|---|---|
| Kimi K2 | 75.1% | Avg@8 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude Opus 4 | 74.9% | Avg@8 (Kimi-reported) | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude Sonnet 4 | 70.0% | Avg@8 (Kimi-reported) | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| DeepSeek-V3 | 68.4% | Avg@8 (Kimi-reported) | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| GPT-4.1 | 66.3% | Avg@8 (Kimi-reported) | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude 3.5 Sonnet | 65.0% | Pass@1 (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| DeepSeek-V3 | 59.1% | Pass@1 (self-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| LLaMA-3.1-405B | 51.1% | Pass@1 (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| GPT-4o (0513) | 49.9% | Pass@1 (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| Qwen2.5-72B | 49.0% | Pass@1 (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |

_DeepSeek-V3 appears twice (68.4 vs 59.1) because Kimi K2's team re-ran it Avg@8 while DeepSeek's own report uses Pass@1. Metric choice accounts for most of the gap._

## Critique & known issues

- **Multiple-choice ceiling.** With four options, random guessing floor is 25%; a ceiling effect around ~90% is visible in current frontier reports.
- **Domain narrowness.** Only bio / chem / physics — does not speak to reasoning in math, CS, law, or humanities.
- **Contamination risk.** Questions have been public since late 2023. Question stems are now plausibly in pre-training corpora; "Google-proof" no longer implies "training-proof".
- **Tool-use ambiguity.** Some reports allow chain-of-thought, others allow calculators or web search. Quote the harness.
- **"PhD-qualifying" framing contested.** Critics argue the exam set tilts toward textbook reasoning rather than research-level reasoning.

## Related benchmarks

- [MMLU-Pro](../knowledge/MMLU-Pro.md) — broader domain coverage, similar difficulty tier
- [HLE](HLE.md) — explicitly positioned as "harder than GPQA"
- [AIME 2025](AIME-2025.md) — math-only analog for reasoning difficulty

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 10 model rows from DeepSeek-V3 and Kimi K2 model cards
