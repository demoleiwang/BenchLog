# MathVista

> 6,141 multimodal math examples drawn from 28 existing math-vision datasets + 3 new sets (IQTest, FunctionQA, PaperQA). The reference benchmark for "can the model do math when the math is in the picture".

|  |  |
|---|---|
| **Category** | multimodal / math |
| **Released** | 2023-10 (v1); revised 2024-01 |
| **Paper** | [arXiv:2310.02255](https://arxiv.org/abs/2310.02255) |
| **Project / Code** | [mathvista.github.io](https://mathvista.github.io/) · [github.com/lupantech/MathVista](https://github.com/lupantech/MathVista) |
| **Maintainer** | Pan Lu et al. |
| **Size** | 6,141 examples; 31 source datasets |
| **License** | per GitHub |
| **Status** | active; the reference multimodal-math benchmark cited in nearly every multimodal model launch |

## What it measures

Mathematical reasoning *in visual contexts* — when the problem statement, formula, or critical input lives in the image (chart, geometric diagram, scientific plot, function graph, IQ-test pattern, table, paper figure). The model must perceive the image, extract the relevant math, and reason.

Composition: 28 existing math-vision datasets distilled + 3 new datasets:
- **IQTest** — pattern-recognition IQ-style problems
- **FunctionQA** — questions about plotted functions
- **PaperQA** — questions about figures lifted from research papers

This breadth is the contribution: prior multimodal-math benchmarks were narrow (e.g., GeoQA = geometry only). MathVista bundles the full visual-math distribution into one harness.

## Task format

- **Input:** a question + one image.
- **Output:** short answer (number, expression, multiple-choice letter).
- **Scoring:** accuracy. Reported overall and by source dataset / problem type.
- **Splits:** testmini (1,000 examples, the commonly-quoted subset) + full test set (6,141).

## Example

A representative item: a function plot showing y = f(x) with several intersections; the question asks "How many real roots does f(x) = 0 have in the interval [-3, 3]?" The model must perceive intersection points and count.

_Source: [mathvista.github.io](https://mathvista.github.io/) — sample browser._

## Leaderboard (snapshot)

| Model | Score | Note | Source |
|---|---:|---|---|
| Kimi K2.5 | 90.1 | mini, 2026-01 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Qwen3.5-397B-A17B | 90.3 | mini, 2026-02 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Gemini 3 Pro (Qwen-reported) | 87.9 | mini | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| GPT-5.2 (Qwen-reported) | 83.1 | mini | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| GPT-5.2 (Kimi-reported) | 82.8 | mini | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Claude 4.5 Opus (Qwen-reported) | 80.0 | mini | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Claude 4.5 Opus (Kimi-reported) | 80.2 | mini | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| GPT-4V (paper baseline, 2023-10) | 49.9 | full | [arXiv:2310.02255](https://arxiv.org/abs/2310.02255) |
| Bard (paper baseline) | 34.8 | full | [arXiv:2310.02255](https://arxiv.org/abs/2310.02255) |
| Human (paper) | 60.3 | full | [arXiv:2310.02255](https://arxiv.org/abs/2310.02255) |

_Note: 2026-frontier models all evaluate on the **testmini** subset (1,000 examples), where scores are higher than on the full set. The 2023-era full-set baselines (GPT-4V 49.9%, Bard 34.8%) are not directly comparable._

## Critique & known issues

- **testmini vs full** — make sure to cite which split the score comes from. Frontier reports use mini.
- **Saturation in progress.** Top models cluster 80-90% on testmini; smaller-margin model differences are within harness noise.
- **Source-dataset mix.** A model strong at chart QA but weak at geometric reasoning can post a misleading overall score; per-source breakdowns more informative.
- **OCR confound.** Many "math" failures are actually OCR failures on small or stylised figures; not pure reasoning gaps.
- **Translation bias.** Source datasets predominantly English; non-English math notation underrepresented.

## Related benchmarks

- [MMMU](MMMU.md) / [MMMU-Pro](MMMU-Pro.md) — broader multidiscipline multimodal
- MathVision — newer multimodal math sibling (NeurIPS 2024)
- ChartQA / [CharXiv](CharXiv.md) — chart-specific
- AIME / FrontierMath — text-only math counterparts

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 10 rows from Kimi K2.5, Qwen3.5 cards + paper baselines
