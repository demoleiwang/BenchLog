# MMMU-Pro

> A hardened redesign of MMMU — filters out text-only-answerable items, expands candidate options, and adds a vision-only setting where the question text is embedded inside the image. Drops frontier scores from MMMU's ~65–70% range into the 17–27% range at launch.

|  |  |
|---|---|
| **Category** | multimodal |
| **Released** | 2024-09-04 (v1); 2025-05-22 (v3) |
| **Paper** | [arXiv:2409.02813](https://arxiv.org/abs/2409.02813) |
| **Project / Code** | [mmmu-benchmark.github.io](https://mmmu-benchmark.github.io/) · dataset on Hugging Face |
| **Maintainer** | Yue et al. (CMU / Waterloo / OSU + collaborators) |
| **Size** | _unknown_ (derived from MMMU's ~11.5k; Pro is a filtered / modified subset) |
| **License** | Apache 2.0 |
| **Status** | active; the successor-in-use for frontier multimodal claims as MMMU saturates |

## What it measures

Frontier-tier multimodal reasoning — same 30-subject / 6-discipline scope as MMMU, but with three design choices aimed at restoring discriminative power:

1. **Filter out text-only-solvable items.** MMMU questions that a text-only model can answer without seeing the image are removed.
2. **Augment candidate options.** More distractors per question reduces the guessing floor and raises the ceiling.
3. **Vision-only input setting.** The question text itself is rendered as part of the image — forcing the model to actually perceive and read the image, not just condition on a text prompt.

At launch, frontier models scored **16.8% – 26.9%** on MMMU-Pro, compared to ~60–70% on MMMU. The paper also notes that OCR-prompting helped little while Chain-of-Thought reasoning helped a lot, suggesting the bottleneck shifted from perception to multi-step visual reasoning.

## Task format

- **Input:** question + image(s); under the vision-only setting, the question is inside the image.
- **Output:** multiple-choice letter.
- **Scoring:** accuracy.
- **Splits:** standard + vision-only setting (report both separately when possible).

## Example

An MMMU-Pro-hardened version of a college-exam MCQ in which the question (e.g. a chemistry problem referencing a specific molecule) is embedded visually rather than available as text. The model must read the question, interpret the image, and answer.

_Source: [mmmu-benchmark.github.io](https://mmmu-benchmark.github.io/)._

## Leaderboard (snapshot)

Reported frontier scores from the paper + subsequent updates; cite the source and setting (standard vs. vision-only).

| Model | Score | Setting | Source |
|---|---:|---|---|
| Launch-era frontier range | 16.8–26.9% | across setting variants | [arXiv:2409.02813](https://arxiv.org/abs/2409.02813) |

_Newer model launches (Claude 4 series, GPT-5, Gemini 3 Pro) often report MMMU-Pro; add source-linked rows when ingesting from system cards._

## Critique & known issues

- **Still multiple choice.** A guessing baseline exists; "vision-only" setting is the stricter reporting variant.
- **Vision-only setting reveals OCR weaknesses.** Models with weak in-context OCR tank on this variant; scores are not comparable to standard MMMU-Pro.
- **CoT dependence.** Large gains from Chain-of-Thought mean "base" vs. "with-CoT" numbers both need to be disclosed.
- **Size not clearly documented.** The public dataset's exact size per split is easier to derive from HF than from the paper; treat published totals carefully.
- **Contamination.** Derived from MMMU which has been public since 2023; long-tail leakage risk is real.

## Related benchmarks

- [MMMU](MMMU.md) — direct predecessor, saturated at the frontier
- MathVista — math-specific multimodal
- ChartQA / ChartBench — chart-specific
- VideoMME / Video-MME — video-first multimodal

## Update log

- 2026-04-15: Initial entry
