# LiveCodeBench

> A contamination-resistant coding benchmark that continuously ingests problems from LeetCode, AtCoder, and Codeforces and windows them by release date, so you can evaluate a model only on problems that appeared after its training cutoff.

|  |  |
|---|---|
| **Category** | coding |
| **Released** | 2024-03 (v1 paper) |
| **Paper** | [arXiv:2403.07974](https://arxiv.org/abs/2403.07974) |
| **Project / Code** | [livecodebench.github.io](https://livecodebench.github.io/) · [github.com/LiveCodeBench/LiveCodeBench](https://github.com/LiveCodeBench/LiveCodeBench) |
| **Maintainer** | Jain et al. (UC Berkeley + collaborators) |
| **Size** | continuously growing (hundreds of problems, filterable by release date) |
| **License** | _unknown_ |
| **Status** | active; widely cited for frontier-coding claims |

## What it measures

Functional correctness on competitive-programming-style problems, with the explicit design goal of defeating data contamination by dating every problem and letting evaluators cut the benchmark to a time window *after* the model's training cutoff.

The core claim is that HumanEval-class benchmarks are contaminated (problems leaked into training data) and that frontier scores on those benchmarks therefore overstate true capability. LiveCodeBench answers this by continuously sourcing new problems from public contest platforms and exposing a date-range filter.

## Task format

- **Input:** competitive-programming-style problem statement.
- **Output:** full program that reads from stdin and writes to stdout.
- **Scoring:** pass@1 on hidden tests; reported separately per time window (e.g. "problems from 2024-08 through 2024-12").
- **Splits:** time-windowed. Quote the window explicitly when reporting a score.

## Example

Problems follow the LeetCode / Codeforces / AtCoder format (given input constraints, produce an algorithm). A representative task would be a medium-difficulty LeetCode problem such as "Given a list of intervals, merge all overlapping intervals and return the result sorted by start."

_Source: representative category per [livecodebench.github.io](https://livecodebench.github.io/)._

## Leaderboard (snapshot)

Scores are meaningless without a date-window. Always cite the window.

| Model | Score (pass@1) | Window | Source |
|---|---:|---|---|
| _seed pending_ | _unknown_ | _unknown_ | [livecodebench.github.io](https://livecodebench.github.io/) |

## Critique & known issues

- **Contest-style, not engineering-style.** Measures algorithmic problem-solving, not production code. Complements — does not substitute for — SWE-bench.
- **Window dependence is easy to abuse.** Reporters can cherry-pick windows where their model looks best; treat "LiveCodeBench: X%" without a named window as marketing.
- **Contest difficulty mix drifts.** The problem difficulty distribution on LeetCode / Codeforces changes month to month; year-over-year trend comparisons are fuzzy.
- **Agent features unused.** Pure code-in / code-out; no tool use, no file navigation. Frontier coding agents outperform base models by wider margins on SWE-bench than on LiveCodeBench.

## Related benchmarks

- [HumanEval](HumanEval.md) — older, smaller, saturated
- [SWE-bench Verified](SWE-bench-Verified.md) — repo-level, agent-style alternative
- APPS — earlier competitive-programming benchmark, static

## Update log

- 2026-04-15: Initial entry
