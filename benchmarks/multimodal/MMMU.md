# MMMU

> Massive Multi-discipline Multimodal Understanding benchmark — ~11.5k college-exam-style questions requiring joint reasoning over text and images across 30 subjects in 6 disciplines.

|  |  |
|---|---|
| **Category** | multimodal |
| **Released** | 2023-11 |
| **Paper** | [arXiv:2311.16502](https://arxiv.org/abs/2311.16502) |
| **Project / Code** | [mmmu-benchmark.github.io](https://mmmu-benchmark.github.io/) · [huggingface.co/datasets/MMMU/MMMU](https://huggingface.co/datasets/MMMU/MMMU) |
| **Maintainer** | Yue et al. (CMU / Waterloo / OSU + collaborators) |
| **Size** | ~11,500 questions |
| **Disciplines** | Art & Design, Business, Science, Health & Medicine, Humanities & Social Science, Tech & Engineering |
| **License** | Apache 2.0 |
| **Status** | active; the canonical multimodal college-exam benchmark |

## What it measures

Whether a multimodal model can answer college-level exam questions whose solutions require joint understanding of text *and* the accompanying image (chart, diagram, lab photo, painting, musical score, circuit, chemical structure, medical scan, etc.).

Questions are collected from real exams, textbooks, and quizzes, then deduplicated and refined. MMMU is the multimodal analog of MMLU-Pro / GPQA in that every major multimodal model launch reports an MMMU number; it has been partially saturated at the top by late 2025, which motivated the release of MMMU-Pro.

## Task format

- **Input:** a question + one or more images (diagrams, photos, figures, score images, etc.). Questions are multiple choice or short answer.
- **Output:** the chosen option (or short text).
- **Scoring:** accuracy (MC) / EM (short answer). Reported both overall and per-discipline.
- **Splits:** dev / validation / test. Headline numbers are from the test split.

## Example

**Representative item (reconstructed from the dataset card):**

> [Image of a chemistry apparatus diagram]
> Looking at the setup, which of the following distillation techniques is most likely being performed?
>
> (A) Simple distillation (B) Fractional distillation (C) Steam distillation (D) Vacuum distillation

_Source: [MMMU dataset viewer](https://huggingface.co/datasets/MMMU/MMMU)._

## Leaderboard (snapshot)

| Model | Accuracy | Date | Source |
|---|---:|---|---|
| _seed pending_ | _unknown_ | _unknown_ | [mmmu-benchmark.github.io](https://mmmu-benchmark.github.io/) |

_Frontier multimodal models (GPT-5, Gemini 3 Pro, Claude with vision, Qwen-VL family) all report MMMU numbers in their launch materials; seed with source-linked rows._

## Critique & known issues

- **Partial saturation at the top.** By late 2025, the leaderboard is compressed; MMMU-Pro (harder redesign) is the successor for frontier differentiation.
- **Exam-bias.** College-exam style under-rewards free-form visual reasoning and over-rewards test-taking heuristics; a high score does not predict performance on chart-QA or GUI tasks.
- **Image-only modality.** No video, no audio; explicitly excluded — see VideoMME / MMBench-Video etc. for those.
- **Contamination risk.** Many questions originate from public exam banks; answers often Googleable.
- **Discipline mix is uneven.** Some domains (music, art) are smaller and can swing headline averages.

## Related benchmarks

- MMMU-Pro — harder redesign by the same team
- MathVista — math-specific multimodal
- ChartQA / ChartBench — chart-specific
- VideoMME — video-first multimodal
- [GPQA Diamond](../reasoning/GPQA-Diamond.md) — text-only expert reasoning

## Update log

- 2026-04-15: Initial entry
