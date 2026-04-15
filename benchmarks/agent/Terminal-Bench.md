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
| Claude Sonnet 4.5 | 50 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
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
