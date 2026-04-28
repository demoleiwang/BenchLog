# CharXiv

> 2,323 **real arXiv-paper charts** with two question types — descriptive (basic chart elements) + reasoning (synthesise across complex elements). Princeton NeurIPS 2024. At launch, GPT-4o = 47.1%, human = 80.5% — a sharp realism gap on chart understanding.

|  |  |
|---|---|
| **Category** | multimodal / chart understanding |
| **Released** | 2024-06; NeurIPS 2024 |
| **Paper** | [arXiv:2406.18521](https://arxiv.org/abs/2406.18521) |
| **Project / Code** | [charxiv.github.io](https://charxiv.github.io/) · [github.com/princeton-nlp/CharXiv](https://github.com/princeton-nlp/CharXiv) |
| **Maintainer** | Princeton NLP |
| **Size** | 2,323 charts × multiple question types |
| **License** | per GitHub |
| **Status** | active; the realism-focused chart benchmark cited in 2025–2026 multimodal launches |

## What it measures

Whether a multimodal model can understand **real** charts — those that appear in actual research papers, with their natural complexity, bespoke styling, dense annotations, multi-panel layouts. Prior chart benchmarks (ChartQA, PlotQA) used template-generated or simplified charts; CharXiv collects from the arXiv corpus and asks two question types:

1. **Descriptive (DQ)** — examining basic chart elements (axes, labels, legend entries)
2. **Reasoning (RQ)** — synthesising information across complex visual elements (comparing series, computing trends, cross-panel correlation)

The launch finding — GPT-4o 47.1%, best open-source 29.2%, human 80.5% — established that prior chart benchmarks were over-optimistic. Modern frontier models have progressed a lot but the realism gap remains.

## Task format

- **Input:** a chart image (lifted from arXiv paper) + a natural-language question.
- **Output:** short answer (number, name, list).
- **Scoring:** accuracy. Reported separately for DQ and RQ.
- **Splits:** Descriptive Questions + Reasoning Questions.

## Example

A representative reasoning question (paraphrased): given a multi-panel scientific figure showing model accuracy vs. compute across 4 model families, *"At 10^21 FLOPs, which model family has the largest accuracy lead, and over which other family?"* Requires reading axes, identifying the right point on each curve, comparing.

_Source: [charxiv.github.io](https://charxiv.github.io/)._

## Leaderboard (snapshot)

| Model | RQ score | Note | Source |
|---|---:|---|---|
| GPT-5.2 (Qwen-reported) | 82.1 | Reasoning Questions | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Gemini 3 Pro (Qwen-reported) | 81.4 | Reasoning Questions | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Qwen3.5-397B-A17B | 80.8 | Reasoning Questions | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Claude 4.5 Opus (Qwen-reported) | 68.5 | Reasoning Questions | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| GPT-4o (paper baseline, 2024-06) | 47.1 | overall | [arXiv:2406.18521](https://arxiv.org/abs/2406.18521) |
| InternVL Chat V1.5 (paper, top open-source) | 29.2 | overall | [arXiv:2406.18521](https://arxiv.org/abs/2406.18521) |
| Human (paper) | 80.5 | overall | [arXiv:2406.18521](https://arxiv.org/abs/2406.18521) |

_2026-frontier RQ scores have surpassed the 2024 human baseline of 80.5% — but humans were time-constrained; rerun under longer time would shift the human number up._

## Critique & known issues

- **arXiv chart distribution biases toward ML / physics.** A model trained on the arXiv corpus has plausibly seen many of these source figures, raising contamination concerns.
- **DQ vs RQ split matters.** A model that memorises chart layouts will ace DQ but fail RQ; report both.
- **Question-quality variance.** Some questions have ambiguous answers (depending on which point on a curve you read); inter-annotator agreement not fully published.
- **OCR confound (same as MathVista).** Small axis labels can fail OCR even when the model "could" reason correctly.
- **2,323 is a modest N for breakdowns.** Per-domain or per-figure-type analyses are noisy.

## Related benchmarks

- ChartQA — older template-based predecessor
- ChartBench — sibling chart benchmark
- [MMMU](MMMU.md) / [MMMU-Pro](MMMU-Pro.md) — broader multimodal
- [MathVista](MathVista.md) — math-in-vision sibling
- AI2D — diagram understanding

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 4 frontier RQ rows from Qwen3.5 + paper baselines
