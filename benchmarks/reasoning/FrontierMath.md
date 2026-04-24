# FrontierMath

> Epoch AI's hundreds of original, **research-level** math problems crafted by mathematicians (including 14 IMO gold medalists and a Fields Medal recipient). Solving a typical problem takes a researcher hours; Tier-4 problems take days. Frontier models hit ~13% on Tier-4.

|  |  |
|---|---|
| **Category** | reasoning / research-level math |
| **Released** | 2024-11 |
| **Paper** | [arXiv:2411.04872](https://arxiv.org/abs/2411.04872) |
| **Project** | [epoch.ai/frontiermath](https://epoch.ai/frontiermath/) · Tier 4 leaderboard [epoch.ai/benchmarks/frontiermath-tier-4](https://epoch.ai/benchmarks/frontiermath-tier-4) |
| **Maintainer** | Epoch AI (research org tracking AI progress) |
| **Size** | hundreds of problems across Tiers 1–4 |
| **License** | private test set; problems are kept confidential |
| **Status** | active; the **hardest math benchmark currently used by frontier labs**, sits beyond AIME / HMMT in difficulty |

## What it measures

**Research-level mathematical reasoning** across most major branches of modern math — number theory, real analysis, algebraic geometry, category theory, combinatorics, computational problems. Problems are *original* (not from textbooks or competitions) and *unpublished*, designed specifically to resist contamination from training data.

**Tier system:**
- **Tier 1–3**: undergraduate through early-postdoc level
- **Tier 4**: research-level problems, crafted to require multi-day effort from domain mathematicians

The benchmark's contribution is not just difficulty but **integrity**: automated verification (problems have unambiguous numerical answers) + private test set + ongoing curation by world-class mathematicians. This makes FrontierMath the cleanest signal of frontier reasoning available today.

## Task format

- **Input:** an original math problem requiring deep technical work.
- **Output:** typically a numerical answer or expression that can be automatically verified.
- **Scoring:** percentage of problems solved correctly. Reported separately per Tier.
- **Splits:** Tiers 1–4; Tier 4 has its own dedicated leaderboard for the hardest research-tier problems.

## Example

The problems are kept confidential to preserve test-set integrity. Public examples in the paper sketch the difficulty: integration of complicated functions evaluated to a closed form, computational number theory requiring custom algorithms, abstract algebraic geometry questions whose solutions span pages.

_Source: [arXiv:2411.04872](https://arxiv.org/abs/2411.04872) — public sample problems in paper appendix._

## Leaderboard (snapshot)

Tier 4 (research-level) headline:

| Model / System | Tier 4 | Source |
|---|---:|---|
| GPT-5.5 Pro | 39.6% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| GPT-5.5 | 35.4% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| GPT-5.4 (OpenAI-reported) | 27.1% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| Claude Opus 4.7 (OpenAI-reported) | 22.9% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| Gemini 3.1 Pro (OpenAI-reported) | 16.7% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| GPT-5 Pro | 13% (new record) | [Epoch AI status, 2025-10](https://x.com/EpochAIResearch/status/1976685685349441826) |
| Gemini 2.5 Deep Think | ~12% (1 problem behind GPT-5 Pro, not statistically significant) | [Epoch AI status](https://x.com/EpochAIResearch/status/1976685685349441826) |
| Grok 4 Heavy | "lags" | [Epoch AI status](https://x.com/EpochAIResearch/status/1976685685349441826) |
| Frontier baseline (paper, late 2024) | < 2% | [arXiv:2411.04872](https://arxiv.org/abs/2411.04872) |

### Tier 1–3 (from GPT-5.5 launch)

| Model | Tier 1–3 | Source |
|---|---:|---|
| GPT-5.5 Pro | 52.4% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| GPT-5.5 | 51.7% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| GPT-5.4 (OpenAI-reported) | 47.6% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| Claude Opus 4.7 (OpenAI-reported) | 43.8% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| Gemini 3.1 Pro (OpenAI-reported) | 36.9% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |

_Tier 1–3 numbers are higher and reported separately on the [main FrontierMath page](https://epoch.ai/frontiermath/). Cite the Tier when quoting._

## Critique & known issues

- **Closed test set** — strength for integrity, weakness for reproducibility. Independent labs cannot replicate runs without Epoch AI mediation.
- **Tier definitions are subjective.** Where Tier-3 ends and Tier-4 begins is a judgement call by the curating mathematicians.
- **Numerical-answer constraint excludes proof problems.** Real research math is largely about proofs, which FrontierMath cannot grade automatically.
- **Compute-intensive evaluations dominate at the top.** GPT-5 Pro / Gemini Deep Think evaluations require thousands of dollars per run; not within reach of independent academic groups.
- **OpenAI-FrontierMath transparency debacle** (late 2024 / early 2025): OpenAI funded the benchmark and had access during development, raising contamination concerns. Epoch AI later clarified the access boundaries; cite their statements when this comes up.
- **"Mathematicians' time" is a fuzzy difficulty metric.** Hours-vs-days estimates vary across mathematicians; the calibration is informal.

## Related benchmarks

- [HMMT 2025](HMMT-2025.md) — competition math, easier tier
- [AIME 2025](AIME-2025.md) — competition math, easier still
- [IMOAnswerBench] — IMO-style olympiad math
- Putnam — undergraduate competition math
- USAMO — proof-based math (no automatic grader)

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with Epoch AI's 2025-10 Tier-4 update (GPT-5 Pro 13%, Gemini 2.5 Deep Think ~12%) + paper baseline (< 2%)
- 2026-04-24: added 10 new rows from GPT-5.5 launch (2026-04-23) — **GPT-5.5 Pro leads Tier 4 at 39.6%** (3× the GPT-5 Pro record), Tier 1–3 now cluster 37–52% for frontier models. Includes GPT-5.5 / GPT-5.4 / Claude Opus 4.7 / Gemini 3.1 Pro. Sources: OpenAI launch (self-reported for OpenAI models, OpenAI-reported for competitors).
