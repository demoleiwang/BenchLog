# Online-Mind2Web

> Live-site successor to Mind2Web — 300 tasks across **136 live websites**, with an LLM-judge called WebJudge. Its 2025 paper's title asks "An Illusion of Progress?" and the answer is: yes. Operator tops at 61.3% while most frontier agents drop from claimed >90% (on WebVoyager) to 28–30%.

|  |  |
|---|---|
| **Category** | agent / web / GUI / live-site |
| **Released** | 2025-04 |
| **Paper** | [arXiv:2504.01382](https://arxiv.org/abs/2504.01382) (title: "An Illusion of Progress? Assessing the Current State of Web Agents") |
| **Project / Code** | [github.com/OSU-NLP-Group/Online-Mind2Web](https://github.com/OSU-NLP-Group/Online-Mind2Web) |
| **Maintainer** | OSU NLP + collaborators |
| **Size** | 300 tasks across 136 websites |
| **License** | per GitHub |
| **Status** | active; a primary "live-web reality check" for frontier web agents |

## What it measures

Whether web agents that claim >90% on sandboxed benchmarks (WebVoyager, WebArena, Mind2Web) can actually succeed on the **live web** — with real cookies, pop-ups, A/B tests, layout drift, CAPTCHAs, geo-blocking, and login walls.

The paper's framing is blunt: prior headline numbers overstate capability because the evaluation substrate is static and cooperative. Online-Mind2Web is the uncooperative-substrate complement. Results: same models that scored >90% on WebVoyager cluster at 28–30% on Online-Mind2Web. Operator (OpenAI's agent) leads at 61.3%.

## Task format

- **Input:** natural-language task + access to a live website.
- **Output:** browser actions on the real site until a stopping condition.
- **Scoring:**
  - **Human-evaluated success** — gold standard
  - **WebJudge** — automatic LLM-judge that reaches ~85% agreement with humans (3.8pp avg gap)
- **Splits:** 300 tasks (167 carried forward from legacy Mind2Web, 24 rewritten, 34 imported from Mind2Web-Live, 75 new).

## Example

A representative task (paraphrased): *"Open GitHub, find the most-starred public Rust repository created in 2024, and note its author's country from the profile."* Real site, real drift; the task has to succeed despite GitHub UI changes between capture and evaluation.

_Source: [arXiv:2504.01382](https://arxiv.org/abs/2504.01382)._

## Leaderboard (snapshot)

| Model / Agent | Human-evaluated success | Source |
|---|---:|---|
| Operator (OpenAI) | 61.3% | [arXiv:2504.01382](https://arxiv.org/abs/2504.01382) |
| Most other frontier agents | 28–30% | [arXiv:2504.01382](https://arxiv.org/abs/2504.01382) |

_The 30-point gap between Operator and the pack reflects a scaffold + training-data advantage; OpenAI specifically trained a web-agent model. Add source-linked rows from subsequent evaluations._

## Critique & known issues

- **Human evaluation is expensive.** WebJudge (LLM-judge) is the practical alternative but inherits judge biases. Cross-judge variance not yet well-studied.
- **Live-web drift.** Same caveat as [ClawBench](ClawBench.md): scores change week-to-week as sites update. Time-stamp every comparison.
- **Geographic dependence.** Runs from different IPs see different content, CAPTCHAs, availability.
- **Operator advantage may narrow.** OpenAI's lead reflects intense product investment in a web agent; as other labs release comparable agents, the field will compress.
- **300 tasks is modest.** Per-website analysis is noisy; category-level analysis more reliable.
- **Many sites require login.** Task distribution skews toward sites that allow unauthenticated use; enterprise-style sites under-represented.

## Related benchmarks

- [Mind2Web](Mind2Web.md) — static-DOM predecessor
- [ClawBench](ClawBench.md) — 153-task live-site sibling (submission-interception design)
- [WebArena](WebArena.md) — self-hosted sandbox
- [VisualWebArena](VisualWebArena.md) — multimodal / visual web agent
- WebVoyager — the live-site benchmark whose ">90%" headline Online-Mind2Web challenges

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with paper's headline numbers
