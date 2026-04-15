# BenchLog

> A living, Claude-Code-maintained knowledge base of important AI / LLM / agent benchmarks.
> Maintained by [@demoleiwang](https://github.com/demoleiwang).
> Design: [PLAN.md](PLAN.md) · Pipeline: [TECH_PIPELINE.md](TECH_PIPELINE.md) · Operating manual: [CLAUDE.md](CLAUDE.md)

## Why this exists

Benchmarks are how we know whether a frontier model is actually better. But the landscape moves weekly: new benchmarks appear, old ones saturate, leaderboards shift, and Twitter is full of contested numbers.

BenchLog is one person's attempt to keep a tidy, up-to-date map of:

- **What each major benchmark measures** — in plain English, with concrete examples
- **How frontier models score** — leaderboard snapshots with sources
- **What's wrong with each benchmark** — contamination, saturation, gaming
- **What's new this week** — daily digests of benchmark-relevant papers

## How it stays current

I run `claude` in this repo, type `update`, and Claude follows [`CLAUDE.md`](CLAUDE.md) to:

1. Fetch HuggingFace Daily Papers, arXiv, OpenAI/Anthropic news
2. Filter for benchmark-relevant items
3. Add new entries, append new model scores to existing ones
4. Write a daily digest
5. Commit and push

No PDFs are stored. Every claim links to its source.

## Navigate

### By category

| Category | Benchmarks |
|---|---|
| **[Coding](benchmarks/coding/)** | [HumanEval](benchmarks/coding/HumanEval.md), [SWE-bench Verified](benchmarks/coding/SWE-bench-Verified.md), [SWE-bench Pro](benchmarks/coding/SWE-bench-Pro.md), [Multi-SWE-Bench](benchmarks/coding/Multi-SWE-Bench.md), [LiveCodeBench](benchmarks/coding/LiveCodeBench.md), [ArtifactsBench](benchmarks/coding/ArtifactsBench.md) |
| **[Reasoning](benchmarks/reasoning/)** | [GPQA Diamond](benchmarks/reasoning/GPQA-Diamond.md), [AIME 2025](benchmarks/reasoning/AIME-2025.md), [ARC-AGI-2](benchmarks/reasoning/ARC-AGI-2.md), [HLE](benchmarks/reasoning/HLE.md) |
| **[Agent](benchmarks/agent/)** | [GAIA](benchmarks/agent/GAIA.md), [τ-bench](benchmarks/agent/tau-bench.md), [OSWorld](benchmarks/agent/OSWorld.md), [WebArena](benchmarks/agent/WebArena.md), [BrowseComp](benchmarks/agent/BrowseComp.md), [SWE-Lancer](benchmarks/agent/SWE-Lancer.md), [MLE-Bench](benchmarks/agent/MLE-Bench.md), [GDPval](benchmarks/agent/GDPval.md), [Terminal-Bench](benchmarks/agent/Terminal-Bench.md), [BFCL](benchmarks/agent/BFCL.md), [AgentBench](benchmarks/agent/AgentBench.md), [DeepSearchQA](benchmarks/agent/DeepSearchQA.md), [WideSearch](benchmarks/agent/WideSearch.md), [DeepPlanning](benchmarks/agent/DeepPlanning.md), [VitaBench](benchmarks/agent/VitaBench.md), [Tool-Decathlon](benchmarks/agent/Tool-Decathlon.md), [MCPMark](benchmarks/agent/MCPMark.md), [MCP-Bench](benchmarks/agent/MCP-Bench.md), [DeepResearch-Bench](benchmarks/agent/DeepResearch-Bench.md), [ClawBench](benchmarks/agent/ClawBench.md), [SkillsBench](benchmarks/agent/SkillsBench.md) |
| **[Knowledge](benchmarks/knowledge/)** | [MMLU-Pro](benchmarks/knowledge/MMLU-Pro.md), [SuperGPQA](benchmarks/knowledge/SuperGPQA.md) |
| **[Multimodal](benchmarks/multimodal/)** | [MMMU](benchmarks/multimodal/MMMU.md), [MMMU-Pro](benchmarks/multimodal/MMMU-Pro.md) |
| **[Long context](benchmarks/long-context/)** | [RULER](benchmarks/long-context/RULER.md) |
| **[Safety](benchmarks/safety/)** | [ClawsBench](benchmarks/safety/ClawsBench.md) |

### Latest digests

- [2026-04-15](digests/2026-04-15.md) — bootstrap seed (17 entries); first daily-update cycle test; flagged LARY / ClawGUI / Habitat-GS as trending

### Recently updated entries

- [MMMU](benchmarks/multimodal/MMMU.md) · [MMLU-Pro](benchmarks/knowledge/MMLU-Pro.md) · [GDPval](benchmarks/agent/GDPval.md) · [MLE-Bench](benchmarks/agent/MLE-Bench.md) · [SWE-Lancer](benchmarks/agent/SWE-Lancer.md)

## Repository layout

```
benchmarks/<category>/<Name>.md    # One file per benchmark
digests/YYYY-MM-DD.md              # One file per daily run
leaderboards/overview.md           # Cross-benchmark snapshot
sources/tracked.md                 # The list of feeds we monitor
TEMPLATES/                         # Templates Claude copies from
CLAUDE.md                          # The daily-update instruction sheet
PLAN.md                            # Project design & rationale
```

## Conventions

- **English** for entry structure (headings, field names) — for cross-team consistency.
- **Chinese** is fine in personal-note sections.
- **Every score has a source link.** No hearsay numbers.
- **History is preserved.** Corrected scores leave the old row struck-through, not deleted.
- **Past digests are immutable.**

## License & disclaimer

Summaries, structure, and commentary in this repository are written for personal study and team reference. All linked papers, benchmarks, leaderboards, and quoted examples remain the property of their original authors and are credited via inline links. Nothing here is an official leaderboard.
