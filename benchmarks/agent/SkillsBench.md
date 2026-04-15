# SkillsBench

> 86 tasks across 11 domains, each with **curated Skills + deterministic verifier + oracle solution**. Tests whether agent *Skills* (Claude-style reusable procedural knowledge) actually improve task completion. Result: curated Skills help +16.2pp on average; self-generated Skills don't help. Live leaderboard: [PinchBench](https://pinchbench.com/).

|  |  |
|---|---|
| **Category** | agent / skills / procedural-knowledge |
| **Released** | 2026-02-13 (v1); 2026-03-13 (final) |
| **Paper** | [arXiv:2602.12670](https://arxiv.org/abs/2602.12670) |
| **Project / Leaderboard** | [PinchBench](https://pinchbench.com/) (live SkillsBench-based leaderboard) · [github.com/pinchbench/skill](https://github.com/pinchbench/skill) |
| **Maintainer** | Xiangyi Li et al. (41-author team); task contributions from 105 external contributors (322 candidate tasks) |
| **Size** | 86 tasks across 11 domains |
| **License** | per PinchBench repo |
| **Status** | active; directly relevant to evaluating Claude Code / Claude Agent SDK "Skills" |

## What it measures

Whether **agent Skills** (reusable, task-focused procedural knowledge modules — like Claude Code's `skills/` system) actually improve agent task completion. SkillsBench runs the same task under three conditions:

1. **No Skills** — baseline, agent works from scratch
2. **Curated Skills** — human-authored skill modules for the task
3. **Self-generated Skills** — agent creates its own skill before running the task

Headline findings from the paper:

- **Curated Skills help a lot.** Average pass-rate improvement **+16.2 percentage points**.
- **Domain variation is huge.** Healthcare sees **+51.9pp**; Software Engineering only **+4.5pp**. Skills mostly help where the agent lacks built-in knowledge.
- **Self-generated Skills provide no average benefit.** The act of reflecting and writing a skill doesn't by itself improve performance without curation.
- **Focused Skills beat comprehensive documentation.** 2–3 module skills outperform giant doc dumps.
- **Smaller models + Skills ≈ larger models without.** Skills are a compute-equivalent lever — meaningful for cost-efficient deployment.

This is **Claude-ecosystem-native** evaluation: Anthropic's Claude Code and Claude Agent SDK both ship a Skills system, and SkillsBench is the rigorous empirical check on whether it's working.

## Task format

- **Input:** natural-language task + sandbox environment + (conditionally) Skills documentation.
- **Output:** trajectory in a containerised environment (Harbor framework); deterministic verifier checks final state.
- **Scoring:** pass rate under each of the three conditions (no Skills / curated / self-generated).
- **Splits:** 86 tasks, 11 domains; community-contributed (105 contributors proposed 322 candidate tasks; 86 accepted).

## Example

Representative task (Healthcare domain, reconstructed): *"Parse this insurance claim PDF, extract the diagnosis codes, cross-check against the plan's covered-services list, and draft an approval-or-denial letter following the company's template."* Without Skills, the agent must reverse-engineer the workflow; with a curated "insurance-claim-processing" skill, it has the template, the code-mapping table, and a step-by-step playbook — and scores dramatically higher.

_Source: [arXiv:2602.12670](https://arxiv.org/abs/2602.12670) and [github.com/pinchbench/skill](https://github.com/pinchbench/skill)._

## Leaderboard (snapshot)

Live leaderboard at [PinchBench](https://pinchbench.com/), evaluating 69 models across 861 test runs. Top rows:

| Model | Best score | Average score | Source |
|---|---:|---:|---|
| Claude Opus 4.6 | 93.3% | 81.6% | [pinchbench.com](https://pinchbench.com/) |
| Trinity Large Thinking (Arcee AI) | 91.9% | 91.9% | [pinchbench.com](https://pinchbench.com/) |
| GPT-5.4 | 90.5% | 79.4% | [pinchbench.com](https://pinchbench.com/) |
| Qwen 3.5-27B | 90.0% | 78.5% | [pinchbench.com](https://pinchbench.com/) |
| MiniMax M2.7 | 89.8% | 82.8% | [pinchbench.com](https://pinchbench.com/) |

_Scores are success rates on SkillsBench's 86 tasks with scaffolding; "best" vs. "average" reflects multi-run sampling. The 69-model / 861-run coverage makes this one of the broadest single-source comparisons currently tracked._

## Critique & known issues

- **Skills are the confound.** Curated vs. self-generated vs. no-Skills is a within-task design choice; leaderboard "scores" blend these and need careful reading.
- **PinchBench is a vendor leaderboard** (kilo.ai / boleary.dev team). Treat like MCP-Bench's HF Space — useful, but not an independent academic tribunal.
- **86 tasks is modest.** Per-domain breakdowns are noisy; cross-domain headline averages hide variance.
- **LLM-judge + deterministic checks combined.** Hybrid evaluation introduces judge-dependence in some categories.
- **Skill quality is the real benchmark.** Comparing models without also comparing their Skills is apples-to-oranges; always cite the Skills condition.
- **Fresh benchmark with active leaderboard.** Re-fetch periodically; rankings shift weekly.

## Related benchmarks

- [ClawBench](ClawBench.md) — sibling capability benchmark (live websites)
- [ClawsBench](../safety/ClawsBench.md) — sibling capability + safety benchmark (productivity workspace)
- [MCPMark](MCPMark.md) — stress-test for MCP tools, related agent ecosystem
- [Tool-Decathlon](Tool-Decathlon.md) — broader multi-app agent evaluation

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with top 5 rows from PinchBench ([pinchbench.com](https://pinchbench.com/)). Paper's headline experimental deltas (+16.2pp average Skills lift) captured in prose. **Note: this benchmark is directly relevant to Claude Code / Claude Agent SDK's Skills system — Lei's own tooling ecosystem.**
