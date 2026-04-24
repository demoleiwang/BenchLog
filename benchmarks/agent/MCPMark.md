# MCPMark

> A 127-task stress-test for agents using the **Model Context Protocol** (MCP) in real-world workflows. Focused on rich CRUD interactions; even the strongest model (gpt-5-medium) reaches only 52.56% pass@1 and 33.86% pass^4.

|  |  |
|---|---|
| **Category** | agent / MCP / tool use |
| **Released** | 2025-10 |
| **Paper** | [arXiv:2509.24002](https://huggingface.co/papers/2509.24002) — via [huggingface.co/papers/2509.24002](https://huggingface.co/papers/2509.24002) |
| **Size** | 127 tasks, expert + AI-collaboratively authored |
| **License** | _unknown_ |
| **Status** | active; a rigorous MCP-use benchmark, distinct from [MCP-Bench](MCP-Bench.md) |

## What it measures

Whether an agent can accomplish **rich, stateful workflows** over MCP servers — tasks that span Create / Read / Update / Delete (CRUD) operations and require deep environment interaction, not just tool *selection* or isolated calls.

The benchmark's design emphasis is on **stress-testing**: each task is designed to demand many execution turns (avg 16.2) and many tool calls (avg 17.4) per task. Compared to earlier MCP benchmarks, MCPMark surfaces where agents degrade under sustained multi-step interaction.

Naming note: Qwen3.5 model card lists this as "MCP-Mark" with a hyphen; the arXiv paper and project spell it "MCPMark" without. They are the same benchmark.

## Task format

- **Input:** a multi-step task expressed in natural language, backed by live MCP servers.
- **Output:** a tool-call trajectory that produces a specific final environment state.
- **Scoring:** **pass@1** (single attempt success) and **pass^4** (all 4 independent runs must succeed — stricter consistency metric).
- **Splits:** 127 tasks.

## Example

Representative task (paraphrased from the paper's descriptions): *"In a Notion workspace, create a new database for 'Q2 Planning', populate it with 10 items extracted from an attached spreadsheet, link each item to an existing team-page, and generate a summary doc that cites each item by page ID."* The task tests create, read, update across multiple Notion objects in one coherent workflow.

_Source: [huggingface.co/papers/2509.24002](https://huggingface.co/papers/2509.24002)._

## Leaderboard (snapshot)

| Model | pass@1 | pass^4 | Source |
|---|---:|---:|---|
| GPT-5.4 (xhigh, Kimi-reported) | 62.5 | — | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Claude Opus 4.6 (max effort, Kimi-reported) | 56.7 | — | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Gemini 3.1 Pro (thinking high, Kimi-reported) | 55.9 | — | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Kimi K2.6 | 55.9 | — | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| GPT-5.2 (Qwen-reported) | 57.5 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| gpt-5-medium (paper) | 52.56 | 33.86 | [huggingface.co/papers/2509.24002](https://huggingface.co/papers/2509.24002) |
| Gemini 3 Pro (Qwen-reported) | 53.9 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Qwen3.5-397B-A17B | 46.1 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Claude 4.5 Opus (Qwen-reported) | 42.3 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| claude-sonnet-4 / o3 (paper) | < 30 | < 15 | [huggingface.co/papers/2509.24002](https://huggingface.co/papers/2509.24002) |

_pass^4 (all 4 runs correct) is substantially stricter than pass@1 — gpt-5-medium drops from 52.56 to 33.86 under the consistency metric._

## Critique & known issues

- **MCP ecosystem is young.** Benchmark realism depends on which MCP servers are used; 2026 server stacks differ from 2025 baselines, so re-reproduction is harder than for static benchmarks.
- **"Stress-testing" means tasks are intentionally hard.** Absolute scores look low, but the gap *structure* (model X > model Y by 10 points) is the useful signal.
- **Claude 4.5 Opus rank is anomalous.** In the paper, Claude Sonnet 4 / o3 are in the < 30 range; Qwen's Claude 4.5 Opus re-run at 42.3 reflects model progress since paper submission. Always cite the reporting harness.
- **pass^4 can hide strong single-run capability.** A model at 50% pass@1 gets pass^4 ≈ 6% even if well-calibrated; consistency is a separate axis.

## Related benchmarks

- [MCP-Bench](MCP-Bench.md) — Accenture's 28-server / 250-tool MCP benchmark (distinct from MCPMark)
- [Tool-Decathlon](Tool-Decathlon.md) — broader tool / app span without MCP focus
- [BFCL](BFCL.md) — function-calling accuracy, not MCP-specific
- [τ²-bench](tau-bench.md) — consistency-focused, narrower domain

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with paper baselines + 4 Qwen-reported frontier rows
- 2026-04-24: added 4 rows from Kimi K2.6 card — GPT-5.4 (xhigh) 62.5, Claude Opus 4.6 56.7, Gemini 3.1 Pro 55.9, Kimi K2.6 55.9. GPT-5.4 leads Kimi-reported table; all rows re-evaluated by Kimi so not directly comparable to Qwen-reported numbers above.
