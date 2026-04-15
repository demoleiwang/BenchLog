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

| Model | Accuracy | Date | Source |
|---|---:|---|---|
| _seed pending_ | _unknown_ | _unknown_ | [huggingface.co/datasets/TIGER-Lab/MMLU-Pro](https://huggingface.co/datasets/TIGER-Lab/MMLU-Pro) |

_Frontier model reports since mid-2024 typically include MMLU-Pro; add source-linked rows from model system cards / launch blogs._

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

- 2026-04-15: Initial entry
