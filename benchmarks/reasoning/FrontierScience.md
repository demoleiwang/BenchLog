# FrontierScience Research

> Meta's frontier-tier benchmark for reasoning over **cutting-edge scientific literature and novel research questions**. Muse Spark (Contemplating mode) leads at 38.3%, beating GPT-5.4 Pro (36.7%) and Gemini Deep Think (23.3%).

|  |  |
|---|---|
| **Category** | reasoning / scientific research |
| **Released** | referenced in [Meta Muse Spark launch](https://ai.meta.com/blog/introducing-muse-spark-msl/) (2026-04-08); standalone benchmark documentation is sparse |
| **Maintainer** | Meta AI (Muse Spark team) |
| **Size** | _unknown_ — not yet published in a standalone paper or HF dataset |
| **License** | _unknown_ |
| **Status** | active but **opaque**; cited in Meta's launch but no dedicated paper / public dataset yet identified |

## What it measures

According to Meta's Muse Spark launch materials, FrontierScience Research evaluates the model's ability to "reason about cutting-edge scientific literature and novel research questions." Positioned alongside HLE as the "scientific reasoning ceiling" pair Meta uses to justify Muse Spark's Contemplating mode.

The "frontier" framing parallels [FrontierMath](FrontierMath.md): problems designed to be hard, novel, and unanswerable by training-data lookup. The "Research" qualifier suggests questions probe research-level scientific reasoning (hypothesis generation, literature synthesis, novel-question handling) rather than textbook knowledge.

## Task format

- **Input:** _unknown_ — Meta has not published the schema. Likely natural-language scientific research questions.
- **Output:** _unknown_.
- **Scoring:** _unknown_ — likely either accuracy or rubric-graded.
- **Splits:** _unknown_.

## Example

_unknown_ — no public sample tasks identified at the time of this entry.

## Leaderboard (snapshot)

Numbers below from [Meta Muse Spark launch blog](https://ai.meta.com/blog/introducing-muse-spark-msl/) and corroborating coverage; Meta-internal evaluation, not independently reproduced.

| Model | Score | Source |
|---|---:|---|
| Meta Muse Spark (Contemplating mode) | 38.3 | [ai.meta.com](https://ai.meta.com/blog/introducing-muse-spark-msl/) |
| GPT-5.4 Pro | 36.7 | Meta launch claim, third-party coverage [lushbinary.com](https://lushbinary.com/blog/meta-muse-spark-developer-guide-benchmarks-modes-strategy/) |
| Gemini 3.1 Deep Think | 23.3 | Meta launch claim, third-party coverage [lushbinary.com](https://lushbinary.com/blog/meta-muse-spark-developer-guide-benchmarks-modes-strategy/) |

_Note: these comparisons appear in third-party Muse Spark coverage but the raw OpenAI / Google numbers are not independently published; treat as Meta-reported until corroborated._

## Critique & known issues

- **Lab-internal benchmark released alongside a model**: classic "the benchmark our model wins" framing. Pending independent validation.
- **No public dataset / paper yet** found. Reproducibility is currently zero outside Meta.
- **Comparator scores are second-hand** (third-party reporting of Meta's claims about competitor scores); OpenAI and Google have not directly confirmed these numbers.
- **Contemplating mode is bespoke** — Muse Spark's multi-agent reasoning scaffold is what scores 38.3, not the base model alone. Comparisons to non-Contemplating evaluations of competitors are apples-to-oranges.
- **Will likely be supplanted** as Meta either publishes the full benchmark or as the broader research community converges on alternative frontier-science benchmarks.

## Related benchmarks

- [HLE](HLE.md) — closest neighbor; similar "frontier reasoning ceiling" framing, fully public
- [FrontierMath](FrontierMath.md) — math sibling
- [GPQA Diamond](GPQA-Diamond.md) — narrower expert-knowledge predecessor

## Update log

- 2026-04-15: Initial entry; sparse documentation reflects Meta's incomplete release. **Open question for next run**: locate a Meta paper or standalone HF dataset for FrontierScience Research; if none materialises within ~2 months, consider deprecating or merging into HLE notes.
