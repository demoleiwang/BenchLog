# SWE-Lancer

> Over 1,400 real freelance software-engineering tasks from Upwork, spanning $50 bug fixes to $32,000 feature builds, graded by end-to-end tests triple-verified by senior engineers. OpenAI's answer to the question "can frontier LLMs earn $1M?".

|  |  |
|---|---|
| **Category** | agent / coding (freelance-style) / economic value |
| **Released** | 2025-02 |
| **Paper** | [arXiv:2502.12115](https://arxiv.org/abs/2502.12115) |
| **Project / Code** | public eval split: **SWE-Lancer Diamond** — [github.com/openai/SWELancer-Benchmark](https://github.com/openai/SWELancer-Benchmark) |
| **Maintainer** | OpenAI (Miserendino, Wang, Patwardhan, Heidecke) |
| **Size** | over 1,400 tasks in full; a smaller "Diamond" split is open-sourced |
| **License** | _unknown_ for the full set; Diamond is public |
| **Status** | active; differentiated from SWE-bench by money-weighted scoring and inclusion of managerial tasks |

## What it measures

Whether a coding agent can complete real, paid freelance work at revenue-relevant levels. Two task classes:

1. **Independent Contributor (IC) tasks** — write the code, pass the end-to-end tests (each task has tests triple-verified by experienced engineers).
2. **Manager tasks** — evaluate technical proposals the way a real engineering manager would, judged against the actual hiring decision.

The headline framing is monetary: each task is tagged with the dollar value paid on Upwork, so performance can be aggregated as "total dollars earned" rather than simple pass rates. The paper's conclusion at release: frontier models still cannot solve the majority of tasks.

## Task format

- **Input (IC):** issue description + repo state.
- **Output (IC):** patch.
- **Scoring (IC):** pass/fail on hidden end-to-end test suites, verified by three engineers.
- **Input (Manager):** a set of candidate technical proposals for a task.
- **Output (Manager):** the selected proposal.
- **Scoring (Manager):** match against the real hiring manager's choice.
- **Splits:** full 1,400+ set (internal); Diamond subset (public).

## Example

An IC task (typical framing): "[Web app] Clicking 'Send' in the contact form while offline silently drops the message. Add offline detection and a retry queue that persists across sessions." Tasks come with price tags ($50 … $32,000) and a hidden end-to-end test harness.

_Source: [arXiv:2502.12115](https://arxiv.org/abs/2502.12115)._

## Leaderboard (snapshot)

| Model / Agent | Metric | Value | Source |
|---|---|---:|---|
| Frontier at release | Majority of tasks | not solved | [arXiv:2502.12115](https://arxiv.org/abs/2502.12115) |

_The paper includes baselines for frontier models across IC and Manager task classes, aggregated as $ earned. Add specific rows from the paper's tables and from subsequent reports._

## Critique & known issues

- **Task source bias.** Upwork tasks skew toward web / mobile frontends; systems programming, ML, data-engineering payouts are under-represented.
- **Test suites aren't the full spec.** Real freelancers pass tests AND satisfy informal acceptance criteria. SWE-Lancer grades the former; real-world acceptance is stricter.
- **Manager-task alignment with real hires is noisy.** Upwork managers are not Google SRE hiring bars; the benchmark's "manager decision" reflects a specific (market-segment) labour distribution.
- **Dollar-weighted scoring can mask capability gaps.** A model that solves lots of $50 tasks but zero $30k tasks looks decent on dollars earned while failing on hard reasoning.
- **Contamination risk.** Tasks are from public Upwork postings; some may have been crawled into training data.

## Related benchmarks

- [SWE-bench Verified](../coding/SWE-bench-Verified.md) — narrower Python-library focus, established leaderboard
- [MLE-Bench](MLE-Bench.md) — ML-engineering counterpart
- [GDPval](GDPval.md) — broader economically-valuable-tasks benchmark (non-software)

## Update log

- 2026-04-15: Initial entry
