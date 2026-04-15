# SWE-bench Verified

> A human-verified 500-task subset of SWE-bench that asks agents to resolve real GitHub issues in open-source Python projects, scored by whether the official test suite passes afterwards.

|  |  |
|---|---|
| **Category** | coding (repo-level, agent-style) |
| **Released** | 2024-08 (Verified subset announced by OpenAI) |
| **Paper** | Original SWE-bench: [arXiv:2310.06770](https://arxiv.org/abs/2310.06770); Verified announcement: [openai.com/index/introducing-swe-bench-verified](https://openai.com/index/introducing-swe-bench-verified/) |
| **Project / Code** | [swebench.com](https://www.swebench.com/) · [github.com/princeton-nlp/SWE-bench](https://github.com/princeton-nlp/SWE-bench) |
| **Maintainer** | Princeton NLP (core) + OpenAI (Verified filter) |
| **Size** | 500 tasks (Verified); 2,294 in full SWE-bench; 300 in Lite |
| **License** | MIT |
| **Status** | **primary frontier agent benchmark for coding**; actively used in every major model launch |

## What it measures

Whether a coding agent can take a real, closed GitHub issue, navigate a real repository, write a patch, and produce a diff such that the repository's own hidden test suite passes after the patch is applied.

The Verified subset was built by OpenAI in collaboration with 93 professional software developers to eliminate tasks with broken, ambiguous, or flaky tests from the original SWE-bench. The result is 500 tasks where a correct patch provably exists and the automated grader is reliable. Verified is now the de-facto leaderboard that frontier models report on; the original SWE-bench score is rarely quoted in isolation.

## Task format

- **Input:** a GitHub issue text + the full repository state at a specific commit.
- **Output:** a unified diff (`.patch`) that can be applied to the repo.
- **Scoring:** `% Resolved` — the patch is applied, the repo's hidden test set is run, and the task counts as resolved only if all target tests pass (and previously-passing tests still pass).
- **Agent harness matters.** A score is meaningless without also naming the harness (e.g. "Claude-native agent", "Agentless", "OpenHands", "SWE-agent", "mini-SWE-agent"). Different scaffolds give different numbers.
- **Splits:** 500 Verified tasks, no train/test split (the train/dev/test split is internal to the original 2,294-task SWE-bench).

## Example

Issue title (illustrative, taken from the public SWE-bench repo):

> **django/django#XXXX:** `QuerySet.only()` after `select_related()` crashes with `TypeError` on one-to-one fields.

The model is given the full Django repo at the relevant commit, must locate the bug, produce a patch, and be judged by whether Django's own tests pass after the patch.

_Source: [github.com/princeton-nlp/SWE-bench](https://github.com/princeton-nlp/SWE-bench) — individual task IDs live in `SWE-bench-Verified/dev/test` splits on Hugging Face._

## Leaderboard (snapshot)

Most-recent-first. Every row has a source link. Harness matters — we label the scaffold when the source does. Scores reported by different labs use different scaffolds and different trial counts; do NOT compare across rows without reading the source.

| Model | Harness / note | % Resolved | Source |
|---|---|---:|---|
| Claude Sonnet 4.5 (high-compute cfg) | Anthropic internal, 2025-09 | 82.0% | [anthropic.com/news/claude-sonnet-4-5](https://www.anthropic.com/news/claude-sonnet-4-5) |
| Claude 4.5 Opus | as reported in Kimi K2.5 card | 80.9% | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| GPT-5.2 | as reported in Kimi K2.5 card | 80.0% | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Kimi K2.5 | self-reported, 2026-01-29 | 76.8% | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Qwen3.5-397B-A17B | self-reported, 2026-02 | 76.4% | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Gemini 3 Pro | as reported in Kimi K2.5 card | 76.2% | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| DeepSeek V3.2 | as reported in Kimi K2.5 card | 73.1% | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Claude Sonnet 4.5 | Anthropic internal, avg of 10 trials, 2025-09 | 77.2% | [anthropic.com/news/claude-sonnet-4-5](https://www.anthropic.com/news/claude-sonnet-4-5) |
| GPT-5 (thinking) | as reported in MiniMax-M2 card, 2025-10 | 74.9% | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Claude Sonnet 4 | as reported in Kimi K2 card, agentic single attempt | 72.7% | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude Opus 4 | as reported in Kimi K2 card, agentic single attempt | 72.5% | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Kimi K2 | agentic, multiple attempts | 71.6% | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| MiniMax-M2 | as reported in own model card, 2025-10 | 69.4% | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Kimi K2 | agentic, single attempt | 65.8% | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| mini-SWE-agent v2 | open-source agent | 65% | [swebench.com](https://www.swebench.com/) |
| Gemini 2.5 Pro | as reported in MiniMax-M2 card | 63.8% | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| GLM-4.5 | self-reported, 2025-08 | 64.2% | [arXiv:2508.06471](https://arxiv.org/abs/2508.06471) |
| GPT-4.1 | as reported in Kimi K2 card, agentic single attempt | 54.6% | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Kimi K2 | agentless, single patch w/o test | 51.8% | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Claude 3.5 Sonnet | as reported in DeepSeek-V3 card, 2024-12 | 50.8% | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| DeepSeek-V3 | as reported in own card, 2024-12 | 42.0% | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| GPT-4o (0513) | as reported in DeepSeek-V3 card, 2024-12 | 38.8% | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| LLaMA-3.1-405B | as reported in DeepSeek-V3 card | 24.5% | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| Qwen2.5-72B | as reported in DeepSeek-V3 card | 23.8% | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |

_"As reported in X card" means the score was collected by lab X under their own harness; the absolute number may differ from Anthropic/OpenAI's self-reports. Cross-lab scores are not directly comparable._

## Critique & known issues

- **Harness-dependent scores.** The same model can swing 10+ points across harnesses. Any number quoted without a named harness is suspect.
- **Contamination risk.** All tasks are from public GitHub history. A model trained on post-2023 code may have seen the fix.
- **Python-only, library-heavy.** Twelve projects, heavy on Django / sympy / astropy; not representative of general software engineering.
- **Oracle file hint.** Some harnesses reveal which file(s) contain the bug. "Full-context" vs "oracle-file" numbers are not directly comparable.
- **Tests measure one-shot resolution.** Does not measure code review, explanation quality, or multi-step collaboration.

## Related benchmarks

- [HumanEval](HumanEval.md) — single-function, saturated, not repo-level
- [LiveCodeBench](LiveCodeBench.md) — time-windowed to resist contamination
- SWE-Lancer — [agent/SWE-Lancer.md](../agent/SWE-Lancer.md) — real freelance-engineering tasks with monetary payouts
- SWE-bench Multilingual / Multimodal — sibling subsets by the same maintainers

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 16 model rows from 4 sources (Anthropic Sonnet 4.5 blog, Kimi K2 model card, DeepSeek-V3 model card, MiniMax-M2 model card)
- 2026-04-15 (session 1 extension): added 6 frontier rows — Claude 4.5 Opus (80.9%), GPT-5.2 (80.0%), Kimi K2.5 (76.8%), Qwen3.5-397B (76.4%), Gemini 3 Pro (76.2%), DeepSeek V3.2 (73.1%). Sources: Kimi K2.5 and Qwen3.5 model cards.
