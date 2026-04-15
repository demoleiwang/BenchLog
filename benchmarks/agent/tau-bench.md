# τ-bench (tau-bench)

> A benchmark for *reliable* tool-using agents: the same task is run k times and "pass@k" (or pass^k, consistency) is reported. Frontier tool-calling agents score below 50% on individual runs, and below 25% when asked to be consistent across 8 runs.

|  |  |
|---|---|
| **Category** | agent / tool use / multi-turn dialogue |
| **Released** | 2024-06-17 |
| **Paper** | [arXiv:2406.12045](https://arxiv.org/abs/2406.12045) |
| **Project / Code** | [github.com/sierra-research/tau-bench](https://github.com/sierra-research/tau-bench) |
| **Maintainer** | Sierra Research (Yao, Shinn, Razavi, Narasimhan) |
| **Size** | two domains (airline customer service + retail); task count per domain _unknown_ from the abstract |
| **License** | _unknown_ |
| **Status** | active; cited heavily in 2025 for "agents are unreliable" evidence |

## What it measures

Whether a tool-calling agent can follow domain-specific rules in multi-turn interactions with a simulated user, and — crucially — do so *consistently* across repeated trials.

The novel contribution is the evaluation protocol. Instead of reporting a single-run success rate, τ-bench emphasises **pass^k**: the probability that the agent gets a task right on *all* of k independent runs. This surfaces the gap between "agents sometimes succeed" and "agents reliably succeed" — the gap that matters for production deployment.

The paper reports that GPT-4o-class agents succeed on < 50% of tasks on a single run, and that retail-domain pass@8 drops below 25%. This finding — that reliability is far worse than sample-average success — became one of the most-cited results in the 2024–2025 agent literature.

## Task format

- **Input:** a simulated user turn with a goal expressed in natural language. The agent interacts over multiple turns, using a defined tool catalog (API calls representing the domain's DB).
- **Output:** a final database state after the conversation.
- **Scoring:** ground-truth database state at conversation end vs. agent-produced state. Aggregated as **pass@k** (at least one correct in k) and **pass^k** (all k correct). Pass^k is the benchmark's headline.
- **Splits:** airline and retail. The follow-up τ²-bench added further domains.

## Example

Retail domain: a user messages an assistant asking to return one item from a recent order, keep another, and apply a discount code that may or may not be valid per the store's rules. The agent must call the right APIs in the right order, apply policy correctly, and arrive at the correct final cart / return state.

_Source: [github.com/sierra-research/tau-bench](https://github.com/sierra-research/tau-bench) — sample trajectories in the repo README._

## τ-bench vs τ²-bench — disambiguation

Most model launch reports from mid-2025 onward cite **"Tau2"** scores, which come from **τ²-bench** — the successor benchmark that adds a *telecom* domain to τ-bench's airline + retail and introduces a dual-control setting where the user can also execute tool calls. Practitioners often drop the "2" and write "τ-bench" for both. Rows below are labelled with the domain + source so you can recover which variant is meant.

## Leaderboard (snapshot)

Most-recent-first. Note metric (Avg@k vs. pass@k vs. pass^k) — consistency-style metrics (pass^k) are strictly stricter than average-style metrics.

### τ-bench original (retail, airline)

| Model / Agent | Metric | Score | Source |
|---|---|---:|---|
| GLM-4.5 | TAU-bench overall (domain(s) not specified in abstract) | 70.1% | [arXiv:2508.06471](https://arxiv.org/abs/2508.06471) |
| GPT-4o (function calling) | pass@1 (retail) | < 50% | [arXiv:2406.12045](https://arxiv.org/abs/2406.12045) |
| GPT-4o (function calling) | pass^8 (retail) | < 25% | [arXiv:2406.12045](https://arxiv.org/abs/2406.12045) |

### τ²-bench (retail, airline, telecom)

| Model | Domain | Metric | Score | Source |
|---|---|---|---:|---|
| Claude Opus 4 | retail | Avg@4 | 81.8 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude Sonnet 4 | retail | Avg@4 | 75.0 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| GPT-4.1 | retail | Avg@4 | 74.8 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Kimi K2 | retail | Avg@4 | 70.6 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| DeepSeek-V3 | retail | Avg@4 | 69.1 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude Opus 4 | airline | Avg@4 | 60.0 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Kimi K2 | airline | Avg@4 | 56.5 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude Sonnet 4 | airline | Avg@4 | 55.5 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| GPT-4.1 | airline | Avg@4 | 54.5 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| DeepSeek-V3 | airline | Avg@4 | 39.0 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Kimi K2 | telecom | Avg@4 | 65.8 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude Opus 4 | telecom | Avg@4 | 57.0 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude Sonnet 4 | telecom | Avg@4 | 45.2 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| GPT-4.1 | telecom | Avg@4 | 38.6 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| DeepSeek-V3 | telecom | Avg@4 | 32.5 | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |

## Critique & known issues

- **Simulated users are not real users.** The user-simulator is itself an LLM; its realism bounds what the benchmark can claim about production behaviour.
- **Only two domains.** Airline and retail policy coverage is narrow. τ²-bench added more, but cross-domain generalisation claims remain tentative.
- **Pass^k is a strict metric.** It captures *consistency* rather than raw capability; a model that works 70% of the time has pass^8 of ~6%, which looks alarming but might still be useful in a human-in-the-loop setting.
- **Tool-schema sensitivity.** Agents are very sensitive to API schema choices; small format changes shift results several points.

## Related benchmarks

- [GAIA](GAIA.md) — short-answer assistant tasks, no consistency metric
- [OSWorld](OSWorld.md) — GUI-grounded computer use
- AgentBench — broader cross-domain agent suite
- [BrowseComp](BrowseComp.md) — browsing-specific, different slice

## Update log

- 2026-04-15: Initial entry; added τ²-bench disambiguation + seeded τ²-bench leaderboard (retail/airline/telecom, 15 rows) from Kimi K2 model card
