# GAIA

> A 466-question benchmark for general AI assistants — real-world questions that require tool use, web browsing, multimodality, and multi-step reasoning. Humans score ~92%; early tool-augmented GPT-4 scored ~15%.

|  |  |
|---|---|
| **Category** | agent / general assistant |
| **Released** | 2023-11 |
| **Paper** | [arXiv:2311.12983](https://arxiv.org/abs/2311.12983) |
| **Project / Code** | [huggingface.co/spaces/gaia-benchmark/leaderboard](https://huggingface.co/spaces/gaia-benchmark/leaderboard) · [huggingface.co/datasets/gaia-benchmark/GAIA](https://huggingface.co/datasets/gaia-benchmark/GAIA) |
| **Maintainer** | Mialon, Fourrier, Swift, Wolf, LeCun, Scialom (Meta + Hugging Face) |
| **Size** | 466 questions (166 validation with public answers; 300 test with withheld answers) |
| **License** | CC BY 4.0 (questions); test answers withheld |
| **Status** | active; a canonical agent benchmark — often the first one a new agent reports |

## What it measures

Whether a system combining an LLM + tools (web browser, code execution, file parsing, image understanding) can answer realistic, multi-step assistant-style questions that a human could answer with Google + a laptop but a bare LLM cannot.

The benchmark is tiered by difficulty (Levels 1 / 2 / 3). Level 1 is answerable in a few steps; Level 3 requires long tool-use chains, cross-modal reasoning, and careful planning. GAIA popularised the phrasing "agentic intelligence" in the benchmarking community: success depends less on model raw IQ and more on the agent scaffold.

## Task format

- **Input:** a natural-language question, optionally attached to files (images, PDFs, audio).
- **Output:** a short exact-match answer (a number, a name, a phrase).
- **Scoring:** exact match vs. reference, per question. Leaderboards report per-level accuracy and overall.
- **Splits:** 166 validation (labels public) + 300 test (labels withheld, leaderboard-graded).

## Example

**GAIA Level-1 example (reproduced from the paper):**

> How many studio albums were published by Mercedes Sosa between 2000 and 2009 (included)? You can use the latest 2022 version of English Wikipedia.

Expected answer: an integer.

_Source: [arXiv:2311.12983](https://arxiv.org/abs/2311.12983), Appendix A._

## Leaderboard (snapshot)

| Model / Agent | Overall Accuracy | Date | Source |
|---|---:|---|---|
| GPT-4 + plugins (original paper baseline) | ~15% | 2023-11 | [arXiv:2311.12983](https://arxiv.org/abs/2311.12983) |
| Human | ~92% | 2023-11 | [arXiv:2311.12983](https://arxiv.org/abs/2311.12983) |

_Current frontier agents routinely exceed 50–70% on the GAIA test set; see the [HF leaderboard](https://huggingface.co/spaces/gaia-benchmark/leaderboard) for live rankings and add source-linked rows._

## Critique & known issues

- **Short-answer scoring misses nuance.** Exact-match on a single string under-rewards partially correct multi-step answers.
- **Tool policies vary.** Different evaluations permit different tool sets (browser, code, vision); apples-to-apples is rare.
- **Test-set contamination risk grows with leaderboard popularity.** As more agents submit responses, question stems and answer patterns leak.
- **Level 3 is small.** High-level results can swing several points per question.
- **"General assistant" framing.** Skews toward web-lookup-style questions; under-tests long-horizon planning or stateful tool use (see OSWorld / τ-bench for those).

## Related benchmarks

- [τ-bench](tau-bench.md) — tool-agent-user interaction in enterprise domains
- [OSWorld](OSWorld.md) — computer-use, GUI-grounded
- [WebArena](WebArena.md) — web navigation, static environment
- [BrowseComp](BrowseComp.md) — hard-to-find web information
- [GDPval](../agent/GDPval.md) — economically valuable knowledge-worker tasks

## Update log

- 2026-04-15: Initial entry
