# AgentBench

> The first comprehensive multi-environment agent benchmark — 8 distinct environments (OS, DB, KG, web-shop, code etc.) that together test an LLM's ability to act over sequential state. Published at ICLR 2024.

|  |  |
|---|---|
| **Category** | agent / multi-environment |
| **Released** | 2023-08 (arXiv); ICLR 2024 |
| **Paper** | [arXiv:2308.03688](https://arxiv.org/abs/2308.03688) |
| **Project** | [github.com/THUDM/AgentBench](https://github.com/THUDM/AgentBench) |
| **Maintainer** | Tsinghua + 22 contributors (Xiao Liu et al.) |
| **Size** | 8 environments (specific per-env task counts in the repo) |
| **License** | Apache 2.0 |
| **Status** | foundational; newer benchmarks (τ-bench, GAIA, OSWorld, Terminal-Bench) have partially supplanted it for frontier reporting but it remains a stable reference |

## What it measures

Whether a language model can act as an agent across a suite of qualitatively different environments — not just web browsing, not just tool calling — covering Operating System, Database, Knowledge Graph, Digital Card Game, Lateral Thinking Puzzle, House-Holding (ALFWorld), Web Shopping (WebShop), and Web Browsing (Mind2Web).

The contribution at the time was scope: existing agent benchmarks tested one environment; AgentBench bundled 8 with a unified evaluation harness. Its headline claim — "a significant disparity in performance between leading commercial models and open-source models under 70B" — established an early frontier-gap narrative for agent capability.

## Task format

- **Input:** varies by environment — command-line sessions (OS), SQL interactions (DB), KG query episodes, game dialogues, etc.
- **Output:** action sequences appropriate to each environment.
- **Scoring:** per-environment success metrics, aggregated into a composite rank.
- **Splits:** 8 environments, each with its own dev/test; the composite overall score is the headline.

## Example

An OS-environment task (reconstructed from the benchmark's description): "Find the file whose contents include the string 'FIX ME' but whose filename does not end in `.md`. Report its absolute path." The model issues shell commands in a sandboxed VM; success is binary.

_Source: [github.com/THUDM/AgentBench](https://github.com/THUDM/AgentBench) — sample sessions in the repo._

## Leaderboard (snapshot)

| Model | Overall rank / score | Note | Source |
|---|---:|---|---|
| _see paper tables_ | _unknown_ | benchmark's own reporting is most reliable for cross-model comparison | [arXiv:2308.03688](https://arxiv.org/abs/2308.03688) |

_The original paper includes per-environment tables for GPT-4, GPT-3.5, Claude, and several open-source models. Numbers are point-in-time (2023); cite carefully when quoting. Newer models rarely report AgentBench because τ-bench / GAIA / OSWorld have overtaken it as the vendor-preferred frontier metric._

## Critique & known issues

- **Composite rankings hide per-env pathologies.** A model excellent at OS but failing at Mind2Web looks mid-tier overall; the per-env breakdown is the more informative view.
- **Environment age.** Some of the environments (ALFWorld, WebShop) predate AgentBench by years and have their own contamination profiles.
- **Static environment trajectories.** Unlike τ-bench's simulated user, AgentBench episodes have fixed initial conditions; agents can memorise initial moves.
- **Harness sensitivity.** Action-space framing (natural language vs. structured JSON) shifts scores substantially.
- **Supplanted for frontier reporting.** Kept as baseline, not used as the headline metric by major 2025+ launches.

## Related benchmarks

- [τ-bench](tau-bench.md) — sharper focus on tool-user consistency
- [GAIA](GAIA.md) — assistant Q&A, complementary
- [OSWorld](OSWorld.md) — successor-in-spirit for the OS dimension
- AppWorld — similar multi-environment positioning with more recent environments

## Update log

- 2026-04-15: Initial entry
