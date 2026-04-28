# SimpleQA & SimpleQA Verified

> OpenAI's **short-form factuality** benchmark — 4,326 adversarially-collected questions with single, indisputable answers. The 2025 follow-up **SimpleQA Verified** filters to a cleaner 1,000-prompt subset where Gemini 2.5 Pro tops at F1 = 55.6.

|  |  |
|---|---|
| **Category** | knowledge / factuality |
| **Released** | original 2024-11; SimpleQA Verified 2025-09 |
| **Paper** | original [arXiv:2411.04368](https://arxiv.org/abs/2411.04368); Verified [arXiv:2509.07968](https://arxiv.org/abs/2509.07968) |
| **Project** | [openai.com/index/introducing-simpleqa](https://openai.com/index/introducing-simpleqa/) (note: 403 to WebFetch) |
| **Maintainer** | OpenAI; Verified version with broader contributors |
| **Size** | original 4,326 questions; Verified 1,000 |
| **License** | open-source |
| **Status** | active; commonly cited as a hallucination metric |

## What it measures

Whether a model **knows what it knows** about short-form facts — the answer should be a single, unambiguous string (a name, a number, a date), and should be **verifiable**. Questions are adversarially collected to be hard for current frontier models while having undeniable correct answers.

The metric of interest isn't only accuracy but **calibration** — does the model produce the correct answer when it knows, and refrain (or admit uncertainty) when it doesn't? Hallucination is the headline failure mode this benchmark exposes.

**SimpleQA Verified** (2025-09 successor) addresses noise in the original: removes mislabeled answers, balances topics, deduplicates, and reconciles sources. 1,000 prompts. F1 score (precision + recall combined) is the headline metric since models can choose to abstain.

## Task format

- **Input:** a fact-seeking question with a single ground-truth answer.
- **Output:** short text answer (or abstention).
- **Scoring:** original — accuracy; Verified — F1 (rewards both correctness and well-calibrated abstention).
- **Splits:** by topic; topic-balanced in Verified.

## Example

A representative SimpleQA item (paraphrased style; exact stems are public on the dataset page): *"Which year did the Soviet space program first land a probe on the surface of Venus?"* — single integer answer, unambiguous, verifiable.

_Source: [arXiv:2411.04368](https://arxiv.org/abs/2411.04368) and [arXiv:2509.07968](https://arxiv.org/abs/2509.07968)._

## Leaderboard (snapshot)

| Model | Score | Variant | Source |
|---|---:|---|---|
| Gemini 2.5 Pro | F1 = 55.6 | SimpleQA Verified, frontier SOTA at launch | [arXiv:2509.07968](https://arxiv.org/abs/2509.07968) |
| GPT-5 | < 55.6 (per Verified paper claim Gemini outperforms GPT-5) | SimpleQA Verified | [arXiv:2509.07968](https://arxiv.org/abs/2509.07968) |

_Per-model rows pending more-recent extractions; OpenAI's own model launches publish SimpleQA scores. Live leaderboard at [llm-stats.com/benchmarks/simpleqa](https://llm-stats.com/benchmarks/simpleqa)._

## Critique & known issues

- **"Single indisputable answer" is hard to maintain at scale.** Original SimpleQA had label-noise issues that motivated the Verified follow-up.
- **Knowledge cutoff dependency.** Questions about recent events disadvantage older models; topical balance can shift the apparent ranking.
- **Calibration vs. accuracy tradeoff.** A model trained to abstain often gets lower accuracy but higher F1; ranking depends on the metric.
- **English-only.** [Chinese SimpleQA](https://arxiv.org/abs/2411.07140) is a sibling for Chinese factuality.
- **Doesn't measure long-form factuality.** A model can ace SimpleQA and still hallucinate liberally in essays.

## Related benchmarks

- TriviaQA / NaturalQuestions — older factuality benchmarks
- Chinese SimpleQA — Mandarin-language sibling
- VisualSimpleQA — multimodal sibling
- [HealthBench](HealthBench.md) — domain-specific factuality

## Update log

- 2026-04-15: Initial entry (covers both SimpleQA and SimpleQA Verified) with Gemini 2.5 Pro F1=55.6 from Verified paper
