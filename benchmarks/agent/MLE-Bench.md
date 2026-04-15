# MLE-Bench

> 75 Kaggle competitions curated by OpenAI as end-to-end machine-learning-engineering tasks. Best reported system (o1-preview + AIDE scaffolding) hits a bronze-medal or better on only 16.9% of competitions.

|  |  |
|---|---|
| **Category** | agent / ML engineering |
| **Released** | 2024-10-09 (v1); most recent version 2025-02-26 |
| **Paper** | [arXiv:2410.07095](https://arxiv.org/abs/2410.07095) |
| **Project / Code** | [github.com/openai/mle-bench](https://github.com/openai/mle-bench) |
| **Maintainer** | OpenAI (Chan, Chowdhury, Jaffe, Aung, Sherburn, Mays, Starace, Liu, Maksin, Patwardhan, Weng, Mądry) |
| **Size** | 75 Kaggle competitions |
| **License** | open-sourced with the paper |
| **Status** | active; the canonical ML-engineering agent benchmark |

## What it measures

Whether an agent can do the entire machine-learning-engineer workflow: ingest a Kaggle problem description, explore data, build a model, iterate, and submit predictions that would medal on the real Kaggle leaderboard.

Human performance is calibrated against each competition's public Kaggle leaderboard, so a model's "score" has a concrete interpretation — "would this submission have medalled in the real contest?". The benchmark reports bronze-medal rate as the headline metric.

## Task format

- **Input:** a Kaggle competition's full public description, data, and baseline scripts. Agents can run arbitrary Python in a sandbox.
- **Output:** a submission file formatted for the competition.
- **Scoring:** the submission is scored on the competition's actual metric; compared against Kaggle's public leaderboard to assign medal tier (bronze / silver / gold) or no-medal. The headline number is % competitions in which the agent reaches *at least bronze*.
- **Splits:** 75 competitions; can be filtered by difficulty tier. The paper includes investigations on resource scaling and on pre-training contamination effects.

## Example

The benchmark includes competitions such as tabular prediction problems, image-classification challenges, and NLP tasks. A representative task: "Given a 50k-row tabular dataset predicting bank-loan default, produce submissions beating the baseline; medal thresholds come from the real Kaggle leaderboard."

_Source: [github.com/openai/mle-bench](https://github.com/openai/mle-bench) — competition list and task cards._

## Leaderboard (snapshot)

| Model / Agent Scaffold | Bronze-or-better rate | Date | Source |
|---|---:|---|---|
| o1-preview + AIDE scaffolding | 16.9% | 2024-10 | [arXiv:2410.07095](https://arxiv.org/abs/2410.07095) |

_Later agents and scaffolds (OpenDevin-style, GPT-5 + successors) have reported higher numbers; seed with source-linked rows from subsequent papers._

## Critique & known issues

- **Kaggle ≠ production ML engineering.** Contest tasks have clean objectives and clean data; real ML engineering is mostly plumbing.
- **Contamination risk is severe.** Kaggle discussion threads, winning-solution write-ups, and top notebooks are indexed on GitHub and plausibly in pre-training data. The paper's own contamination investigation is worth reading before citing numbers.
- **Compute-bound.** Performance depends heavily on the compute budget granted per task; reports that fix a specific budget (hours or USD) are comparable; reports that leave it open are not.
- **Scaffold-dominant.** AIDE / ChannelDev / agentic-harness choice is often the bigger lever than the base model.
- **75 competitions is a long tail.** A handful of easy competitions can drive the headline rate up or down several points.

## Related benchmarks

- [SWE-bench Verified](../coding/SWE-bench-Verified.md) — software-engineering (not ML-engineering) analog
- [SWE-Lancer](SWE-Lancer.md) — freelance-engineering counterpart
- DSBench / DiscoveryBench — data-science-focused siblings

## Update log

- 2026-04-15: Initial entry
