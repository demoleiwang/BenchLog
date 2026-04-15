# HumanEval

> 164 hand-written Python programming problems where a model must produce a function body given a docstring; scored by executing unit tests.

|  |  |
|---|---|
| **Category** | coding |
| **Released** | 2021-07 |
| **Paper** | [arXiv:2107.03374](https://arxiv.org/abs/2107.03374) |
| **Project / Code** | [github.com/openai/human-eval](https://github.com/openai/human-eval) |
| **Maintainer** | OpenAI (Chen et al.) |
| **Size** | 164 problems |
| **License** | MIT (code), dataset released with paper |
| **Status** | saturated at the frontier (≥ 90% pass@1 is common), still used as a smoke test |

## What it measures

Functional correctness of single-function Python programs. Given a function signature plus a natural-language docstring (and often one or two example I/O pairs in the docstring), the model must emit a body such that the function passes a hidden unit test suite.

HumanEval was the reference benchmark introduced alongside OpenAI's Codex paper. It deliberately avoids LeetCode-style difficulty: most problems are small, self-contained utilities (string manipulation, simple math, list ops). The contribution was the evaluation protocol — sampling `k` completions and reporting pass@k — not the difficulty.

## Task format

- **Input:** A Python function signature and docstring.
- **Output:** The function body (multiple continuations can be sampled).
- **Scoring:** `pass@k` — probability that at least one of `k` sampled completions passes all unit tests. `pass@1` is the standard headline number; `pass@10` and `pass@100` show sampling upside.
- **Splits:** single set of 164 problems; no train/test split.

## Example

```python
from typing import List

def has_close_elements(numbers: List[float], threshold: float) -> bool:
    """ Check if in given list of numbers, are any two numbers closer to
    each other than given threshold.
    >>> has_close_elements([1.0, 2.0, 3.0], 0.5)
    False
    >>> has_close_elements([1.0, 2.8, 3.0, 4.0, 5.0, 2.0], 0.3)
    True
    """
```

The model must produce a correct body for `has_close_elements`.

_Source: [github.com/openai/human-eval/blob/master/data/example_problem.jsonl](https://github.com/openai/human-eval)_

## Leaderboard (snapshot)

Entries require a sourced number. Reported numbers vary with sampling temperature and prompt style; cite the source harness.

Frontier anchors (HumanEval / HumanEval-Mul) — selected because the benchmark is saturated at the top. Newer entries go to the related LiveCodeBench / SWE-bench pages.

| Model | pass@1 | Variant | Source |
|-------|------:|---|---|
| DeepSeek-V3 | 82.6% | HumanEval-Mul chat | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| Claude 3.5 Sonnet | 81.7% | HumanEval-Mul chat (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| GPT-4o (0513) | 80.5% | HumanEval-Mul chat (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| Qwen2.5-72B | 77.3% | HumanEval-Mul chat (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| LLaMA-3.1-405B | 77.2% | HumanEval-Mul chat (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| DeepSeek-V3 | 65.2% | HumanEval base | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| LLaMA-3.1-405B | 54.9% | HumanEval base (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| Qwen2.5-72B | 53.0% | HumanEval base (DeepSeek-reported) | [huggingface.co/deepseek-ai/DeepSeek-V3](https://huggingface.co/deepseek-ai/DeepSeek-V3) |
| Codex-12B (original) | 28.8% | HumanEval base | [arXiv:2107.03374](https://arxiv.org/abs/2107.03374) |

_Saturated at the frontier. See [LiveCodeBench](LiveCodeBench.md) and [SWE-bench Verified](SWE-bench-Verified.md) for discriminative signal at the top._

## Critique & known issues

- **Saturated.** Frontier models exceed 90% pass@1; deltas between them are within noise.
- **Training-data contamination risk is high.** The dataset is public, on GitHub, and has been included in many pre-training corpora. Scores on held-out variants (e.g. [HumanEval+](https://github.com/evalplus/evalplus) with additional test cases) are meaningfully lower.
- **Narrow scope.** Single-function Python, no file-level context, no interaction with a real codebase — does not predict performance on repo-level tasks (see [SWE-bench Verified](SWE-bench-Verified.md)).
- **Prompt sensitivity.** Small format changes (docstring vs. comment, Markdown vs. plain) can shift scores several points.

## Related benchmarks

- [SWE-bench Verified](SWE-bench-Verified.md) — repo-level equivalent
- [LiveCodeBench](LiveCodeBench.md) — contamination-resistant coding benchmark
- MBPP — similar single-function benchmark, sometimes paired with HumanEval
- HumanEval+ / EvalPlus — hardened tests on the same 164 problems

## Update log

- 2026-04-15: Initial entry; seeded anchor scores (9 rows incl. DeepSeek-V3, Claude 3.5 Sonnet, GPT-4o, Qwen2.5-72B, LLaMA-3.1-405B, Codex-12B) from DeepSeek-V3 model card
