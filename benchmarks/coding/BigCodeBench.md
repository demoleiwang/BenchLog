# BigCodeBench

> 1,140 software-engineering programming tasks requiring **723 function calls from 139 popular libraries across 7 domains**. Positioned as the "next generation of HumanEval" — broader real-world coverage, harder than synthetic competitive-programming tasks. ICLR 2025.

|  |  |
|---|---|
| **Category** | coding (function-call-heavy, real libraries) |
| **Released** | 2024-06; ICLR 2025 |
| **Paper** | [arXiv:2406.15877](https://arxiv.org/abs/2406.15877) |
| **Project / Code** | [github.com/bigcode-project/bigcodebench](https://github.com/bigcode-project/bigcodebench/) · dataset [huggingface.co/datasets/bigcode/bigcodebench](https://huggingface.co/datasets/bigcode/bigcodebench) · leaderboard [HF Space](https://huggingface.co/spaces/bigcode/bigcodebench-leaderboard) |
| **Maintainer** | BigCode Project (open scientific collaboration) |
| **Size** | 1,140 tasks; 723 function calls; 139 libraries; 7 domains |
| **License** | per BigCode |
| **Status** | active; the canonical "between HumanEval and SWE-bench" coding benchmark |

## What it measures

Whether an LLM can **synthesise programs that use real libraries** — not just write self-contained algorithms. Tasks demand calling specific functions from specific libraries (numpy, pandas, requests, sklearn, etc.) under detailed instructions.

The benchmark fills a gap:
- **HumanEval / MBPP** — small self-contained algorithms, saturated
- **SWE-bench** — full repo-level work, agent-style
- **BigCodeBench** — function-call-heavy programming with real libraries, single-file

7 domains: data analysis, web development, networking, etc. — chosen to reflect actual professional Python use.

## Task format

- **Input:** task description + a function signature + library import context.
- **Output:** function body using specified libraries / calls.
- **Scoring:** **pass@1** — the function passes hidden unit tests that verify both correctness and proper library use.
- **Splits:** Complete (1,140 task variants) + Instruct (instruction-following variant).

## Example

A representative BigCodeBench task (paraphrased): *"Write a function that takes a CSV path and a column name; using pandas, compute the column's mean, median, mode, and 95% confidence interval (using scipy.stats); return as a dict."* The model must use pandas + scipy correctly, handle edge cases, return the right format.

_Source: [github.com/bigcode-project/bigcodebench](https://github.com/bigcode-project/bigcodebench/)._

## Leaderboard (snapshot)

The live leaderboard is at the [BigCodeBench HF Space](https://huggingface.co/spaces/bigcode/bigcodebench-leaderboard) — fetch during daily update.

| Model | Score | Source |
|---|---:|---|
| _live leaderboard — fetch top rows next daily run_ | _unknown_ | [huggingface.co/spaces/bigcode/bigcodebench-leaderboard](https://huggingface.co/spaces/bigcode/bigcodebench-leaderboard) |

_Frontier coding-focused models report BigCodeBench numbers in their cards; add source-linked rows when ingested._

## Critique & known issues

- **Library version sensitivity.** Tasks specify library APIs; library updates between benchmark release and evaluation can change correct answers.
- **Python-only.** Multilingual extension would be valuable; for now, see [Multi-SWE-Bench](Multi-SWE-Bench.md) for cross-language coding.
- **Hidden tests can be brittle.** Functionally equivalent solutions sometimes fail tests due to format expectations.
- **Saturation in progress.** Frontier models cluster increasingly high; the benchmark's discriminative power at the top is fading. Newer harder splits (BigCodeBench-Hard) extend its life.
- **Instruction-following variant** (BigCodeBench-Instruct) tests a different skill from the Complete variant; quote which.

## Related benchmarks

- [HumanEval](HumanEval.md) — older simpler predecessor
- [LiveCodeBench](LiveCodeBench.md) — competition-style, contamination-resistant
- [SWE-bench Verified](SWE-bench-Verified.md) — repo-level
- [Aider Polyglot](Aider-Polyglot.md) — real-world-style multi-language coding
- SciCode — research-coding sibling

## Update log

- 2026-04-15: Initial entry — leaderboard left as live-pointer to BigCodeBench HF Space
