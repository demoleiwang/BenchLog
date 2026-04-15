# VitaBench

> Meituan Longcat's 400-task benchmark for **real-world interactive agents** — food delivery, in-store consumption, online travel — grounded in Meituan's actual service platform. 66 tools, 100 cross-scenario + 300 single-scenario tasks. Accepted to ICLR 2026.

|  |  |
|---|---|
| **Category** | agent / real-world interactive |
| **Released** | 2025-09-26 (arXiv submission); accepted to ICLR 2026 |
| **Paper** | [arXiv:2509.26490](https://arxiv.org/abs/2509.26490) |
| **Project / Code** | [vitabench.github.io](https://vitabench.github.io/) · [github.com/meituan-longcat/vitabench](https://github.com/meituan-longcat/vitabench) · dataset [huggingface.co/datasets/meituan-longcat/VitaBench](https://huggingface.co/datasets/meituan-longcat/VitaBench) |
| **Maintainer** | Meituan Longcat Team |
| **Size** | 100 cross-scenario tasks + 300 single-scenario tasks; 66-tool simulation environment |
| **License** | per HF dataset + GitHub |
| **Status** | active; ICLR 2026 |

## What it measures

Whether an agent can complete realistic service-economy tasks — ordering food, booking travel, managing in-store purchases — in a simulation environment modeled on Meituan's real platform. Each task is drawn from multiple real user requests and requires reasoning across temporal + spatial dimensions, using complex tool sets, proactively clarifying ambiguous instructions, and tracking shifting user intent through multi-turn conversations.

The benchmark's novel positioning is the **policy-free framework**: rather than hardcoding domain rules, VitaBench enables flexible composition of scenarios and tools, yielding cross-scenario tasks that test generalisation (e.g. a task that touches both delivery and travel APIs).

Evaluation uses a **rubric-based sliding window evaluator** — robust against stochastic trajectories while still rubric-verifiable.

## Task format

- **Input:** multi-turn user conversation with shifting / ambiguous intent, in a simulated service environment with 66 tools.
- **Output:** tool-call trajectory + final state (order placed, booking made, etc.).
- **Scoring:** rubric-based sliding-window evaluator on the trajectory + final state. Binary success per task; overall success rate.
- **Splits:** 100 cross-scenario + 300 single-scenario.

## Example

Representative task (reconstructed): *"User wants dinner delivered before their flight tomorrow; initially asks for Italian but changes mind to Chinese after seeing options; also needs a car to the airport; budget 300 RMB total."* The agent must order food, book transport, handle the mid-conversation intent shift, and respect the budget across domains.

_Source: [vitabench.github.io](https://vitabench.github.io/) and [github.com/meituan-longcat/vitabench](https://github.com/meituan-longcat/vitabench)._

## Leaderboard (snapshot)

| Model | Score | Source-reported-by | Source |
|---|---:|---|---|
| Claude 4.5 Opus (Qwen-reported) | 56.3 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Gemini 3 Pro (Qwen-reported) | 51.6 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Qwen3.5-397B-A17B | 49.7 | self-reported | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| GPT-5.2 (Qwen-reported) | 38.2 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Frontier models at ICLR-2026 submission | < 30% on cross-scenario; < 50% on single-scenario | launch paper | [arXiv:2509.26490](https://arxiv.org/abs/2509.26490) |

## Critique & known issues

- **Simulated environment ≠ real Meituan.** Claims don't automatically generalise to production service deployment. Helpful for training, not a deployment gate.
- **Policy-free is double-edged.** Tools without hardcoded domain rules mean the simulator can accept unrealistic outcomes; graders must compensate.
- **Rubric-based grading depends on the LLM-as-judge.** Cross-judge variance is not yet well-documented.
- **Cross-scenario difficulty dominates.** The 30% vs. 50% gap (cross-scenario vs single) is substantial — report both.
- **Mandarin-leaning.** The underlying service ecosystem reflects Chinese consumer behaviour. Models tuned for Chinese conversational UX may have a natural advantage.

## Related benchmarks

- [DeepPlanning](DeepPlanning.md) — planning-focused sibling
- [τ²-bench](tau-bench.md) — tool-user consistency
- [GAIA](GAIA.md) — assistant tasks
- [Tool-Decathlon](Tool-Decathlon.md) — broader tool span, less domain-grounded

## Update log

- 2026-04-15: Initial entry; seeded with 4 Qwen-reported rows + launch-paper frontier range
