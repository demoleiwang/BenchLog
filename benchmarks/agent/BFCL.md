# BFCL — Berkeley Function-Calling Leaderboard

> UC Berkeley's long-running leaderboard for function / tool calling accuracy — the de-facto benchmark for "can this model reliably call APIs". Now at v4 with multi-turn and agentic evaluation.

|  |  |
|---|---|
| **Category** | agent / tool use / function calling |
| **Released** | v1 2024; v2 2024; v3 added multi-turn; **v4 released 2026-04-12** (latest as of this entry) |
| **Project** | [gorilla.cs.berkeley.edu/leaderboard.html](https://gorilla.cs.berkeley.edu/leaderboard.html) · [github.com/ShishirPatil/gorilla](https://github.com/ShishirPatil/gorilla) |
| **Maintainer** | UC Berkeley (Shishir G. Patil et al.) |
| **Size** | task count varies by sub-category; single-turn + multi-turn + live + agentic |
| **License** | project code Apache-2.0; data per-category |
| **Status** | **live** — frequently updated; one of the few always-current agent leaderboards |

## What it measures

Whether a language model correctly invokes functions / tools — from trivial single-function calls to multi-turn dialogues with complex APIs to open-web agentic tasks. Each version has added a new dimension:

- **v1** — simple function calls (AST-based correctness)
- **v2** — enterprise + open-source community-contributed functions, broader realism
- **v3** — multi-turn interactions (conversation state, retries, tool-output dependence)
- **v4** — "holistic agentic evaluation", incorporating web search

The metric set includes not just accuracy but **cost (USD)**, **latency (seconds)**, and **format sensitivity** — making BFCL one of the few leaderboards that surfaces production-relevant trade-offs alongside quality.

## Task format

- **Input:** a function / tool schema + a user query. In v3/v4, also conversation history and live tool outputs.
- **Output:** a function call (or sequence of calls) with correct arguments.
- **Scoring:** AST-based match for argument structure + execution-based correctness where applicable. Categorised by "Simple / Parallel / Multiple / Parallel-Multiple / Relevance / Live / Multi-Turn / Agentic".
- **Splits:** by sub-category; overall BFCL score is a weighted mix.

## Example

A Simple-category task might provide a `search_flights(origin, destination, date)` spec and ask the model to handle "Find me a flight from SFO to JFK next Friday." The model must emit a syntactically and semantically correct function call. v4 agentic tasks embed this in a multi-step web-search scenario.

_Source: sample tasks in [gorilla.cs.berkeley.edu/leaderboard.html](https://gorilla.cs.berkeley.edu/leaderboard.html) and [github.com/ShishirPatil/gorilla/tree/main/berkeley-function-call-leaderboard](https://github.com/ShishirPatil/gorilla/tree/main/berkeley-function-call-leaderboard)._

## Leaderboard (snapshot)

The official leaderboard at [gorilla.cs.berkeley.edu/leaderboard.html](https://gorilla.cs.berkeley.edu/leaderboard.html) is always current — cite it directly rather than duplicating stale rows here.

| Model | Overall accuracy | Version | Source |
|---|---:|---|---|
| Claude 4.5 Opus | 77.5 | V4 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Qwen3.5-397B-A17B | 72.9 | V4 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Gemini 3 Pro | 72.5 | V4 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| GPT-5.2 | 63.1 | V4 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| _live leaderboard — fetch additional rows during daily update_ | _unknown_ | V4 | [gorilla.cs.berkeley.edu/leaderboard.html](https://gorilla.cs.berkeley.edu/leaderboard.html) |

## Critique & known issues

- **AST matching under-rewards semantically-correct-but-syntactically-different calls.** A model that structures args differently but equivalently may be marked wrong.
- **Tool schema quality varies.** Community-contributed functions have inconsistent documentation; models sensitive to schema framing score more variably across categories than across models.
- **Cost / latency metrics are vendor-dependent.** Self-hosted models and API-only models are not directly comparable on cost.
- **Multi-turn evaluation is fragile.** State bookkeeping inside the eval harness can introduce false negatives when the model's reply is semantically correct but phrased unexpectedly.
- **Frontier saturation on Simple.** Single-function cats saturate quickly; watch Multi-Turn and Agentic for real discriminative signal.

## Related benchmarks

- [τ-bench / τ²-bench](tau-bench.md) — realism-focused tool use with simulated users
- AceBench — alternative function-calling leaderboard (mentioned in Kimi K2 abstract)
- [GAIA](GAIA.md) — broader assistant benchmark with tool-use sub-components
- API-Bank — earlier function-calling benchmark, mostly superseded

## Update log

- 2026-04-15: Initial entry; v4 noted as current (released 2026-04-12). Leaderboard rows intentionally kept as pointer to live page — fetch during daily update when specific scores are needed.
- 2026-04-15 (session 1 extension): added 4 V4 rows from Qwen3.5 card — Claude 4.5 Opus (77.5), Qwen3.5-397B (72.9), Gemini 3 Pro (72.5), GPT-5.2 (63.1)
