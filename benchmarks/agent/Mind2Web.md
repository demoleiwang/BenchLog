# Mind2Web

> The foundational dataset for generalist web agents — 2,000+ tasks across **137 websites** spanning 31 domains, with human-crowdsourced action sequences. NeurIPS'23 Spotlight; predecessor to most later web-agent benchmarks.

|  |  |
|---|---|
| **Category** | agent / web / GUI |
| **Released** | 2023-06 (arXiv); NeurIPS'23 Spotlight |
| **Paper** | [arXiv:2306.06070](https://arxiv.org/abs/2306.06070) |
| **Project / Code** | [osu-nlp-group.github.io/Mind2Web](https://osu-nlp-group.github.io/Mind2Web/) · [github.com/OSU-NLP-Group/Mind2Web](https://github.com/OSU-NLP-Group/Mind2Web) · dataset [huggingface.co/datasets/osunlp/Mind2Web](https://huggingface.co/datasets/osunlp/Mind2Web) |
| **Maintainer** | OSU NLP (Xiang Deng, Yu Gu, Boyuan Zheng, Shijie Chen, Samuel Stevens, Boshi Wang, Huan Sun, Yu Su) |
| **Size** | > 2,000 open-ended tasks across 137 websites × 31 domains |
| **License** | per GitHub |
| **Status** | foundational; newer live-site and multimodal variants (Online-Mind2Web, Multimodal-Mind2Web) have partially superseded it for frontier reporting |

## What it measures

Whether an LLM-driven agent can follow natural-language instructions to complete complex tasks on **any website** — not a sandboxed replica, not a synthetic environment, but real websites' HTML + DOM captured at crowdsourcing time.

Mind2Web was the first benchmark of its kind: it broke the "5 mock websites" mold of WebShop-era benchmarks by sourcing tasks from 137 real sites across 31 domains with crowdsourced human action sequences as ground truth. It established web-agent evaluation as a field.

The paper introduces **MindAct**, a two-stage baseline: small LM filters candidate elements, LLM selects among them multi-choice-style.

## Task format

- **Input:** natural-language task description + captured HTML/DOM state at each step.
- **Output:** sequence of (element-to-click, optional text-to-type) actions.
- **Scoring:** *step-level* element accuracy + *task-level* success rate. Multiple metrics reported.
- **Splits:** cross-task, cross-website, cross-domain generalisation splits (tests whether the agent learned the task or the website).
- **Multimodal-Mind2Web** (March 2024) extends with screenshot images per step.

## Example

Representative task (paraphrased from the dataset): *"Find a one-way flight from New York to Mumbai for next Tuesday, sort by price, and select the cheapest direct flight."* Ground truth is a sequence of clicks and form fills recorded by a crowdworker on the real site.

_Source: [osu-nlp-group.github.io/Mind2Web](https://osu-nlp-group.github.io/Mind2Web/) — task browser in the project page._

## Leaderboard (snapshot)

| Model / Agent | Setting | Element Acc. / Success | Source |
|---|---|---:|---|
| MindAct (baseline from paper) | cross-task | _see paper_ | [arXiv:2306.06070](https://arxiv.org/abs/2306.06070) |

_Mind2Web-era scores (2023) are not directly comparable to modern frontier agents; for current state-of-the-art use [Online-Mind2Web](Online-Mind2Web.md) and [VisualWebArena](VisualWebArena.md). Mind2Web stays as the historical anchor._

## Critique & known issues

- **Static HTML snapshots.** The agent sees DOMs captured at crowdsourcing time, not live sites. An agent that aces Mind2Web may still fail on the live web (see Online-Mind2Web).
- **Action-space abstraction.** Click + type only. Modern live-site agents need hover, drag, scroll, tab-management; those capabilities are out of Mind2Web's scope.
- **Step-level accuracy can look good when task-level fails.** A model that gets 9/10 steps right but the last one wrong still gets 0% task success. Reporting step-level headlines obscures this.
- **Contamination risk.** The dataset is public on GitHub and HF; all recent frontier models have plausibly seen it.
- **Training distribution bias.** The 137 websites are mostly US / English / mainstream; non-Western sites under-represented.

## Related benchmarks

- [Online-Mind2Web](Online-Mind2Web.md) — live-site successor
- [VisualWebArena](VisualWebArena.md) — multimodal / visual web agent
- [WebArena](WebArena.md) — self-hosted sandboxed sibling
- [ClawBench](ClawBench.md) — newest live-site sibling

## Update log

- 2026-04-15: Initial entry
