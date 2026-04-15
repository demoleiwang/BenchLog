# ArtifactsBench

> Tencent Hunyuan's benchmark for code that produces *visual* artifacts — 1,825 queries across 9 categories (games, web apps, data viz) scored by an MLLM judge comparing rendered output against rubric checklists. Claims 94% human preference correlation.

|  |  |
|---|---|
| **Category** | coding (visual / interactive output) |
| **Released** | 2025-07 (arXiv); updates through 2025-10 |
| **Paper** | [arXiv:2507.04952](https://arxiv.org/abs/2507.04952) |
| **Project / Code** | [artifactsbenchmark.github.io](https://artifactsbenchmark.github.io/) |
| **Maintainer** | Tencent Hunyuan |
| **Size** | 1,825 queries across 9 categories |
| **License** | _unknown_ |
| **Status** | active; cited in frontier code-gen model launches (MiniMax-M2, Claude 4 series, GPT-5) |

## What it measures

Whether generated code, when actually executed, produces *visual artifacts* (games, web applications, data visualisations, interactive components) that meet specific quality and interactivity criteria. Code correctness is not enough — the rendered output must look and behave right.

The evaluation is an unusual three-stage pipeline: **(1)** extract code from the model's response, **(2)** dynamically render it and capture the visual output, **(3)** score with a multimodal LLM judge against a fine-grained rubric. The authors report 94% agreement with human expert judgement and 94.4% ranking consistency with WebDev Arena, validating the MLLM-as-judge design at this task.

ArtifactsBench complements pass@k-style benchmarks (HumanEval, LiveCodeBench) by measuring an orthogonal skill: "can the model make the picture right?"

## Task format

- **Input:** a natural-language query asking for a visual artifact (e.g. "build a Tetris clone with neon visuals" or "render a responsive dashboard for these sales figures").
- **Output:** code (typically HTML/CSS/JS or similar) that, when rendered, produces the artifact.
- **Scoring:** three-stage pipeline:
  1. code extraction
  2. headless rendering + screenshot/interaction capture
  3. MLLM judge against rubric checklists
- **Splits:** 9 categories covering game development, web applications, data visualisation, etc.

## Example

Representative query (reconstructed from the category descriptions): *"Build a single-file HTML game: a simple platformer with jumping, gravity, and one enemy type. Use only CSS animations — no canvas. Make it playable on keyboard (arrow keys + space to jump)."* The harness extracts code, renders it in a browser, attempts scripted interactions, and the MLLM judge scores the visual and interactive result against rubric criteria (does it render? is movement smooth? does the enemy move? is there a visible score?).

_Source: category descriptions on [artifactsbenchmark.github.io](https://artifactsbenchmark.github.io/)._

## Leaderboard (snapshot)

| Model | Score | Source |
|---|---:|---|
| GPT-5 | 73 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| MiniMax-M2 | 66.8 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Claude Sonnet 4.5 | 61.5 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Ling-1T | 59.31 | [artifactsbenchmark.github.io](https://artifactsbenchmark.github.io/) |
| Gemini 2.5 Pro | 57.7 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Claude Sonnet 4 | 57.3 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |

## Critique & known issues

- **MLLM-as-judge introduces model-dependence.** A different judge model would produce different orderings; the paper's 94% human-correlation validates a specific judge stack, not the concept universally.
- **Stack bias.** Favoured output formats (HTML/CSS/JS single-file) privilege web-framework-strong models; a brilliant-but-niche-language result may be penalised by the renderer.
- **Rubric quality.** Fine-grained rubrics are expensive to author; categories with thinner rubrics are noisier.
- **Rendering fragility.** Headless rendering can fail for valid code (font missing, heavy JS stalls), under-counting some models' real quality.
- **Not a correctness benchmark.** A program that visually resembles the target but is logically wrong may score well; pair with logic-correctness benchmarks.

## Related benchmarks

- WebDev Arena — human-vote-based sibling (94.4% ranking consistency per ArtifactsBench authors)
- [HumanEval](HumanEval.md) / [LiveCodeBench](LiveCodeBench.md) — orthogonal (logic-correctness)
- [SWE-bench Verified](SWE-bench-Verified.md) — repo-level code, not visual artifacts

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 6 rows from MiniMax-M2 model card + Ling-1T from project site
