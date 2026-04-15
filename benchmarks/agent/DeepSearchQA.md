# DeepSearchQA

> Google/DeepMind's 2026 benchmark for *exhaustive* multi-step information-seeking: 900 handcrafted tasks across 17 fields that require agents to systematically collate, de-duplicate, and stop-reason over open-ended searches. Scored by F1 on the final answer set.

|  |  |
|---|---|
| **Category** | agent / deep research / information retrieval |
| **Released** | 2026-01 (arXiv submission); 2026-01-30 (v2) |
| **Paper** | [arXiv:2601.20975](https://arxiv.org/abs/2601.20975) |
| **Project / Code** | [kaggle.com/benchmarks/google/dsqa](https://www.kaggle.com/benchmarks/google/dsqa) · dataset on [huggingface.co/datasets/google/deepsearchqa](https://huggingface.co/datasets/google/deepsearchqa) |
| **Maintainer** | Google DeepMind |
| **Size** | 900 prompts across 17 fields |
| **License** | _unknown_ |
| **Status** | active; hosted as a live Kaggle leaderboard; featured in 2026 frontier model cards |

## What it measures

Whether a deep-research agent can execute complex search plans to produce *exhaustive* answer lists — not just retrieve a fact, but *collect* all relevant items, *de-duplicate* them, and *reason about stopping criteria* when the search space is open-ended.

The benchmark deliberately targets three capabilities that traditional QA benchmarks under-test: **(1)** collating fragmented information from disparate sources, **(2)** entity resolution / de-duplication, **(3)** stop-reasoning in open-ended searches. Every task is a causal chain where each step depends on the prior — heavily stresses long-horizon planning and context retention.

## Task format

- **Input:** a handcrafted multi-step information-seeking prompt (e.g., "Find all pharmaceutical companies that received FDA breakthrough designation for an Alzheimer's drug since 2020, and for each, list the CEO and 2023 revenue").
- **Output:** a final *set* of items (or list of tuples).
- **Scoring:** strictly outcome-based — Precision / Recall / F1 over the submitted set vs. the reference. Trajectory is not graded.
- **Splits:** single 900-prompt set.

## Example

Representative prompt style (reconstructed from descriptions): *"Return every Turing Award winner who also wrote a published science-fiction novel; for each, include the novel's title."* The agent must enumerate, filter, and verify. Completeness matters as much as precision.

_Source: [arXiv:2601.20975](https://arxiv.org/abs/2601.20975) · dataset viewer at [huggingface.co/datasets/google/deepsearchqa](https://huggingface.co/datasets/google/deepsearchqa)._

## Leaderboard (snapshot)

| Model | Score | Source-reported-by | Source |
|---|---:|---|---|
| Kimi K2.5 | 77.1 | self-reported | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Claude 4.5 Opus (Kimi-reported) | 76.1 | — | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| GPT-5.2 (Kimi-reported) | 71.3 | — | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Gemini 3 Pro (Kimi-reported) | 63.2 | — | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| DeepSeek V3.2 (Kimi-reported) | 60.9 | — | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |

_Live leaderboard is on [Kaggle](https://www.kaggle.com/benchmarks/google/dsqa)._

## Critique & known issues

- **Set-based F1 is the right metric** but exposes the de-dup problem: models that emit near-duplicates get double-penalised (false positives lower precision; deduping to one hurts recall if the rubric counts both entries).
- **Tool-use budget matters.** A model with aggressive browsing budgets will exhaust stopping-criteria reasoning and over-emit; tight budgets under-emit. Report budget with score.
- **17 fields is broad but uneven.** A few fields dominate the N=900 distribution; per-field analysis is more informative than the overall number.
- **Stop-criteria is a language-model skill.** The benchmark rewards *knowing when to stop*, which is an explicit deficit for models without explicit "have I found everything?" planning.
- **Web drift.** As the web changes, some ground-truth sets can go stale; Google's team rotates the dataset periodically.

## Related benchmarks

- [WideSearch](WideSearch.md) — ByteDance sibling on broad info-seeking, stricter table-filling task
- [BrowseComp](BrowseComp.md) — single-answer deep research
- [DeepResearch-Bench](DeepResearch-Bench.md) — report-generation cousin

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 5 rows from Kimi K2.5 model card (Kimi K2.5 77.1; Claude 4.5 Opus 76.1; GPT-5.2 71.3; Gemini 3 Pro 63.2; DeepSeek V3.2 60.9)
