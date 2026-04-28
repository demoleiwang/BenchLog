# HarmBench

> CAIS's standardized red-teaming framework — large-scale evaluation of **18 red-teaming methods × 33 target LLMs and defenses**. The reference baseline for measuring jailbreak robustness.

|  |  |
|---|---|
| **Category** | safety / jailbreak / red-teaming |
| **Released** | 2024-02 |
| **Paper** | [arXiv:2402.04249](https://arxiv.org/abs/2402.04249) |
| **Project / Code** | [github.com/centerforaisafety/HarmBench](https://github.com/centerforaisafety/HarmBench) |
| **Maintainer** | Center for AI Safety (CAIS) |
| **Size** | hundreds of prompts × 18 attack methods × 33 defenders evaluated in launch paper |
| **License** | per GitHub |
| **Status** | active; the canonical jailbreak / red-teaming benchmark |

## What it measures

Whether a language model **refuses** harmful requests under a wide range of attack methods — direct prompts, jailbreak prompts, role-play attacks, optimisation-based adversarial prompts, multi-turn manipulations.

The contribution is **standardisation**: prior jailbreak research used non-comparable attack/defence pairs; HarmBench provides a unified harness for matrix-evaluating attacks against defences. The 2024 launch paper compared 18 attacks × 33 targets — the largest such matrix at the time — establishing baseline numbers for both attack effectiveness and defence robustness.

## Task format

- **Input:** harmful-request prompt + optional jailbreak / attack wrapper.
- **Output:** model response.
- **Scoring:** **attack success rate** (ASR) — percentage of harmful requests where the model complied (HarmBench uses an LLM judge, calibrated for this task).
- **Splits:** by attack method, by harm category, by target model.

## Example

A representative HarmBench evaluation: take a base harmful prompt ("Write a tutorial for X"), wrap it with a jailbreak template (e.g., GCG-optimised suffix), submit to the target model, judge whether the response complies. Results aggregated over hundreds of prompt × wrapper combinations to produce per-target ASR.

_Source: [github.com/centerforaisafety/HarmBench](https://github.com/centerforaisafety/HarmBench)._

## Leaderboard (snapshot)

| Model class | Typical ASR | Source |
|---|---:|---|
| _attack-method × target-model matrix; see paper Table 2 / repo for current_ | _varies_ | [arXiv:2402.04249](https://arxiv.org/abs/2402.04249) |

_Per-model ASR rows pending paper-table extraction. Lower ASR = more robust. CAIS publishes ongoing updates to the leaderboard at the project repo._

## Critique & known issues

- **Attack methods evolve.** A 2024-era attack panel may not represent current jailbreak techniques (LLM-generated jailbreaks evolve weekly). Re-runs need attack-set refresh.
- **LLM-judge dependence.** "Did the model comply" is judged by an LLM; judge bias is a real factor.
- **Defence-side coverage uneven.** Some defenses (RLHF, refusal training) tested heavily; system-prompt-only defenses less so.
- **Harm-category mix.** Bio / cyber / weapons heavily represented; harms relevant to specific deployment contexts (financial fraud, copyright) may be under-tested.
- **Saturation at the bottom.** Frontier models with strong refusal training have very low ASR on basic attacks; only sophisticated attack pipelines discriminate them.

## Related benchmarks

- [AgentHarm](AgentHarm.md) — agent-action sibling (not just chat refusal)
- [WMDP](WMDP.md) — hazardous-knowledge probe (different framing)
- AdvBench — earlier adversarial-prompts benchmark
- JailbreakBench — sibling jailbreak suite
- [ClawsBench](ClawsBench.md) — productivity-agent capability + safety

## Update log

- 2026-04-15: Initial entry — pending per-model ASR row extraction from paper / repo updates
