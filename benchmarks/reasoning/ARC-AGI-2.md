# ARC-AGI-2

> The 2025 evolution of François Chollet's Abstraction and Reasoning Corpus — grid-based few-shot reasoning puzzles designed to measure fluid intelligence that cannot be scaled away.

|  |  |
|---|---|
| **Category** | reasoning / fluid intelligence |
| **Released** | 2025 (ARC-AGI-2); ARC-AGI-1 in 2019; ARC-AGI-3 announced as a competition track for 2026 |
| **Paper** | Original ARC: [arXiv:1911.01547](https://arxiv.org/abs/1911.01547) ("On the Measure of Intelligence"); ARC-AGI-2 details on the official site |
| **Project / Code** | [arcprize.org](https://arcprize.org/) · [github.com/arcprize/ARC-AGI](https://github.com/arcprize/ARC-AGI) |
| **Maintainer** | ARC Prize Foundation (François Chollet + team) |
| **Size** | _unknown_ (public eval set typically ~100 tasks; private sets held out) |
| **License** | open for evaluation; private test sets withheld |
| **Status** | active; described by the foundation as *"the world's only unbeaten benchmark that measures agentic intelligence"* |

## What it measures

Fluid, programmatic reasoning on visual grid puzzles. Each task gives the model a small number of (input-grid, output-grid) example pairs and asks it to infer the transformation rule, then apply that rule to one or more test inputs.

The explicit design philosophy is that tasks are "easy for humans, hard for AI" and resistant to memorization or scale. ARC-AGI-2 tightens ARC-AGI-1 by pruning tasks that LLMs learned to solve through pattern matching and by raising the abstraction bar.

The 2026 ARC Prize competition runs both ARC-AGI-2 and the new **ARC-AGI-3** track, with over $2M in prizes on Kaggle — [arcprize.org](https://arcprize.org/).

## Task format

- **Input:** 1–N training examples, each a pair of coloured grids. Grids are small (typically ≤ 30×30) with up to 10 colours.
- **Output:** the transformed grid for each given test input.
- **Scoring:** exact-match accuracy. A task counts as passed only if every cell of the predicted grid matches the ground truth.
- **Splits:** public training / public eval / private holdout. Prize-track submissions run against the private holdout.

## Example

A canonical ARC-AGI task: the training pairs show a small coloured shape on an empty grid, and the "output" is the same shape drawn at 3× scale in a fixed corner. The model must infer the rule "copy the non-background object into the corner at 3× scale" and apply it to a new test grid.

_Source: sample tasks browsable at [arcprize.org](https://arcprize.org/) and [github.com/arcprize/ARC-AGI](https://github.com/arcprize/ARC-AGI)._

## Leaderboard (snapshot)

ARC Prize publishes both a public-eval leaderboard and a private-track leaderboard. Cite which.

| Model / System | Accuracy | Track | Source |
|---|---:|---|---|
| _seed pending_ | _unknown_ | _unknown_ | [arcprize.org](https://arcprize.org/) |

_ARC-AGI-1 has been effectively cracked by custom program-synthesis systems stacked on frontier LLMs; ARC-AGI-2 remains substantially harder and is the foundation's current headline metric._

## Critique & known issues

- **Narrow task ontology.** Coloured grid transformations under-represent the full space of fluid reasoning; high ARC scores do not translate directly to benefits on NL reasoning.
- **Cost-sensitive.** Program-synthesis / search-heavy approaches can brute-force high scores at huge compute cost. The ARC Prize introduces compute-efficiency constraints to push back on this.
- **Benchmark-as-thesis.** ARC is maintained by a foundation with a strong thesis ("scaling alone will not reach AGI"); be aware of framing effects when reading commentary.
- **"Unbeaten" is time-bounded.** Claim is accurate at a given snapshot but watch for rapid shifts when a new scaffold appears.

## Related benchmarks

- [HLE](HLE.md) — text-domain adversarial reasoning
- [GPQA Diamond](GPQA-Diamond.md) — expert-knowledge reasoning

## Update log

- 2026-04-15: Initial entry
