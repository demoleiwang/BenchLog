# Tool Decathlon (Toolathlon)

> A 108-task benchmark spanning **32 apps and 604 tools** — Google Calendar, Notion, Kubernetes, BigQuery, WooCommerce, etc. — with execution-based verification. Claude 4.5 Sonnet tops at 38.6% despite averaging 20+ tool calls per task.

|  |  |
|---|---|
| **Category** | agent / tool use / long-horizon |
| **Released** | 2025-10 (arXiv submission); updates through 2026-02 |
| **Paper** | [arXiv:2510.25726](https://arxiv.org/abs/2510.25726) |
| **Maintainer** | per arXiv |
| **Size** | 108 tasks; 32 applications; 604 tools |
| **License** | _unknown_ |
| **Status** | active; a realistic stress-test for tool-using agents |

## What it measures

Whether a language agent can complete **realistic long-horizon tasks** across a diverse set of production apps — not toy APIs, not in-memory state. Tasks require interacting with multiple apps over many turns (average ~20 turns per task) with **execution-based verification** via per-task deterministic evaluation scripts.

The paper's thesis: LLM-as-judge is unreliable for agent evaluation; deterministic rules on final environment state are more reproducible. Every one of the 108 tasks has a hand-crafted evaluation script that checks the app's state after the agent's trajectory finishes.

## Task format

- **Input:** natural-language task description + access to 32 apps with 604 tools total.
- **Output:** a multi-step tool-call trajectory resulting in specific changes across the apps (files created, calendars updated, pipelines deployed, etc.).
- **Scoring:** per-task evaluation script checks final state across affected apps. Binary success per task; overall = % success.
- **Average task length:** ~20 turns per task.

## Example

Representative task (paraphrased from the benchmark profile): *"Using Notion + Google Calendar + Slack, find all meetings scheduled for next week that lack an agenda in their Notion doc, create agenda drafts for each, post in Slack with an @mention to the meeting owner, and add a ✅ emoji to the calendar invite when done."* Success = all three apps end in the expected state.

_Source: [arXiv:2510.25726](https://arxiv.org/abs/2510.25726)._

## Leaderboard (snapshot)

| Model | Score | Source-reported-by | Source |
|---|---:|---|---|
| GPT-5.5 (Toolathlon) | 55.6 | OpenAI launch, 2026-04-23 | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| DeepSeek V4-Pro Max (Toolathlon) | 51.8 | self-reported, 2026-04-24 | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| GLM-5.1 Thinking (DS-reported, Toolathlon) | 40.7 | DeepSeek V4 card | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| GPT-5.4 (OpenAI-reported) | 54.6 | GPT-5.5 launch | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| GPT-5.4 (xhigh, Kimi-reported, Toolathlon) | 54.6 | Kimi K2.6 card | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Kimi K2.6 (Toolathlon) | 50.0 | self-reported, 2026-04-20 | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Gemini 3.1 Pro (thinking high, Kimi-reported, Toolathlon) | 48.8 | Kimi K2.6 card | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Gemini 3.1 Pro (OpenAI-reported, Toolathlon) | 48.8 | GPT-5.5 launch | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| Claude Opus 4.6 (max effort, Kimi-reported, Toolathlon) | 47.2 | Kimi K2.6 card | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Claude-4.5-Sonnet | 38.6% (avg 20.2 tool-calling turns/task) | paper | [arXiv:2510.25726](https://arxiv.org/abs/2510.25726) |
| GPT-5.2 (Qwen-reported) | 43.8 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Claude 4.5 Opus (Qwen-reported) | 43.5 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Qwen3.5-397B-A17B | 38.3 | self-reported | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Gemini 3 Pro (Qwen-reported) | 36.4 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| DeepSeek-V3.2-Exp | 20.1% | top open-weights model at launch | [arXiv:2510.25726](https://arxiv.org/abs/2510.25726) |

_Note the ~20-point gap between Claude-4.5-Sonnet (38.6%) and the top open-weights result (20.1%) at launch — largest open-vs-frontier gap among the tool-using benchmarks currently tracked._

## Critique & known issues

- **Execution-based is the gold standard, but the eval scripts are hand-crafted.** 108 scripts means per-task testing coverage varies; some are tighter than others.
- **32 apps — but real-world orgs use more.** A model strong at Calendar+Notion+Slack can look great while failing at enterprise-specific apps.
- **Turn budget bias.** With avg 20 turns/task, token cost per run is substantial; low-compute evaluations under-report what a well-budgeted agent could do.
- **Contamination.** Open-source app documentation is all over GitHub. Base-model familiarity with specific tool APIs is high.
- **"Tool Decathlon" ≠ "Tool Decathlon suite of 10".** The name is evocative, not structural; it's a unified benchmark, not 10 sub-benchmarks.

## Related benchmarks

- [MCPMark](MCPMark.md) — MCP-protocol-specific, narrower tool span
- [BFCL](BFCL.md) — function-calling accuracy, shorter horizon
- [VitaBench](VitaBench.md) — service-economy agent tasks, narrower domain
- [τ²-bench](tau-bench.md) — consistency-focused, narrower domain

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 6 rows from the launch paper and Qwen3.5 card
- 2026-04-24: added 7 rows reporting the **Toolathlon** variant (same benchmark, alt name in Kimi / OpenAI tables) — **GPT-5.5 55.6 (new SOTA)**, GPT-5.4 54.6, Kimi K2.6 50.0, Gemini 3.1 Pro 48.8, Claude Opus 4.6 47.2. Sources: OpenAI GPT-5.5 launch, Kimi K2.6 card.
- 2026-04-28: added 2 DS-reported rows — DeepSeek V4-Pro Max 51.8, GLM-5.1 Thinking 40.7. Source: huggingface.co/deepseek-ai/DeepSeek-V4-Pro.
