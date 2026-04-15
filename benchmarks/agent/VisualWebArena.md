# VisualWebArena

> CMU's multimodal extension of WebArena — **910 realistic tasks** across Reddit, Shopping, and a new Classifieds environment, where the task requires actually *seeing* the page (not just reading its DOM). Set-of-Mark-style element annotation for vision-language agents.

|  |  |
|---|---|
| **Category** | agent / GUI / web / multimodal |
| **Released** | 2024-01 |
| **Paper** | [arXiv:2401.13649](https://arxiv.org/abs/2401.13649) |
| **Project / Code** | [jykoh.com/vwa](https://jykoh.com/vwa) · [github.com/web-arena-x/visualwebarena](https://github.com/web-arena-x/visualwebarena) |
| **Maintainer** | Jing Yu Koh et al. (CMU) |
| **Size** | 910 tasks across 3 self-hosted environments |
| **License** | per GitHub |
| **Status** | active; the canonical multimodal web agent benchmark |

## What it measures

Whether a multimodal web agent can complete tasks that **require visual perception** — interpreting product photos, chart images, map regions, captchas, visual page layouts — in addition to reading text. WebArena's predecessor was DOM-only; VisualWebArena adds tasks where the DOM is insufficient and the model must actually see.

Core design innovation: **Set-of-Mark prompting**. Every interactable element on every page is annotated with a bounding box and a unique ID via injected JavaScript, giving the model a stable visual vocabulary. This makes action-grounding tractable for vision-language models at evaluation time.

Three environments, all self-hosted for reproducibility:
- **Reddit** (self-hosted replica) — visual discussion tasks
- **Shopping** (self-hosted replica) — product-image-dependent tasks
- **Classifieds** — a new environment with real-world data added specifically for VisualWebArena

## Task format

- **Input:** natural-language intent + page observation as (DOM / accessibility tree / screenshot) — agent choice depending on harness.
- **Output:** sequence of browser actions (click by element ID, type text, navigate).
- **Scoring:** task-level binary success verified by inspecting environment state (similar to WebArena). Reported overall and per-environment.
- **Splits:** 910 tasks; per-env split roughly balanced.

## Example

Representative task (Classifieds env): *"I'm looking for a red road bike with drop handlebars, Shimano components, and a carbon frame, under $2000. Save the first three matching listings to my Favourites."* The model must interpret product photos (not just text descriptions) to judge handlebar shape, component brand, and frame material.

_Source: [jykoh.com/vwa](https://jykoh.com/vwa)._

## Leaderboard (snapshot)

| Model / Agent | Success (overall) | Source |
|---|---:|---|
| _see project site for current frontier rows_ | _unknown_ | [jykoh.com/vwa](https://jykoh.com/vwa) |

_At launch (2024), frontier multimodal models (GPT-4V, Gemini) showed a considerable gap to human performance; current (2026) frontier scores should be populated from model launch blogs when available._

## Critique & known issues

- **Self-hosted replicas ≠ live web.** Same caveat as WebArena. A VisualWebArena score does not predict live-site performance; see Online-Mind2Web / ClawBench for that.
- **Set-of-Mark helps MLLM agents but caps performance.** Agents relying on ID-based action grounding do well; agents doing raw pixel prediction see a harder task. Both are valid research directions, different leaderboards.
- **Only 3 environments.** Visual skills exercised are narrow — product images, classified listings, Reddit threads. Chart QA, diagram reasoning, map tasks are under-represented.
- **Shopping / Classifieds product catalogs drift.** Re-running years later gives slightly different per-task mixtures.
- **Evaluation harnesses differ significantly** in observation format (screenshot-only vs. Set-of-Mark vs. DOM-only); cite the setting.

## Related benchmarks

- [WebArena](WebArena.md) — DOM-only predecessor from the same lab
- [Mind2Web](Mind2Web.md) — broader but static
- [Online-Mind2Web](Online-Mind2Web.md) — live-site alternative
- VideoWebArena — video-understanding web agent benchmark from same community
- [OSWorld](OSWorld.md) — desktop computer use

## Update log

- 2026-04-15: Initial entry
