# LongBench v2

> THUDM's 503 challenging multiple-choice questions across **6 long-context task families**, with contexts from 8k to 2M words. Even **human experts** with search tools score only **53.7% under a 15-min time limit**; o1-preview leads at 57.7%.

|  |  |
|---|---|
| **Category** | long-context |
| **Released** | 2024-12 (v1); 2025-01 (revised) |
| **Paper** | [arXiv:2412.15204](https://arxiv.org/abs/2412.15204) |
| **Project / Code** | [longbench2.github.io](https://longbench2.github.io/) · [github.com/THUDM/LongBench](https://github.com/THUDM/LongBench) · dataset [huggingface.co/datasets/zai-org/LongBench-v2](https://huggingface.co/datasets/zai-org/LongBench-v2) |
| **Maintainer** | THUDM (Tsinghua) — same lab as AgentBench / GLM |
| **Size** | 503 questions; contexts 8k–2M words |
| **License** | per GitHub |
| **Status** | active; the natural-document long-context benchmark counterpart to RULER |

## What it measures

**Deep understanding and reasoning** over long natural contexts — not the synthetic needle-in-haystack pattern that RULER measures, but real understanding of long documents, dialogue history, code repositories, and structured data.

Six task categories:
1. Single-document QA
2. Multi-document QA
3. Long in-context learning
4. Long-dialogue history understanding
5. Code repository understanding
6. Long structured-data understanding

The benchmark's headline contribution is its **difficulty calibration via human experts**: ~100 highly-educated annotators (with diverse professional backgrounds) constructed and verified the questions; humans get 53.7% under a 15-minute time constraint with full search. Best models exceed this only with extended chain-of-thought (o1-preview at 57.7%).

LongBench v2 pairs naturally with [RULER](RULER.md): RULER probes effective context capacity (synthetic), LongBench v2 probes long-context skill (natural).

## Task format

- **Input:** a long document or document set + a multiple-choice question.
- **Output:** the chosen letter.
- **Scoring:** accuracy.
- **Splits:** by task family + by context-length bucket (most under 128k; some up to 2M).

## Example

A representative single-document QA item: a 50-page legal contract + *"In which sub-clause does the indemnification cap apply only after notice has been provided in writing?"* The question requires locating one specific clause among many similar ones.

_Source: [longbench2.github.io](https://longbench2.github.io/)._

## Leaderboard (snapshot)

| Model / Setting | Accuracy | Source |
|---|---:|---|
| o1-preview (long CoT) | 57.7 | [arXiv:2412.15204](https://arxiv.org/abs/2412.15204) |
| Best direct-answer model at launch | 50.1 | [arXiv:2412.15204](https://arxiv.org/abs/2412.15204) |
| Human (15-min, with search) | 53.7 | [arXiv:2412.15204](https://arxiv.org/abs/2412.15204) |
| Kimi K2.5 | 61.0 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Gemini 3 Pro (Kimi-reported) | 68.2 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Claude 4.5 Opus (Kimi-reported) | 64.4 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| DeepSeek V3.2 (Kimi-reported) | 59.8 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| GPT-5.2 (Kimi-reported) | 54.5 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |

_2026-frontier models have surpassed the 2024 human baseline (53.7%); Gemini 3 Pro tops the table at 68.2%._

## Critique & known issues

- **MCQ format ceiling.** Multiple-choice answers cap discriminative power; open-ended generation would be a stricter test.
- **Human baseline is time-bounded** (15 min with search). Without time limit, humans likely exceed 80%; the 53.7% number is sensational but not the upper bound.
- **Context-length distribution skews short.** Most questions are < 128k words; the 2M-word ceiling is rarely hit. Models claiming 1M+ context can't be discriminated by LongBench v2 alone.
- **Code-repo and structured-data subtasks** depend heavily on tokeniser efficiency; not directly comparable across vendors.
- **English-dominant** despite "natural-document" framing.

## Related benchmarks

- [RULER](RULER.md) — synthetic capacity-probe sibling
- LongBench (v1) — predecessor, broader and easier
- ∞Bench / InfiniteBench — pushes to 1M+
- HELMET — long-context evaluation harness

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 8 rows from Kimi K2.5 card + paper baselines
