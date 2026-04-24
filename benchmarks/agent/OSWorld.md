# OSWorld

> 369 real computer-use tasks spanning Ubuntu, Windows, and macOS, evaluated by executing the agent's screen/keyboard/mouse actions in a live VM and checking the final system state. Humans score 72%+; the best agent at release scored 12.24%.

|  |  |
|---|---|
| **Category** | agent / computer use / GUI grounding |
| **Released** | 2024-04-11 (v1 submission); 2024-05-30 (v2) |
| **Paper** | [arXiv:2404.07972](https://arxiv.org/abs/2404.07972) |
| **Project / Code** | [os-world.github.io](https://os-world.github.io/) · [github.com/xlang-ai/OSWorld](https://github.com/xlang-ai/OSWorld) |
| **Maintainer** | XLang Lab (Xie et al.) |
| **Size** | 369 tasks |
| **License** | _unknown_ |
| **Status** | active; the canonical computer-use benchmark |

## What it measures

Whether a multimodal agent can operate a real desktop computer — not a wrapper, not a simulated GUI — well enough to complete everyday tasks. Each task runs in a sandboxed VM; the agent observes screenshots and emits mouse/keyboard actions; evaluation runs arbitrary verification scripts on the resulting filesystem and application state.

The reported 12.24% best-agent score vs. 72%+ human score at release crystallised the "GUI grounding gap": frontier multimodal models can read screenshots but struggle to translate perception into precise pixel-level action sequences.

## Task format

- **Input:** natural-language task description + initial desktop state + live screenshot.
- **Output:** a sequence of actions (mouse clicks, key presses, shell commands) issued to a controlled VM.
- **Scoring:** per-task custom evaluation scripts run against the post-trajectory VM state. Success is binary per task; overall metric is the % of tasks passed.
- **Splits:** Ubuntu, Windows, macOS; web and desktop applications; includes multi-application workflows.

## Example

> "Open the Files application, create a new folder named 'Backups' in the Documents directory, and move all `.pdf` files currently in Downloads into it."

The agent must drive the GUI via screenshots + mouse/keyboard until the VM's filesystem matches the expected state. Verification is performed by a script that inspects the filesystem.

_Source: sample tasks documented on [os-world.github.io](https://os-world.github.io/)._

## Leaderboard (snapshot)

| Model / Agent | Success | Date | Source |
|---|---:|---|---|
| Claude Mythos Preview (OSWorld) | 79.6% | 2026-04 | [red.anthropic.com/2026/mythos-preview](https://red.anthropic.com/2026/mythos-preview/) |
| GPT-5.5 (OSWorld-Verified) | 78.7% | 2026-04-23 | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| Claude Opus 4.7 (OSWorld-Verified, OpenAI-reported) | 78.0% | 2026-04-23 | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| GPT-5.4 (OSWorld-Verified, OpenAI-reported) | 75.0% | 2026-04-23 | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| GPT-5.4 (xhigh, OSWorld-Verified, Kimi-reported) | 75.0% | 2026-04-20 | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Kimi K2.6 (OSWorld-Verified) | 73.1% | 2026-04-20 | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Claude Opus 4.6 (max effort, OSWorld-Verified, Kimi-reported) | 72.7% | 2026-04-20 | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Claude Sonnet 4.5 | 61.4% | 2025-09 | [anthropic.com/news/claude-sonnet-4-5](https://www.anthropic.com/news/claude-sonnet-4-5) |
| Claude Sonnet 4 | 42.2% | 2025-05 | [anthropic.com/news/claude-sonnet-4-5](https://www.anthropic.com/news/claude-sonnet-4-5) |
| Best agent at paper release | 12.24% | 2024-04 | [arXiv:2404.07972](https://arxiv.org/abs/2404.07972) |
| Human | > 72.36% | 2024-04 | [arXiv:2404.07972](https://arxiv.org/abs/2404.07972) |

_Claude Sonnet 4.5's 61.4% represents a substantial leap over the same lab's Sonnet 4 four months prior (42.2%); the gap is driven largely by improved GUI-grounding and operational knowledge. Computer-use agents from OpenAI (Operator) and Google (Mariner family) also publish OSWorld numbers in their system cards — add rows when sourced._

## Critique & known issues

- **VM setup is fragile.** Reproducing reported numbers depends on matching the exact VM images and application versions.
- **Screenshot-only perception is a specific choice.** Agents with access to accessibility trees or DOM see a different problem. Some published agents blend both; apples-to-apples comparisons require harness parity.
- **369 tasks is still a modest sample.** Pass-rate standard errors are a few percent; small gaps between systems should not be over-interpreted.
- **Long-tail application coverage.** Tasks centre on common apps; coverage of niche or internal enterprise tools is nil.
- **Action-space definition matters.** Some systems quantise to grid cells, others predict exact (x, y). Scores are not cleanly comparable across action-space families.

## Related benchmarks

- [WebArena](WebArena.md) — web-only, DOM-based, different action space
- [τ-bench](tau-bench.md) — text-only tool calls
- AndroidWorld / MobileMiniWoB — mobile-OS analogs
- ScreenSpot / ScreenSpot-Pro — pure GUI grounding (no multi-step task)

## Update log

- 2026-04-15: Initial entry; added Claude Sonnet 4.5 (61.4%) and Sonnet 4 (42.2%) rows from Anthropic's 2025-09 launch blog
- 2026-04-24: added 7 frontier rows — **Claude Mythos Preview 79.6% (new SOTA)**, GPT-5.5 78.7%, Claude Opus 4.7 78.0%, GPT-5.4 75.0%, Kimi K2.6 73.1%, Claude Opus 4.6 72.7%. Frontier models now crossed the 72% human baseline; Mythos Preview clears it by 7 points. Sources: red.anthropic.com/mythos-preview, OpenAI GPT-5.5 launch, Kimi K2.6 card.
