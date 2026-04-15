# RULER

> NVIDIA's long-context benchmark that asks "what's the *real* context size of your model?" — 13 tasks spanning needle-in-haystack variants, multi-hop tracing, and aggregation at context lengths up to 200K tokens.

|  |  |
|---|---|
| **Category** | long-context |
| **Released** | 2024-04 (v1); 2024-08 (v3 revision) |
| **Paper** | [arXiv:2404.06654](https://arxiv.org/abs/2404.06654) |
| **Project / Code** | [github.com/NVIDIA/RULER](https://github.com/NVIDIA/RULER) |
| **Maintainer** | NVIDIA (Cheng-Ping Hsieh et al.) |
| **Size** | 13 tasks, evaluated across configurable context lengths (4K → 128K → 200K+) |
| **License** | Apache 2.0 |
| **Status** | active; the reference benchmark for long-context claims |

## What it measures

Whether a long-context LLM's **effective** context is anywhere near its **claimed** context. The paper's finding — "most models significantly degrade at 32K despite advertising 32K+" — crystallised into a widely-accepted skepticism about context-window marketing.

Thirteen tasks extend the "needle-in-a-haystack" (NIAH) paradigm along multiple axes: varying the number of needles, the type of needles (single key, multi-key, value-type variation), and introducing non-retrieval tasks (multi-hop tracing and aggregation) that demand actual long-range reasoning — not just lookup.

## Task format

- **Input:** a context of controlled length; a task that depends on information scattered across it.
- **Output:** an answer that can be automatically graded (exact match, count, aggregation).
- **Scoring:** per-task accuracy, reported as a curve over context length. Headline metric is the "effective context" — the longest length at which the model still clears a threshold (commonly 85%).
- **Splits:** tasks are parametric; you configure lengths for your eval run.

## Task categories (13 tasks)

From the paper:
- Single NIAH (retrieval)
- Multi-key NIAH
- Multi-value NIAH
- Multi-query NIAH
- Variable tracking / multi-hop tracing
- Common / frequent words extraction
- Aggregation tasks
- (Additional sub-variations — see paper Table 1)

## Example

Multi-hop variable tracking: the context asserts a chain like "`A = 5. ... B = A + 3. ... C = B × 2. ...`" scattered across (e.g.) 64K tokens. The question asks for `C`. The model must thread through the assignments, not just retrieve one.

_Source: [arXiv:2404.06654](https://arxiv.org/abs/2404.06654), Section 3._

## Leaderboard (snapshot)

Scores are length-dependent — a single number is only meaningful when paired with a context length.

| Model | Context length | Score | Source |
|---|---|---:|---|
| _seed pending_ | _unknown_ | _unknown_ | [github.com/NVIDIA/RULER](https://github.com/NVIDIA/RULER) |

_RULER numbers appear in tech reports for long-context-focused releases; add source-linked rows from Kimi K2 (128K), MiniMax-M1 (1M), GLM-4.6 (200K) etc. when captured. The project repo also maintains a rolling results table._

## Critique & known issues

- **Synthetic tasks ≠ natural long context.** RULER is a ceiling probe, not a skill test on natural long documents (for that, see LongBench, ∞Bench).
- **Threshold choice changes "effective context" headline substantially.** An 85% threshold vs. a 70% threshold can report double the "real" context.
- **Easy to game with retrieval-augmentation.** A retrieval-over-context harness can ace NIAH sub-tasks while base model fails them; reports need to state whether retrieval was permitted.
- **Task mix uneven.** Retrieval-style tasks dominate the 13; aggregation tasks are fewer and noisier.
- **Parametric evaluation cost.** Running RULER at 200K × 13 tasks × several lengths is expensive; partial reports are common, which hurts comparability.

## Related benchmarks

- LongBench / LongBench-v2 — natural-document long-context tasks
- ∞Bench / InfiniteBench — pushes to 1M+ token contexts
- HELM long-context suite — broader evaluation harness
- Needle-in-a-Haystack (original) — the single-task precursor

## Update log

- 2026-04-15: Initial entry — first benchmark in the `long-context` category
