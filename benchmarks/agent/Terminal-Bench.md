# Terminal-Bench

> An agent benchmark for terminal mastery — AI systems solve 89 real-terminal tasks spanning software engineering, ML, security, and data science; scored by end-state success rate.

|  |  |
|---|---|
| **Category** | agent / terminal / systems |
| **Released** | v1 launched 2025; v2.0 is current; v3.0 in development |
| **Paper / Project** | [tbench.ai](https://www.tbench.ai/) · leaderboard at [tbench.ai/leaderboard/terminal-bench/2.0](https://www.tbench.ai/leaderboard) |
| **Maintainer** | Stanford + Laude Institute collaboration |
| **Size** | 89 tasks (v2.0) |
| **License** | _unknown_ |
| **Status** | active; frequently cited in 2025 agent launches (MiniMax-M2, Claude Sonnet 4.5, etc.) |

## What it measures

Whether an AI agent can operate a real Unix terminal end-to-end on tasks that span system administration, software engineering, ML model training, security, and data science — producing observable state changes (files, trained models, patched systems) rather than text answers.

Terminal-Bench is positioned as a "terminal mastery" benchmark — complementing GUI-use (OSWorld) and web-use (WebArena) benchmarks by testing the third major action space where humans get real work done. v2.0 tightens v1 by pruning flaky or under-specified tasks.

## Task format

- **Input:** natural-language task description + a sandboxed shell environment with pre-populated files, software, and permissions.
- **Output:** a trajectory of shell commands and their resulting state.
- **Scoring:** task resolution success-rate. Each task has an end-state verifier (file exists with expected content, model trained and reaches target accuracy, log shows exploit mitigated, etc.).
- **Splits:** v2.0 = 89 tasks. Categories cover SWE, ML, security, data science.

## Example

A representative task (reconstructed from the benchmark's self-description): *"Clone this repo, diagnose why the CI build is failing, fix the failing test case, and push a patch branch. Success = CI green on the branch."*

_Source: task samples documented on [tbench.ai](https://www.tbench.ai/)._

## Leaderboard (snapshot)

The official leaderboard is at [tbench.ai/leaderboard/terminal-bench/2.0](https://www.tbench.ai/leaderboard). Scores from secondary sources below; harness choice matters.

| Model / Agent | Score (Terminal-Bench 2.0) | Source |
|---|---:|---|
| GPT-5.5 | 82.7 | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| DeepSeek V4-Pro Max | 67.9 | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| GLM-5.1 Thinking (DS-reported) | 63.5 | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| Claude Mythos Preview | 82.0 | [red.anthropic.com/2026/mythos-preview](https://red.anthropic.com/2026/mythos-preview/) |
| GPT-5.4 (OpenAI-reported) | 75.1 | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| Claude Opus 4.7 (OpenAI-reported) | 69.4 | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| Gemini 3.1 Pro (thinking high, Kimi-reported, Terminus-2) | 68.5 | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Kimi K2.6 (Terminus-2) | 66.7 | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Claude Opus 4.6 (max effort, Kimi-reported, Terminus-2) | 65.4 | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| GPT-5.4 (xhigh, Kimi-reported, Terminus-2) | 65.4 | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Hy3-preview (Tencent Hunyuan 3) | 54.4 | [huggingface.co/tencent/Hy3-preview](https://huggingface.co/tencent/Hy3-preview) |
| Claude 4.5 Opus (Kimi-reported) | 59.3 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| GPT-5.2 (Kimi-reported) | 54.0 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Gemini 3 Pro (Kimi-reported) | 54.2 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Qwen3.5-397B-A17B | 52.5 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Kimi K2.5 | 50.8 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Claude Sonnet 4.5 | 50 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| DeepSeek V3.2 (Kimi-reported) | 46.4 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| MiniMax-M2 | 46.3 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| GPT-5 (thinking) | 43.8 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Claude Sonnet 4 | 36.4 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Gemini 2.5 Pro | 25.3 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |

_Cite the official [tbench.ai leaderboard](https://www.tbench.ai/leaderboard) when a score is actionable; the MiniMax-M2 card rows above are comparison context from that card._

## Critique & known issues

- **Environment reproducibility matters.** Tasks depend on specific system images (base OS, tool versions). Drift across environments can cause legitimate-looking failures.
- **89 tasks is a modest N.** Wide confidence intervals; 2-3 point gaps between agents should not be over-interpreted.
- **Mixed-discipline mix.** A model strong at SWE tasks but weak at security could look good overall by winning in one category; break out per-category for finer signal.
- **Harness influence.** A score depends on agent scaffold (how the model is given shell access, how it plans, how it recovers from errors). Naming the harness is mandatory for a citable number.
- **End-state verification can miss process quality.** A trajectory that lucks into the right file may pass; one that arrives safely with good intermediate reasoning may fail.

## Related benchmarks

- [OSWorld](OSWorld.md) — GUI-grounded, complementary
- [SWE-bench Verified](../coding/SWE-bench-Verified.md) — narrower to repository-level patches
- [WebArena](WebArena.md) — browser agent counterpart
- [MLE-Bench](MLE-Bench.md) — ML-engineering counterpart

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 5 rows (Claude Sonnet 4/4.5, MiniMax-M2, GPT-5 thinking, Gemini 2.5 Pro) from MiniMax-M2 model card
- 2026-04-15 (session 1 extension): added 6 frontier rows (Claude 4.5 Opus 59.3, GPT-5.2 54.0, Gemini 3 Pro 54.2, Qwen3.5-397B 52.5, Kimi K2.5 50.8, DeepSeek V3.2 46.4) from Kimi K2.5 and Qwen3.5 cards
- 2026-04-24: added 9 rows — **GPT-5.5 82.7 (new SOTA)**, Claude Mythos Preview 82.0, GPT-5.4 (OpenAI) 75.1, Claude Opus 4.7 69.4, Gemini 3.1 Pro 68.5 (Terminus-2), Kimi K2.6 66.7, GPT-5.4 and Opus 4.6 65.4 each (Terminus-2), Hy3-preview 54.4. Big jump from 59 → 82 reflects both model and harness/Terminus-2 improvements in the past ~2 months.
- 2026-04-28: added 2 DS-reported rows — DeepSeek V4-Pro Max 67.9, GLM-5.1 Thinking 63.5. Source: huggingface.co/deepseek-ai/DeepSeek-V4-Pro.
