# Claw-Eval

> 300 human-verified tasks across 9 categories in 3 groups: **general service orchestration**, **multimodal perception and generation**, **multi-turn professional dialogue**. Sandbox-based (Docker + FastAPI). Targets the blind spot of "evaluating only final outputs misses dangerous intermediate behaviors".

|  |  |
|---|---|
| **Category** | agent / sandboxed orchestration |
| **Released** | 2026-04 |
| **Paper** | [arXiv:2604.06132](https://arxiv.org/abs/2604.06132) |
| **Project / Code** | [claw-eval.github.io](https://claw-eval.github.io/) · [github.com/claw-eval/claw-eval](https://github.com/claw-eval/claw-eval) |
| **Maintainer** | Ye, Bowen; Li, Rang; Yang, Qibin; Xie, Zhihui; Liu, Yuanxin; Yao, Linli; Lyu, Hanglong; Li, Lei |
| **Size** | 300 tasks across 9 categories in 3 groups |
| **License** | per GitHub |
| **Status** | active; new sibling to ClawBench / ClawsBench (different lab, different design) |

## What it measures

End-to-end **agent trajectory quality** in a sandboxed environment, with a deliberate focus on **intermediate behaviour** rather than only final outputs.

Three task groups (3 categories each):

1. **General service orchestration** — agents coordinate across multiple sandboxed services to complete tasks.
2. **Multimodal perception and generation** — tasks requiring vision-language understanding or generation in agent context.
3. **Multi-turn professional dialogue** — tasks demanding sustained professional conversation with role-appropriate behaviour.

The paper's framing: prior benchmarks that score only the final output miss "dangerous intermediate behaviors" (the agent reaches the right answer but takes risky / unsafe / wasteful steps along the way). Claw-Eval grades trajectories more holistically.

The infrastructure is Docker + FastAPI, making the benchmark **reproducibly self-hosted** unlike live-site benchmarks (ClawBench, Online-Mind2Web).

## Task format

- **Input:** task description + sandboxed environment with simulated services.
- **Output:** a multi-step agent trajectory.
- **Scoring:** trajectory-aware evaluation — final state plus intermediate behaviour quality. Rubric details per paper.
- **Splits:** 9 categories across 3 groups; per-category breakdowns common.

## Example

Representative task style (paraphrased from the paper's framing): *"You are an assistant for a small clinic. Schedule a follow-up visit for Patient A in 3 weeks, send them the standard pre-visit email, update the EHR with the appointment, and notify Dr. B that her schedule changed."* The agent uses sandboxed Calendar / Email / EHR APIs. Claw-Eval grades not only "did the appointment get scheduled" but also "did the agent take any unauthorised actions", "was the patient email tone appropriate", "were any side-effect APIs called unnecessarily".

_Source: [arXiv:2604.06132](https://arxiv.org/abs/2604.06132) and [claw-eval.github.io](https://claw-eval.github.io/)._

## Leaderboard (snapshot)

| Model / Agent | Score | Source |
|---|---:|---|
| Step 3.5 Flash (#2 spot at launch per dev coverage) | _see source_ | [Claw-Eval launch coverage](https://dev.to/sky_05/new-benchmark-for-open-source-agents-what-is-claw-eval-how-step-35-flash-secured-the-2-spot-592d) |
| _full leaderboard pending paper-table extraction_ | _unknown_ | [claw-eval.github.io](https://claw-eval.github.io/) |

_Live leaderboard maintained on the project site; fetch during daily update for current rankings._

## Critique & known issues

- **Naming similarity to Claw family is incidental.** Claw-Eval, ClawBench, ClawsBench are from different teams; the "Claw" naming has no shared maintainer. Easy to confuse.
- **Sandbox vs. live-site tradeoff.** Sandbox enables reproducibility but limits realism. Pair with [ClawBench](ClawBench.md) (live-site) for the full picture.
- **Trajectory-aware scoring is harder to design fairly.** What counts as "dangerous intermediate behavior" is rubric-dependent. Open question for cross-eval consistency.
- **300 tasks across 9 categories** = ~33 per category — modest sample for category-level claims.
- **Fresh benchmark.** Re-evaluate quality of methodology + community uptake in 6 months.

## Related benchmarks

- [ClawBench](ClawBench.md) — live-site sibling (different team)
- [ClawsBench](../safety/ClawsBench.md) — workspace + safety sibling (different team)
- [VitaBench](VitaBench.md) — service-economy agent benchmark with rubric scoring
- [Tool-Decathlon](Tool-Decathlon.md) — broader tool span, deterministic verification

## Update log

- 2026-04-15: Initial entry; sparse leaderboard pending paper-table extraction
