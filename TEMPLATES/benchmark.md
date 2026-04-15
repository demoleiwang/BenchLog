# <Benchmark Name>

> One-sentence description — what it measures, in plain English.

|  |  |
|---|---|
| **Category** | coding / reasoning / agent / knowledge / multimodal / safety / long-context |
| **Released** | YYYY-MM |
| **Paper** | [arXiv:XXXX.XXXXX](https://arxiv.org/abs/XXXX.XXXXX) |
| **Project / Code** | [link](...) |
| **Maintainer** | Org / authors |
| **Size** | N tasks / items |
| **License** | ... |
| **Status** | active / saturated / deprecated / contested |

## What it measures

2–4 paragraphs. Describe the skill being tested, the gap in prior benchmarks this one fills, and why practitioners care. Be concrete — name the capabilities (e.g. "multi-hop reasoning over scientific text", not "reasoning").

## Task format

- **Input:** ...
- **Output:** ...
- **Scoring:** pass@1 / accuracy / F1 / LLM-as-judge / ...
- **Splits:** train / dev / test / held-out

## Example

A real task, copied verbatim from the paper or repo. Include input and expected output.

```
<concrete example here>
```

_Source: <link to where this example lives>_

## Leaderboard (snapshot)

Most recent first. Every row must have a source link. When a score is corrected, the old row stays (strikethrough) and a new row is appended below.

| Model | Score | Date | Source |
|-------|------:|------|--------|
|  |  | YYYY-MM-DD | [link]() |

## Critique & known issues

- Contamination risks (training data overlap)
- Saturation (has frontier hit the ceiling?)
- Label noise / ambiguity
- Gaming vectors (prompt hacks, format exploits)
- Scope limits (what this benchmark does NOT tell you)

## Related benchmarks

- [Sibling](../cat/Sibling.md) — how it compares

## Update log

- YYYY-MM-DD: Initial entry
