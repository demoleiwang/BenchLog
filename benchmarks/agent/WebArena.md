# WebArena

> 812 web-navigation tasks on self-hosted replicas of GitLab, Reddit, an e-commerce site, a CMS, and map search — the foundational "agent browses the web" benchmark from CMU, still widely cited as a baseline.

|  |  |
|---|---|
| **Category** | agent / web navigation |
| **Released** | 2023-07 |
| **Paper** | [arXiv:2307.13854](https://arxiv.org/abs/2307.13854) |
| **Project / Code** | [webarena.dev](https://webarena.dev/) · [github.com/web-arena-x/webarena](https://github.com/web-arena-x/webarena) |
| **Maintainer** | Zhou et al. (CMU) |
| **Size** | 812 tasks across 4 web applications + map |
| **License** | Apache 2.0 (code) |
| **Status** | widely cited; foundational benchmark for web agents. VisualWebArena is the multimodal sibling. |

## What it measures

Whether a browser-driving agent can complete realistic, end-to-end web tasks — edit a repo issue, post a comment, change account settings, submit an order — on self-hosted replicas of real web services.

WebArena predates and complements GAIA: where GAIA emphasises free-form Q&A with tool chains, WebArena emphasises deep interaction with a small number of complex web apps, with state-based verification rather than string-match answering.

## Task format

- **Input:** natural-language intent + the current page (HTML / DOM / accessibility tree / screenshot, per the chosen observation modality).
- **Output:** a sequence of browser actions (click, type, navigate).
- **Scoring:** custom per-task evaluators inspect the final state of the web service (e.g. "is the issue closed?", "was the order placed with these items?"). Binary success per task; overall = % success.
- **Splits:** tasks are grouped by target site: GitLab, Reddit-clone, shopping, shopping-admin CMS, map.

## Example

> "Navigate to the issue I opened last week in the `docs` repository and close it with a comment explaining that it was resolved in PR #42."

The agent must log in, navigate to GitLab, find the issue, verify which one is "mine from last week", post a comment, and close it. The evaluator inspects the GitLab backend state.

_Source: sample tasks in [github.com/web-arena-x/webarena](https://github.com/web-arena-x/webarena) and [webarena.dev](https://webarena.dev/)._

## Leaderboard (snapshot)

| Model / Agent | Success | Date | Source |
|---|---:|---|---|
| _seed pending_ | _unknown_ | _unknown_ | [webarena.dev](https://webarena.dev/) |

_Community leaderboard exists on the project site; add source-linked rows from the WebArena paper and from subsequent agent papers (e.g. AgentTrek, SteP, BrowserGym) when seeding._

## Critique & known issues

- **Self-hosted replicas ≠ the live web.** Scores do not translate 1-to-1 to "will this agent work on real GitHub / real Reddit". The replicas are intentionally static to keep evaluation reproducible.
- **Small app count.** Five sites is representative-ish for mainstream task types, but coverage of niche enterprise flows is zero.
- **Observation-modality sensitivity.** DOM vs. accessibility-tree vs. screenshot-only agents are not directly comparable; quote modality with score.
- **Action-space brittleness.** Subtle differences in element-selector schemas (CSS path vs. XPath vs. aria-labels) change scores several points.
- **Supplanted for current frontier claims by BrowseComp / OSWorld.** WebArena remains the research baseline; new frontier launches tend to cite newer benchmarks.

## Related benchmarks

- VisualWebArena — multimodal variant with image-grounded intents
- [OSWorld](OSWorld.md) — desktop-OS-level superset of the computer-use problem
- Mind2Web — broader site coverage, static trajectories
- [BrowseComp](BrowseComp.md) — search/lookup-heavy, different slice

## Update log

- 2026-04-15: Initial entry
