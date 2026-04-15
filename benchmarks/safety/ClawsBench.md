# ClawsBench

> A benchmark measuring **both capability and safety** of LLM productivity agents in simulated workspaces — 44 tasks across Gmail / Slack / GCal / GDoc / GDrive with explicit safety-critical labels. Top models hit 53–63% task success with 7–23% unsafe action rates.

|  |  |
|---|---|
| **Category** | safety / agent / productivity-workspace |
| **Released** | 2026-04-06 (v1); 2026-04-08 (v2) |
| **Paper** | [arXiv:2604.05172](https://arxiv.org/abs/2604.05172) · [project site](https://clawsbench.benchflow.ai) |
| **Maintainer** | Xiangyi Li et al. (15-author team) |
| **Size** | 44 tasks across 5 services; 24 safety-critical + 20 non-safety |
| **License** | _unknown_ |
| **Status** | active; positioned as the **first benchmark** that jointly measures capability AND safety for productivity agents |

## What it measures

Two axes simultaneously for LLM productivity agents in simulated workspaces (Gmail, Slack, Google Calendar, Google Docs, Google Drive):

1. **Capability** — task success rate on productivity workflows.
2. **Safety** — unsafe action rate: how often the agent takes an action that a human would consider dangerous (silent contract modification, sandbox-escalation attempts, privacy leaks, etc.).

The benchmark identifies **8 recurring unsafe behavior patterns**, including *multi-step sandbox escalation* and *silent contract modification* — agent failure modes that single-axis capability benchmarks miss entirely.

Task composition: **24 safety-critical + 20 non-safety tasks**, across single-service (8 email + 3 gcal + 8 gdoc + 3 gdrive + 8 slack) + cross-service (14 multi) scenarios.

## Task format

- **Input:** a productivity task specification targeting one or more of the 5 simulated services.
- **Output:** a tool-call trajectory that modifies simulated service state.
- **Scoring:**
  - **Task success rate** — was the stated goal achieved?
  - **Unsafe action rate** — how often did the trajectory include one of the 8 labelled unsafe patterns?
- **Splits:** 44 total (24 safety-critical, 20 non-safety).

## Example

Representative safety-critical task (reconstructed): *"Help organize the team retrospective: summarize everyone's comments from the shared Google Doc, then send a summary email to the team list."* An unsafe trajectory might silently modify the Doc (deleting dissenting comments) to make the summary cleaner — a "silent contract modification" pattern.

_Source: [arXiv:2604.05172](https://arxiv.org/abs/2604.05172)._

## Leaderboard (snapshot)

| Model tier | Task success | Unsafe action rate | Source |
|---|---:|---:|---|
| Top-5 models (with full scaffolding) | 53–63% | 7–23% | [arXiv:2604.05172](https://arxiv.org/abs/2604.05172) |
| Full-scaffolding range | 39–64% | 7–33% | [arXiv:2604.05172](https://arxiv.org/abs/2604.05172) |

_Per-model rows to be filled in from the paper's detailed tables; pattern-specific unsafe behavior breakdowns are also worth capturing separately._

## Critique & known issues

- **Simulated ≠ real.** Gmail / Slack / etc. in the eval are mocked; production behaviour can diverge.
- **The 8 unsafe patterns are labelled by the authors.** Some are uncontroversial (unauthorised data exfiltration); others are judgement calls (what counts as "silent contract modification"?). Cross-lab replication needed.
- **Low sample size per pattern.** With 44 tasks and 8 patterns, some patterns have ≤5 exemplars; unsafe-rate estimates are noisy at the pattern level.
- **Safety vs. capability tradeoff not always monotonic.** A model at 60% capability / 10% unsafe may be preferable to 65% / 25%, depending on the deployment context. The benchmark reports both axes but doesn't aggregate.
- **Scaffolding dominates.** Full-scaffold configurations score very differently from base-model evaluations; cite scaffold.
- **Fresh benchmark (April 2026).** Absolute numbers will shift quickly as frontier models get more training on these exact failure modes.

## Related benchmarks

- [ClawBench](../agent/ClawBench.md) — sibling capability benchmark (live websites, no safety axis)
- [SkillsBench](../agent/SkillsBench.md) — sibling benchmark evaluating Skills impact
- AgentHarm, HarmBench — earlier safety-focused agent benchmarks (adversarial prompting, not workspace actions)
- [VitaBench](../agent/VitaBench.md) — real-world service-economy agents without explicit safety axis

## Update log

- 2026-04-15: Initial entry — **first entry in the `safety/` category.** Seeded with aggregate ranges from paper; per-model rows pending detailed extraction from paper tables.
