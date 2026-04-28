# Video-MME

> The first comprehensive video MLLM benchmark — **900 videos** spanning 11 seconds to 1 hour across 6 visual domains × 30 subfields, with 2,700 expert-annotated QA pairs. CVPR 2025. Treated as the **"industry standard"** for video MM (per GPT-4.1 launch positioning).

|  |  |
|---|---|
| **Category** | multimodal / video |
| **Released** | 2024-05 (arXiv); CVPR 2025 |
| **Paper** | [arXiv:2405.21075](https://arxiv.org/abs/2405.21075) |
| **Project / Code** | [video-mme.github.io](https://video-mme.github.io/home_page.html) · [github.com/MME-Benchmarks/Video-MME](https://github.com/MME-Benchmarks/Video-MME) |
| **Maintainer** | MME-Benchmarks consortium |
| **Size** | 900 videos (254 hours total); 2,700 QA pairs |
| **License** | per GitHub |
| **Status** | active; the canonical video-MM benchmark |

## What it measures

Whether a multimodal LLM can understand video — across short / medium / long temporal contexts (11 s to 1 h), across 6 primary visual domains × 30 subfields, with multimodal inputs (frames + subtitles + audio).

Four design pillars:

1. **Diversity** — 6 visual domains × 30 subfields for breadth
2. **Duration** — 11 seconds to 1 hour to capture short-, medium-, and long-context video
3. **Modality breadth** — video + subtitles + audio integrated
4. **Quality** — manual labelling by expert annotators

The benchmark commonly reports two configurations: **with subtitles (w/ sub)** and **without subtitles (w/o sub)** — exposing how much of "video understanding" is actually subtitle reading.

## Task format

- **Input:** video (any duration in the 11s–1h range) + a question. Optionally subtitles + audio.
- **Output:** multiple-choice answer.
- **Scoring:** accuracy. Reported separately for short / medium / long videos and for w/sub / w/o sub.
- **Splits:** by duration; by w/sub vs w/o sub.

## Example

A representative item: a 30-minute documentary clip + a question like *"After the speaker introduced the second guest, what was the topic of the next interview question?"* — requires temporal localisation + understanding of dialogue context.

_Source: [video-mme.github.io](https://video-mme.github.io/home_page.html)._

## Leaderboard (snapshot)

Reported separately for "with subtitles" and "without subtitles".

| Model | w/ sub | w/o sub | Source |
|---|---:|---:|---|
| Gemini 3 Pro (Qwen-reported) | 88.4 | 87.7 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Qwen3.5-397B-A17B | 87.5 | 83.7 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| GPT-5.2 (Qwen-reported) | 86.0 | 85.8 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Claude 4.5 Opus (Qwen-reported) | 77.6 | 81.4 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |

_The "industry standard" framing: GPT-4.1's launch explicitly named Video-MME as the metric for multimodal long-context. Frontier models report it consistently. See [llm-stats.com/benchmarks/videomme-w-sub.](https://llm-stats.com/benchmarks/videomme-w-sub.) for live rankings._

## Critique & known issues

- **Subtitle leakage.** Many "video questions" are actually answerable from subtitles alone; the w/o sub column is the truer test of video understanding.
- **6 domains × 30 subfields, but distribution is uneven.** Short videos dominate the count; long videos are smaller-N and noisier.
- **Frame sampling matters.** Different frame-sampling rates (1 fps vs 0.5 fps vs uniform-N) materially shift scores; cite the sampling.
- **MCQ format ceiling.** Multiple choice limits discriminative power at top.
- **Audio modality under-utilised.** Many systems ignore audio entirely; the benchmark reports their scores anyway, mixing apples-and-oranges.
- **Saturation in progress.** Top frontier above 85%; growing motivation for harder video benchmarks (LVBench, MLVU, VideoMMMU, MVBench all add complementary slices).

## Related benchmarks

- [MMMU](MMMU.md) — image-only multidiscipline
- LVBench — long-video specialist
- MLVU — multi-task long-video
- VideoMMMU — video version of MMMU
- MVBench — video understanding suite

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 4 frontier rows (w/sub + w/o sub) from Qwen3.5 card
