# WMDP — Weapons of Mass Destruction Proxy

> 3,668 multiple-choice questions probing **hazardous knowledge** in biosecurity, cybersecurity, and chemical security. Designed as both a hazard evaluation AND an unlearning-method benchmark. Built in response to the White House Executive Order on AI.

|  |  |
|---|---|
| **Category** | safety / hazardous-knowledge / unlearning |
| **Released** | 2024-03 |
| **Paper** | [arXiv:2403.03218](https://arxiv.org/abs/2403.03218) |
| **Project** | [wmdp.ai](https://wmdp.ai) · also in [EleutherAI lm-evaluation-harness](https://github.com/EleutherAI/lm-evaluation-harness/blob/main/lm_eval/tasks/wmdp/README.md) |
| **Maintainer** | Center for AI Safety (CAIS) consortium + technical consultants |
| **Size** | 3,668 multiple-choice questions across bio / cyber / chem |
| **License** | open-source after sensitive-content filtering |
| **Status** | active; the public hazardous-knowledge baseline that closed government / lab evals can be compared against |

## What it measures

**Two roles** (this is the design contribution):

1. **Hazard evaluation** — does this LLM know dangerous things in bio / cyber / chem domains?
2. **Unlearning benchmark** — can a method remove that hazardous knowledge while preserving general capability?

The benchmark exists because **prior hazardous-capability evaluations are private** (governments + labs developed them after the White House AI EO). WMDP gives the open research community something comparable, while being filtered to remove genuinely sensitive operational details.

The same paper introduces **RMU** (Representation Misdirection for Unlearning), demonstrating that representation-level interventions can reduce WMDP performance while preserving general capabilities (biology, computer science).

## Task format

- **Input:** a multiple-choice question on hazardous topics in bio / cyber / chem.
- **Output:** the chosen letter.
- **Scoring:** accuracy. Lower can be safer (post-unlearning) OR worse (less-capable). Always report both WMDP score and a general-capability score (MMLU-bio, MMLU-CS) as a pair.
- **Splits:** Bio (1,273 Qs), Cyber (1,987 Qs), Chem (408 Qs) approximate.

## Example

The paper does not reproduce question stems verbatim (sensitivity). Stems are designed to elicit knowledge that *could* assist hazardous research without being step-by-step instructions.

_Source: [wmdp.ai](https://wmdp.ai)._

## Leaderboard (snapshot)

Lower on WMDP = less hazardous knowledge; pair with general MMLU score to confirm the model wasn't crippled.

| Model | WMDP score | General-cap (MMLU paired) | Source |
|---|---:|---:|---|
| _per-model rows pending paper-table + lm-eval-harness extraction_ | _varies_ | _varies_ | [arXiv:2403.03218](https://arxiv.org/abs/2403.03218) |

_Often reported in frontier safety reports (e.g., GPT-5.4 system card uses related cyber / bio / chem evals)._

## Critique & known issues

- **Proxy framing is critical.** WMDP measures *related* knowledge, not actual weapon-creation capability. A high WMDP score doesn't mean the model can build weapons; a low score doesn't prove it can't.
- **MCQ ceiling.** Multiple-choice limits discriminative power and may underestimate the hazardous knowledge a model can produce in free-form generation.
- **Sensitivity-vs-utility tradeoff.** The benchmark is filtered to be releaseable, which may have removed the questions most predictive of true hazardous capability.
- **Unlearning-as-defense is contested.** RMU and related methods reduce WMDP scores, but adversaries can often re-elicit knowledge with different prompting.
- **Bio dominates the question count.** Cyber and chem under-represented; cross-category claims should be careful.

## Related benchmarks

- [HarmBench](HarmBench.md) — refusal under attack, complementary
- [AgentHarm](AgentHarm.md) — agent-action sibling
- [HealthBench](../knowledge/HealthBench.md) — medical *capability* (not hazard) sibling
- GPT-5.4 system card's cyber / biosec evals — non-public siblings

## Update log

- 2026-04-15: Initial entry — per-model leaderboard pending extraction; closely related to GPT-5.4 system card cyber/biosec metrics
