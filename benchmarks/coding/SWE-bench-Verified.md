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

Most-recent-first. Every row has a source link. Harness matters — we label the scaffold when the source does.

| Model (harness) | % Resolved | Date | Source |
|---|---:|---|---|
| mini-SWE-agent v2 | 65% | 2025-07 | [swebench.com](https://www.swebench.com/) |
| SWE-agent 1.0 (open-source SOTA on Lite, not Verified) | _see source_ | 2025-03 | [swebench.com](https://www.swebench.com/) |

_For current frontier scores, check the official [SWE-bench leaderboard](https://www.swebench.com/). Frontier-lab launch blogs for Claude Sonnet / Opus, GPT-5, and Gemini all report Verified scores; add rows with direct source links when seeded._

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

- 2026-04-15: Initial entry
