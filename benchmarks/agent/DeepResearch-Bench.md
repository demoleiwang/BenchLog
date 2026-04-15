# DeepResearch Bench

> 100 PhD-level research tasks across 22 fields, graded by **RACE** (reference-based quality evaluation) and **FACT** (factual abundance + citation trustworthiness) — a benchmark for deep-research agents that produce *reports*, not just answers.

|  |  |
|---|---|
| **Category** | agent / deep research / report generation |
| **Released** | 2025-06-13 |
| **Paper** | [arXiv:2506.11763](https://arxiv.org/abs/2506.11763) |
| **Project / Code** | [deepresearch-bench.github.io](https://deepresearch-bench.github.io/) · [github.com/Ayanami0730/deep_research_bench](https://github.com/Ayanami0730/deep_research_bench) |
| **Maintainer** | Mingxuan Du, Benfeng Xu, Chiwei Zhu, Xiaorui Wang, Zhendong Mao |
| **Size** | 100 tasks across 22 fields |
| **License** | per GitHub |
| **Status** | active; a reference evaluation for the "Deep Research" agent archetype (OpenAI Deep Research, Gemini Deep Research, etc.) |

## What it measures

Whether a deep-research agent can produce a **PhD-level research report** — not a short answer — on a meticulously crafted, domain-expert-authored research question. Distinct from [DeepSearchQA](DeepSearchQA.md) (which judges a final answer set) and [WideSearch](WideSearch.md) (which judges a final table), DeepResearch Bench grades the *report* itself.

Two evaluation frameworks are the contribution:

- **RACE** — *Reference-based Adaptive Criteria-driven Evaluation* with dynamic weighting. Judges report quality against a reference report using multi-dimensional rubrics that adapt per task.
- **FACT** — *Framework for Factual Abundance and Citation Trustworthiness*. Judges information retrieval effectiveness and citation accuracy; surfaces hallucinated citations explicitly.

## Task format

- **Input:** a PhD-level research prompt (expert-authored, one of 100 across 22 fields).
- **Output:** a full research-style report with citations.
- **Scoring:** RACE (report quality) + FACT (factual / citation integrity). Reported per dimension and aggregated.
- **Splits:** 100 tasks; per-field breakdown available.

## Example

Representative task (paraphrased): *"Survey the state of the art in post-training alignment techniques for LLMs, focusing on RLHF vs. DPO vs. RLVR. Quantitatively compare results on 3+ benchmarks. Include original analysis of open problems. Target audience: PhD candidates in ML."* The agent must search, synthesise, cite accurately, and produce a multi-section report. Graded by RACE vs. a reference report + FACT checks on every citation.

_Source: [deepresearch-bench.github.io](https://deepresearch-bench.github.io/)._

## Leaderboard (snapshot)

| Model / System | Score | Source |
|---|---:|---|
| _see project site for current rankings_ | _unknown_ | [deepresearch-bench.github.io](https://deepresearch-bench.github.io/) |

_Leaderboard is maintained on the project site; values in recent frontier model cards (Kimi K2.5, Qwen3.5) report scores on similar deep-research benches under different names — track DeepResearch Bench vs. DeepSearchQA vs. WideSearch as separate rows._

## Critique & known issues

- **LLM-as-judge dominates RACE grading.** The evaluator is itself an LLM; cross-evaluator variance is a real concern.
- **FACT depends on citation-verification quality.** Citations that point to paywalled / changing web pages may be graded as hallucinations when they are legitimate.
- **100 tasks is small for a PhD-level benchmark.** Per-field distribution can swing the headline substantially.
- **Report-grading is subjective** even with rubrics; reproducibility across graders is an open question.
- **Dataset freshness.** Research questions cited on the open web may have accumulated answers since the benchmark was published — recent models have access to more complete source material than the reference report assumed.

## Related benchmarks

- [DeepSearchQA](DeepSearchQA.md) — set-based Q&A sibling
- [WideSearch](WideSearch.md) — table-based broad info-seeking sibling
- [BrowseComp](BrowseComp.md) — single-answer deep research
- [GAIA](GAIA.md) — assistant tasks with tool chains

## Update log

- 2026-04-15: Initial entry
