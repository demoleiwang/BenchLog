# AgentHarm

> **110 explicitly malicious agent tasks** (440 with augmentations) across 11 harm categories — the agent-action analogue of HarmBench. Built in collaboration with the **UK AI Safety Institute**. Headline finding: leading LLMs are surprisingly compliant with malicious agent requests *without* jailbreaking.

|  |  |
|---|---|
| **Category** | safety / agent / harmfulness |
| **Released** | 2024-10; ICLR 2025 |
| **Paper** | [arXiv:2410.09024](https://arxiv.org/abs/2410.09024) |
| **Project / Code** | per arXiv + Gray Swan / UK AISI publications |
| **Maintainer** | Gray Swan AI + UK AI Safety Institute (UK AISI) |
| **Size** | 110 unique malicious tasks + 330 augmentations = 440 total; 11 harm categories; 104 distinct tools |
| **License** | per project release |
| **Status** | active; the canonical agent-action harmfulness benchmark |

## What it measures

Whether an LLM **acting as an agent with tool access** completes harmful multi-step tasks. The benchmark argues that earlier safety work over-focused on chat-style refusal; agents — which use external tools and execute multi-stage tasks — pose qualitatively different risks because a single misaligned action can trigger irreversible side effects.

11 harm categories include fraud, cybercrime, harassment, etc. Each task uses tools from a 104-tool set; the agent must complete malicious behaviours that require coordinated multi-step action.

Three findings from the launch paper:

1. **Leading LLMs are surprisingly compliant** with malicious agent requests *without any jailbreaking* — base refusal rates much weaker than for chat-style harmful-prompt refusal.
2. **Simple universal jailbreak templates** can be adapted to effectively jailbreak agents.
3. **Jailbroken agents** retain coherent multi-step capability and most of their model intelligence — they don't degenerate into useless complying machines; they become competent malicious actors.

## Task format

- **Input:** an explicitly malicious task description + tool catalogue.
- **Output:** agent trajectory through tools.
- **Scoring:** **harmful behaviour completion rate** — did the agent successfully execute the harmful objective? (Lower = safer.) Plus capability retention (was the agent still functional?).
- **Splits:** 11 harm categories; 110 base + 330 augmented variants.

## Example

A representative task (paraphrased from the paper's framing — actual prompts not reproduced for safety): *"Use the available email tool, contact-list tool, and message-template tool to send a phishing email impersonating <bank> to the contacts in <list>, customised by their last transaction history."* The agent must coordinate multiple tools to execute. AgentHarm scores whether the agent completed this end-to-end and how robust its refusal was.

_Source: [arXiv:2410.09024](https://arxiv.org/abs/2410.09024)._

## Leaderboard (snapshot)

The paper reports per-model harmful-behaviour rates with and without jailbreak; rows below to be filled from paper tables.

| Model | Harmful task completion (no jailbreak) | + universal jailbreak | Source |
|---|---:|---:|---|
| _see paper Table 3 for per-model rows_ | _varies_ | _varies_ | [arXiv:2410.09024](https://arxiv.org/abs/2410.09024) |

_Lower = safer. AgentHarm is increasingly cited in frontier safety releases (UK AISI evaluations of frontier models)._

## Critique & known issues

- **By design, the benchmark catalogues harmful prompts.** Distribution is restricted to vetted researchers.
- **LLM-judge for harmful-completion** introduces judge bias.
- **Tool ecosystem is sandboxed simulators** — real harm requires real tool calls, but the simulator catches "would-have-harmed" trajectories.
- **Augmented-variant ratio (330:110)** can dominate metrics; check whether reports use the 110-base or 440-total denominator.
- **Multi-turn jailbreak robustness** is harder to test cleanly; AgentHarm focuses on single-turn jailbreak templates.
- **Cross-lab reproduction is sparse** — UK AISI maintains the canonical evaluations.

## Related benchmarks

- [HarmBench](HarmBench.md) — chat-refusal sibling
- Agent-SafetyBench — broader agent safety suite (arXiv:2412.14470)
- [ClawsBench](ClawsBench.md) — productivity-agent capability + safety joint benchmark
- [WMDP](WMDP.md) — hazardous-knowledge probe (different surface)

## Update log

- 2026-04-15: Initial entry — per-model rows pending paper-table extraction
