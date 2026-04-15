# ClawBench

> 153 everyday online tasks tested on **144 live production websites** — book flights, order groceries, submit job applications. A lightweight interception layer blocks the final submission so evaluation is safe but task completion is measured on real websites. Claude Sonnet 4.6 tops at 33.3%.

|  |  |
|---|---|
| **Category** | agent / web / live-site |
| **Released** | 2026-04-09 |
| **Paper** | [arXiv:2604.08523](https://arxiv.org/abs/2604.08523) · [HF page](https://huggingface.co/papers/2604.08523) |
| **Project / Code** | see arXiv + HF paper page |
| **Maintainer** | Yuxuan Zhang et al. (21-author team including Dongfu Jiang, Wenhu Chen, Kelsey R. Allen) |
| **Size** | 153 tasks across 144 live websites in 15 categories |
| **License** | _unknown_ |
| **Status** | active; novel in using live production sites with a safety interception layer |

## What it measures

Whether an agent can complete everyday online tasks — booking, ordering, form submission, account management — on **actual production websites** rather than in a sandboxed replica. The thesis is that sandbox benchmarks (WebArena, Mind2Web) systematically under-report the fragility of agents in the wild, because live sites have dynamic content, CAPTCHAs, A/B tests, and drift that sandboxes lack.

The safety mechanism is subtle and important: a **lightweight interception layer** captures and **blocks only the final submission** (the "submit" / "checkout" / "send" request). Everything up to that point happens on the real site — navigation, form-filling, state — so the agent's observable experience is the live site. The final side-effect never fires, so evaluations are safe to run repeatedly.

## Task format

- **Input:** natural-language description of an everyday online goal + the target website.
- **Output:** a browser trajectory that reaches the pre-submission state.
- **Scoring:** task completion verified at the pre-submission point (correct fields filled, correct cart, correct recipient, etc.).
- **Splits:** 153 tasks, 144 websites, 15 categories.

## Example

Representative task style (reconstructed from the benchmark's framing): *"On delta.com, find the cheapest round-trip economy flight from JFK to LHR departing next Friday and returning 7 days later; fill in passenger details as 'Test User, DOB 1990-01-01'; advance to the payment screen."* Success = the trajectory arrives at payment with correct flight selection and passenger details.

_Source: [arXiv:2604.08523](https://arxiv.org/abs/2604.08523)._

## Leaderboard (snapshot)

| Model | Task completion | Source |
|---|---:|---|
| Claude Sonnet 4.6 | 33.3% | [arXiv:2604.08523](https://arxiv.org/abs/2604.08523) |

_Additional models from the paper's evaluation should be added with source-linked rows when the full table is inspected. The low top score reflects that live-site evaluation is much harder than sandboxed variants._

## Critique & known issues

- **Live-site drift.** Websites change layout, A/B-test, and break client-side assumptions. A model that scored X last week can score X±10 this week without any model change. Re-runs need time-stamped sources.
- **Interception layer is heroic engineering but imperfect.** Some flows have no discrete "final submit" step (chat-style interfaces, multi-step wizards); these tasks are omitted or approximated.
- **Geographic dependence.** Regional content, geo-blocking, and localisation mean tasks behave differently from different IP ranges.
- **Login / captcha walls.** Many live sites gate functionality behind authentication or anti-bot checks; the paper's design decisions about which sites make the cut skew task distribution.
- **Ethical / legal considerations.** Scraping production sites at scale has TOS implications; the interception design addresses *side effects* but not *traffic burden*. Responsible citation should note the "safe by design" framing.
- **Absolute 33% reveals agent fragility.** A practical production tool needs ~95%+ — this benchmark is primarily useful as a gap-measurement tool, not a go/no-go for deployment.

## Related benchmarks

- [WebArena](WebArena.md) — sandboxed predecessor with self-hosted replicas
- [BrowseComp](BrowseComp.md) — info-seeking, not task-completion
- [VitaBench](VitaBench.md) — simulated service-economy agent tasks
- Mind2Web — broader site coverage, static trajectories

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with Claude Sonnet 4.6 (33.3%) from launch paper
