# DeepPlanning

> Alibaba Qwen's January 2026 benchmark for **long-horizon agentic planning** with *verifiable global constraints* — time budgets, cost limits, combinatorial optimisation that must hold across an entire multi-day plan. Even frontier models score 23–45%.

|  |  |
|---|---|
| **Category** | agent / planning / long-horizon |
| **Released** | 2026-01-27 (open-sourced) |
| **Paper** | [arXiv:2601.18137](https://arxiv.org/abs/2601.18137) |
| **Project / Code** | [qwenlm.github.io/Qwen-Agent/en/benchmarks/deepplanning](https://qwenlm.github.io/Qwen-Agent/en/benchmarks/deepplanning/) · [github.com/QwenLM/Qwen-Agent](https://github.com/QwenLM/Qwen-Agent) · dataset [huggingface.co/datasets/Qwen/DeepPlanning](https://huggingface.co/datasets/Qwen/DeepPlanning) |
| **Maintainer** | Alibaba Qwen Team |
| **Size** | _unknown_ (v1.1 dataset released; scored via dedicated leaderboard in Qwen-Agent) |
| **License** | per Qwen-Agent repo |
| **Status** | active; cited in Qwen 3.5 launch; planning-focused evaluation niche |

## What it measures

Whether an agent can produce **holistically valid** plans for realistic multi-day travel and multi-product shopping tasks — where success depends not just on step-level correctness but on **global constraints**: total budget caps, time feasibility across days, combinatorial optimisation.

DeepPlanning frames three distinct agent abilities:

1. **Proactive Information Acquisition** — actively calling APIs to discover hidden environment state (not assuming all relevant facts are given).
2. **Local Constrained Reasoning** — satisfying step-level logic (brand, size, hotel amenity match).
3. **Global Constrained Optimisation** — holistic boundaries like total budget and multi-day time feasibility that must be consistent across the whole plan.

The benchmark's contribution is that planning correctness is **verifiable** — it has objective, mechanically-checkable constraints (time math, money math, compatibility), unlike many soft-evaluated planning benchmarks. This is a natural fit for RL-style agent training loops.

## Task format

- **Input:** a realistic multi-day travel plan or multi-product shopping goal with explicit constraints (budget, calendar, preferences).
- **Output:** a structured plan — itinerary / order list with times, prices, selections.
- **Scoring:** verifiable constraint satisfaction — time, cost, compatibility — plus plan completeness.
- **Splits:** v1.1 current; leaderboard maintained in [Qwen-Agent repo](https://github.com/QwenLM/Qwen-Agent).

## Example

Representative task (paraphrased): *"Plan a 5-day Tokyo trip for 2 adults in November 2026 with a total budget of ¥600,000 including flights from SFO, at least 2 Michelin-starred meals, zero early-morning wake-ups, ending with a Mt. Fuji day-trip. Submit a complete itinerary."* The agent must call flight APIs, hotel APIs, restaurant APIs, and produce a plan whose total cost, daily schedule, and constraint satisfaction are all mechanically checkable.

_Source: [qwenlm.github.io/Qwen-Agent/en/benchmarks/deepplanning](https://qwenlm.github.io/Qwen-Agent/en/benchmarks/deepplanning/)._

## Leaderboard (snapshot)

| Model | Score | Source |
|---|---:|---|
| GPT-5.2 (Qwen-reported) | 44.6 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Qwen3.5-397B-A17B | 34.3 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Claude 4.5 Opus (Qwen-reported) | 33.9 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Gemini 3 Pro (Qwen-reported) | 23.3 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |

_The 23–45% frontier range at launch highlights how under-developed global-constraint planning is in current agentic LLMs._

## Critique & known issues

- **Verifiability is a strength but narrows scope.** The benchmark privileges tasks where correctness is mechanically checkable; "soft-success" planning (e.g., did the plan feel enjoyable?) is out of scope.
- **API dependency.** Performance partially tracks whether the evaluation harness's simulated APIs match model expectations; real-world API drift is a separate (larger) risk.
- **Two-domain bias.** Travel and shopping are the current domains — good for verifiability, limited for generalisation claims about planning.
- **Qwen-originated.** Worth watching for independent replications (not all benchmark leaderboards survive scrutiny when the benchmark author also competes).
- **Parallel tool use is a key capability.** The paper highlights that parallelism correlates with success — single-threaded sequential agents under-perform.

## Related benchmarks

- [VitaBench](VitaBench.md) — similar real-world agent setting, less planning-focused
- [Tool-Decathlon](Tool-Decathlon.md) — broader tool span, less constraint-focused
- [GAIA](GAIA.md) — assistant tasks, shorter horizon
- [τ²-bench](tau-bench.md) — tool-user interaction consistency

## Update log

- 2026-04-15: Initial entry; seeded with 4 Qwen-reported leaderboard rows from Qwen3.5-397B model card
