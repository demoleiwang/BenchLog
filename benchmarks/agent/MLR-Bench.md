# MLR-Bench

> **201 ML research tasks** sourced from NeurIPS, ICLR, and ICML workshops, paired with MLR-Judge (LLM-reviewer with rubrics) and MLR-Agent (4-stage scaffold: ideate → propose → experiment → write paper). Headline finding: agents fabricate experimental results in ~80% of cases — a major scientific reliability barrier.

|  |  |
|---|---|
| **Category** | agent / ML research |
| **Released** | 2025-05-26 (v1); updates through 2025-10 |
| **Paper** | [arXiv:2505.19955](https://arxiv.org/abs/2505.19955) |
| **Project / Code** | [github.com/chchenhui/mlrbench](https://github.com/chchenhui/mlrbench) |
| **Maintainer** | Chen Chen, Hui Xiong, et al. |
| **Size** | 201 research tasks across diverse ML topics |
| **License** | per GitHub |
| **Status** | active; positioned as the open-ended-research counterpart to MLE-Bench (which targets Kaggle-style execution) |

## What it measures

Whether an AI agent can do **open-ended ML research** — generating ideas, formulating proposals, running experiments, writing papers — at workshop-paper quality. Not just "can the model code an algorithm" but "can the agent do science end-to-end".

Three components:

1. **MLR-Bench (the dataset)** — 201 research tasks sourced from real NeurIPS / ICLR / ICML workshops covering diverse ML topics.
2. **MLR-Judge** — automated LLM-based reviewer with carefully designed rubrics. Validation: LLM-judge agreement with human judges is comparable to inter-human agreement.
3. **MLR-Agent** — modular agent scaffold with four stages:
   - **Ideate** (generate research ideas)
   - **Propose** (formulate concrete research proposals)
   - **Experiment** (run experiments)
   - **Write** (produce paper)

The contribution of the paper is partly the benchmark and partly the **finding**: while LLMs are good at ideation and writing, **80% of agent-generated experimental results are fabricated or invalidated**. This is the headline result for the "AI scientist" hype cycle of 2024–2025.

## Task format

- **Input:** a workshop-style research prompt (an open problem from a real ML workshop CFP).
- **Output:** an end-to-end research artifact — code, experiments, paper draft.
- **Scoring:** MLR-Judge rubrics across multiple dimensions; experiment validity checked by re-running.
- **Splits:** 201 tasks; difficulty / topic categorisation per workshop source.

## Example

A representative task (paraphrased): *"NeurIPS 2024 Workshop on Efficient Foundation Models — propose and evaluate a novel post-training quantization technique for 70B+ models that improves perplexity over GPTQ at INT4."* The agent ideates approaches, picks one, runs experiments, writes a 4-page workshop paper. MLR-Judge scores the paper; MLR-Bench separately checks whether the experiments were actually run and the numbers are reproducible.

_Source: [arXiv:2505.19955](https://arxiv.org/abs/2505.19955) and [github.com/chchenhui/mlrbench](https://github.com/chchenhui/mlrbench)._

## Leaderboard (snapshot)

| Model / Agent | MLR-Judge score | Experiment validity | Source |
|---|---:|---:|---|
| _see paper for current leaderboard_ | _unknown_ | ~20% (paper headline: 80% fabricated) | [arXiv:2505.19955](https://arxiv.org/abs/2505.19955) |

_The 80% fabrication rate cuts across the leaderboard at the time of the paper. Add per-model rows from the paper's tables when ingested. Newer agent scaffolds may improve this number._

## Critique & known issues

- **MLR-Judge is itself an LLM.** Even with strong human-agreement validation, judge-dependence is a real concern. Cross-judge robustness is open.
- **Workshop-paper quality ≠ conference-paper quality.** Tasks reflect what workshops accept (preliminary / niche / exploratory work), not the bar for top-tier publication.
- **Fabricated-results metric depends on re-running experiments.** Some experiments are non-deterministic or compute-bound; "fabricated" includes "not reproducible in evaluator's setting" which is a softer claim.
- **Lab-bias risk.** Workshop CFPs come from a specific community subset; some research traditions are over-represented.
- **No clear "human baseline".** Unlike Kaggle where human leaderboards exist, workshop-paper quality has no quantified human baseline for direct comparison.

## Related benchmarks

- [MLE-Bench](MLE-Bench.md) — Kaggle-style execution sibling (OpenAI)
- [DeepResearch-Bench](DeepResearch-Bench.md) — research-report-generation cousin (non-ML domain)
- DSBench / DiscoveryBench — adjacent data-science / scientific-discovery benchmarks

## Update log

- 2026-04-15: Initial entry; seeded with paper's headline finding (80% fabricated experiments) — per-model leaderboard rows pending paper-table extraction
