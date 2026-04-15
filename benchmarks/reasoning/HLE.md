# Humanity's Last Exam (HLE)

> 2,500 expert-written questions across more than 100 academic subjects, built by CAIS and Scale AI specifically to be hard for frontier models — the highest-profile "reasoning ceiling" benchmark of 2025–2026.

|  |  |
|---|---|
| **Category** | reasoning / frontier-ceiling |
| **Released** | questions finalized 2025-04-03; Nature publication 2026-01-28 (Nature 649, 1139–1146) |
| **Paper / Publication** | [Nature article](https://www.nature.com/articles/s41586-025-XXXXX) via [lastexam.ai](https://lastexam.ai/) |
| **Project / Code** | [lastexam.ai](https://lastexam.ai/) |
| **Maintainer** | Center for AI Safety (CAIS) + Scale AI; ~1,000 subject experts from > 500 institutions across 50 countries |
| **Size** | 2,500 questions |
| **License** | questions released alongside eval infra; private test held out |
| **Status** | active; headline "frontier is still climbing" metric |

## What it measures

Expert-level reasoning and knowledge across the academic subject landscape. Questions are written by subject-area PhDs and deliberately selected to be unanswerable by then-frontier models; the benchmark was built expressly to replace saturated tests (MMLU, GPQA) as a reasoning ceiling.

Two headline metrics: **accuracy** (did you get it right) and **calibration error** (how well-calibrated the stated confidence is). The calibration metric is novel in this tier and penalises models that hallucinate with high confidence.

## Task format

- **Input:** short-answer / multiple-choice expert question.
- **Output:** answer + confidence (0–100%).
- **Scoring:** accuracy %; calibration error %.
- **Splits:** public set released with paper; private holdout maintained to detect overfitting.

## Example

HLE question stems are written by subject experts and span domains from Classics to Ecology to pure mathematics. Public samples are available via [lastexam.ai](https://lastexam.ai/).

_Source: [lastexam.ai](https://lastexam.ai/) — sample browser on the landing page._

## Leaderboard (snapshot)

Values from the project's own reporting (see [lastexam.ai](https://lastexam.ai/)). Scores below are point-in-time; HLE is actively re-scored as new frontier models appear.

| Model | Accuracy | Source |
|---|---:|---|
| Gemini 3 Pro | 38.3% | [lastexam.ai](https://lastexam.ai/) |
| GPT-5 | 25.3% | [lastexam.ai](https://lastexam.ai/) |
| Grok 4 | 24.5% | [lastexam.ai](https://lastexam.ai/) |
| Claude 4.5 Sonnet | 13.7% | [lastexam.ai](https://lastexam.ai/) |
| GPT-4o | 2.7% | [lastexam.ai](https://lastexam.ai/) |

## Critique & known issues

- **Designed-to-be-hard ≠ skill distribution of real use.** HLE deliberately selects against current frontier; the skill distribution it samples is not representative of everyday LLM usage.
- **"Calibration" metric dependence on elicitation.** Confidence elicitation methods vary (self-reported vs. log-probs vs. verbalized); reported numbers are not always comparable.
- **Private test leak risk grows over time.** As many models submit for evaluation, the private test content leaks through response patterns. The maintainers rotate questions but the leak risk is real.
- **Subject mix is not uniform.** Coverage in some soft-science subjects is thinner; per-subject accuracy can swing a lot.
- **Contamination.** Questions were seeded by experts, but some overlap with textbooks / exam prep material is unavoidable.

## Related benchmarks

- [GPQA Diamond](GPQA-Diamond.md) — older reasoning-ceiling benchmark, now saturating
- [MMLU-Pro](../knowledge/MMLU-Pro.md) — domain-breadth, easier
- FrontierMath — math-only analog at research tier

## Update log

- 2026-04-15: Initial entry with reported scores from [lastexam.ai](https://lastexam.ai/)
