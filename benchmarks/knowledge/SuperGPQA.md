# SuperGPQA

> M-A-P's **285-discipline** successor to GPQA — evaluates graduate-level knowledge and reasoning across a dramatically broader field set, including light industry, agriculture, and service-oriented disciplines that GPQA ignored. DeepSeek-R1 topped launch at 61.82%.

|  |  |
|---|---|
| **Category** | knowledge / multi-domain |
| **Released** | 2025-02 (v1); v4 is current |
| **Paper** | [arXiv:2502.14739](https://arxiv.org/abs/2502.14739) |
| **Project / Code** | [github.com/SuperGPQA/SuperGPQA](https://github.com/SuperGPQA/SuperGPQA) · [huggingface.co/papers/2502.14739](https://huggingface.co/papers/2502.14739) |
| **Maintainer** | M-A-P (Multimodal Art Projection) |
| **Size** | questions across **285 graduate disciplines** |
| **License** | per GitHub |
| **Status** | active; increasingly cited in 2025–2026 frontier model cards alongside GPQA |

## What it measures

Graduate-level knowledge and reasoning across 285 disciplines. Motivation: "human knowledge encompasses over 200 specialized disciplines far exceeding existing benchmarks" — LLM capabilities in fields like light industry, agriculture, services are systematically under-tested by GPQA (which is biology / chemistry / physics only).

SuperGPQA uses a **Human-LLM collaborative filtering mechanism** to eliminate trivial or ambiguous questions through iterative refinement. 80+ expert annotators worked with an LLM collaborative system to build the dataset.

## Task format

- **Input:** graduate-level multiple-choice question.
- **Output:** the chosen option.
- **Scoring:** accuracy.
- **Splits:** single test set; per-discipline breakdowns available.

## Example

A representative SuperGPQA item would draw from one of the 285 disciplines — e.g., a light-industry question about paper-pulp chemistry, or an agricultural-science question about crop rotation impacts on nitrogen fixation. Answer selection is MCQ.

_Source: [huggingface.co/papers/2502.14739](https://huggingface.co/papers/2502.14739) and [github.com/SuperGPQA/SuperGPQA](https://github.com/SuperGPQA/SuperGPQA)._

## Leaderboard (snapshot)

| Model | Accuracy | Source-reported-by | Source |
|---|---:|---|---|
| Gemini 3 Pro (Qwen-reported) | 74.0 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Claude 4.5 Opus (Qwen-reported) | 70.6 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Qwen3.5-397B-A17B | 70.4 | self-reported, 2026-02 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| GPT-5.2 (Qwen-reported) | 67.9 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| DeepSeek-R1 | 61.82 | paper, launch | [arXiv:2502.14739](https://arxiv.org/abs/2502.14739) |

## Critique & known issues

- **Breadth over depth.** 285 disciplines means thinner per-discipline samples than GPQA's focused set; per-discipline accuracy is noisier.
- **Translation bias.** Some disciplines have Chinese-source-material bias given M-A-P's Chinese team. Scores across languages may be asymmetric.
- **MCQ format ceiling.** Like GPQA, SuperGPQA's MCQ design limits discriminative power at the top; saturation will eventually come.
- **Collaborative filtering is LLM-in-the-loop.** If the filtering LLM has systematic blind spots, those propagate to the benchmark.
- **285 disciplines is overwhelming.** Users tend to look at overall % only; the per-discipline breakdown is where the useful signal lives.

## Related benchmarks

- [GPQA Diamond](../reasoning/GPQA-Diamond.md) — narrower but harder
- [MMLU-Pro](MMLU-Pro.md) — similar multi-domain positioning, 14 domains
- [HLE](../reasoning/HLE.md) — hardest tier, still expert-authored

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 5 rows (Gemini 3 Pro 74.0, Claude 4.5 Opus 70.6, Qwen3.5-397B 70.4, GPT-5.2 67.9, DeepSeek-R1 61.82)
