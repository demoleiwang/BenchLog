# WideSearch

> ByteDance-Seed's 200-task benchmark for **broad** (not deep) info-seeking — agents fill a structured table by gathering large-scale atomic information across many parallel entities. Headline finding: most systems achieve ~0%; the best reaches just 5%.

|  |  |
|---|---|
| **Category** | agent / deep research / information retrieval |
| **Released** | 2025-08 |
| **Paper** | [arXiv:2508.07999](https://arxiv.org/abs/2508.07999) |
| **Project / Code** | [widesearch-seed.github.io](https://widesearch-seed.github.io/) · [github.com/ByteDance-Seed/WideSearch](https://github.com/ByteDance-Seed/WideSearch) |
| **Maintainer** | ByteDance-Seed |
| **Size** | 200 questions (100 English + 100 Chinese) across 15+ domains |
| **License** | _unknown_ |
| **Status** | active; a reference bench for "broad" info-seeking distinct from deep-reasoning benchmarks |

## What it measures

Whether an agent can gather **broad, parallel** information and organise it into a structured output — typically a table with many rows and many columns — where the primary challenge is *exhaustiveness and fidelity at scale* rather than depth of reasoning on any single query.

WideSearch targets the "I don't have time to do it" problem: tasks that any trained researcher could complete given 4+ hours but would find tedious. The task design deliberately rules out reasoning-heavy difficulty — what makes it hard is volume + structure + fidelity.

The paper's launch finding — most frontier agentic systems score near 0% overall, with the best hitting only 5% — framed WideSearch as an unusually hard benchmark that exposes scale-of-retrieval gaps modern agents haven't yet solved.

## Task format

- **Input:** a natural-language instruction that requires populating a structured table from open-web sources.
- **Output:** a filled table with the requested rows × columns.
- **Scoring:** **item-F1** on the table entries. Also overall success rate (full table correct).
- **Splits:** 200 tasks, 100 EN + 100 ZH; 15+ domains grounded in real user queries.

## Example

Representative task (paraphrased from the benchmark's descriptions): *"List every professional Go tournament in Asia since 2020, with columns: tournament name, year, country, champion, runner-up, prize pool USD."* The agent must populate many rows × many columns from disparate sources and get every cell right.

_Source: [widesearch-seed.github.io](https://widesearch-seed.github.io/) and task samples in [github.com/ByteDance-Seed/WideSearch](https://github.com/ByteDance-Seed/WideSearch)._

## Leaderboard (snapshot)

Rows below reflect **item-F1** (per the benchmark's convention); scaffold matters — Agent Swarm-style decomposition notably boosts WideSearch.

| Model / Agent | item-F1 | Scaffold / note | Source |
|---|---:|---|---|
| Kimi K2.6 (item-F1) | 80.8 | self-reported, 2026-04-20 | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Hy3-preview (Tencent Hunyuan 3) | 70.2 | self-reported, 2026-04 | [huggingface.co/tencent/Hy3-preview](https://huggingface.co/tencent/Hy3-preview) |
| Kimi K2.5 (Agent Swarm) | 79.0 | Agent Swarm scaffold | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| GPT-5.2 (Qwen-reported) | 76.8 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Claude 4.5 Opus (Kimi-reported / Qwen-reported) | 76.2 / 76.4 | — | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Qwen3.5-397B-A17B | 74.0 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Kimi K2.5 (no scaffold) | 72.7 | — | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Gemini 3 Pro (Qwen-reported) | 68.0 | — | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Gemini 3 Pro (Kimi-reported) | 57.0 | — | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| DeepSeek V3.2 (Kimi-reported) | 32.5 | — | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Best agent at launch (end-to-end system) | ~5% overall success | launch benchmark, 2025-08 | [arXiv:2508.07999](https://arxiv.org/abs/2508.07999) |

_Note: item-F1 (per-cell F1) and overall success rate (per-task binary) are very different metrics; the 2025-08 launch result of ~5% used the stricter overall-success rate, while frontier 2026 item-F1 scores reflect per-cell accuracy which saturates faster._

## Critique & known issues

- **Item-F1 hides format errors.** A model that gets every cell right but in the wrong column may score okay under item-F1 while failing the overall-success metric entirely.
- **Chinese/English split is important.** Different models have asymmetric strength; always report EN and ZH separately when the source provides it.
- **Volume × fidelity tradeoff.** Agents optimised for recall over-emit, for precision under-emit; neither is easily balanced by prompt engineering.
- **Scaffolds dominate.** Agent Swarm / decomposition scaffolds add 5–10 points. Don't compare raw model numbers across rows with different scaffolds.
- **Source stability.** Many cells rely on current web facts; over time some ground-truth values become contested.

## Related benchmarks

- [DeepSearchQA](DeepSearchQA.md) — Google sibling, set-based (not table-based)
- [BrowseComp](BrowseComp.md) — single-answer deep research
- [DeepResearch-Bench](DeepResearch-Bench.md) — report-generation cousin

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 8 rows from Kimi K2.5 and Qwen3.5 model cards + paper baseline
- 2026-04-24: added 2 rows — **Kimi K2.6 80.8 (new SOTA, item-F1)** and Hy3-preview 70.2. Sources: Kimi K2.6 and Hy3-preview model cards.
