# AndroidWorld

> Google DeepMind's live-Android-emulator benchmark for mobile agents — **116 hand-crafted tasks across 20 real Android apps** with ground-truth rewards via `adb` inspection. Task parameters are randomised, yielding millions of unique instances. Human: 80%; M3A baseline: 30.6%.

|  |  |
|---|---|
| **Category** | agent / GUI / mobile (Android) |
| **Released** | 2024-05 (arXiv submission) |
| **Paper** | [arXiv:2405.14573](https://arxiv.org/abs/2405.14573) |
| **Project / Code** | [google-research.github.io/android_world](https://google-research.github.io/android_world/) · [github.com/google-research/android_world](https://github.com/google-research/android_world) |
| **Maintainer** | Google DeepMind (Christopher Rawles et al.) |
| **Size** | 116 hand-crafted tasks across 20 real Android apps; millions of parameterised instances |
| **License** | per GitHub |
| **Status** | active; the canonical mobile agent benchmark |

## What it measures

Whether an AI agent can operate a **real Android environment** — not a simulation, not screenshot-only — and complete everyday mobile tasks across native apps. The key design choices:

1. **Ground-truth rewards via `adb`** — instead of UI-state heuristics or LLM judges, the evaluator queries Android system state directly. Unambiguous and reproducible.
2. **Dynamic task instantiation** — each of the 116 base tasks is parameterised (e.g., "turn off Wi-Fi for `<target network>`") and randomised at runtime, yielding effectively infinite unique instances. This defeats memorisation.
3. **Real apps** — the 20 apps are production-quality (not mock), meaning UI drift across Android versions affects scores.

The benchmark is a **live emulator environment**, not a static dataset — agents execute actions, and the environment responds authentically.

## Task format

- **Input:** a natural-language task description with parameters instantiated per run + access to a live Android emulator.
- **Output:** sequence of touch / swipe / keyboard actions plus optional UI-element selections.
- **Scoring:** binary success per task, verified by querying Android system state via `adb` at task end.
- **Splits:** 116 base tasks; each run picks random parameter values, creating a new concrete task.

## Example

Representative task (paraphrased): *"Add a calendar event titled 'Dentist appointment' on next Tuesday at 3 PM with a 30-minute reminder."* The agent must open Calendar, create an event with correct title, date, time, and reminder settings. Success verified by adb-querying the calendar database after the agent's trajectory.

_Source: [google-research.github.io/android_world](https://google-research.github.io/android_world/)._

## Leaderboard (snapshot)

| Model / Agent | Success | Note | Source |
|---|---:|---|---|
| Human | 80.0% | paper baseline | [arXiv:2405.14573](https://arxiv.org/abs/2405.14573) |
| M3A (Multimodal Autonomous Agent for Android) | 30.6% | paper baseline | [arXiv:2405.14573](https://arxiv.org/abs/2405.14573) |

_The live leaderboard is maintained by the Google DeepMind team; add source-linked frontier rows when pulling from newer mobile-agent papers. AndroidWorld has become a standard citation for multimodal Android agents and is often paired with OSWorld in system cards for frontier computer-use models._

## Critique & known issues

- **Emulator ≠ real device.** Physical-device quirks (real camera feed, sensor data, battery behaviour) are absent. Deployment-readiness not the same as AndroidWorld score.
- **Android version drift.** Base-image updates can break tasks; the maintainers periodically refresh. Re-runs need version-pinning.
- **`adb` ground truth is exact but narrow.** Tasks where success is multi-dimensional (e.g., "write a good email") don't fit; the benchmark restricts to state-checkable outcomes.
- **20 apps is a modest fraction** of real Android usage; enterprise apps, banking, gaming, niche productivity apps are absent.
- **Action-space framing matters.** Some harnesses predict absolute (x,y) taps; others use UI-element IDs. Cross-harness comparison is fraught.
- **Human 80% isn't 100%.** Even human performance is imperfect on tricky tasks — rare for a benchmark to calibrate against human baseline so explicitly.

## Related benchmarks

- [OSWorld](OSWorld.md) — desktop OS counterpart (Ubuntu/Windows/macOS)
- [WebArena](WebArena.md) — web-only analog
- MobileMiniWoB / MobileAgentBench — related mobile benchmarks
- AITW (Android in the Wild) — static mobile dataset, not emulator-based

## Update log

- 2026-04-15: Initial entry; seeded with paper baselines (Human 80.0%, M3A 30.6%)
