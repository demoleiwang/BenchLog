# Aider Polyglot

> **225 challenging Exercism coding exercises** across **C++, Go, Java, JavaScript, Python, Rust** — measures both raw coding ability AND ability to edit files / fix mistakes (the agent-style coding skill that pure pass@k benchmarks miss). Maintained by the Aider project; live leaderboard.

|  |  |
|---|---|
| **Category** | coding (multi-language, edit-aware) |
| **Released** | 2024 (initial); continuously refreshed |
| **Project** | [aider.chat/docs/leaderboards](https://aider.chat/docs/leaderboards/) · code [github.com/Aider-AI/aider](https://github.com/Aider-AI/aider) (`benchmark/` directory) |
| **Leaderboard** | [llm-stats.com/benchmarks/aider-polyglot](https://llm-stats.com/benchmarks/aider-polyglot) · also hosted by [Epoch AI](https://epoch.ai/benchmarks/aider-polyglot) |
| **Maintainer** | Paul Gauthier / Aider AI |
| **Size** | 225 Exercism exercises × 6 languages |
| **License** | Exercism task licenses + Aider repo |
| **Status** | active; frequently cited in coding-tool comparisons |

## What it measures

Two related skills with one benchmark:

1. **Code generation correctness** across 6 languages (Exercism's curated practice problems).
2. **Edit fidelity** — given a model-produced solution that fails tests, can the model produce a valid *patch* (not a complete rewrite) to fix it?

The "polyglot" framing matters: 6 languages reduces the Python-overfitting bias of HumanEval / BigCodeBench. The "edit" framing matters: real-world coding agents propose patches, not full files; the **Aider Polyglot Edit** leaderboard tests this directly.

## Task format

- **Input:** Exercism problem statement + starter code (per language).
- **Output:** working solution that passes Exercism's hidden tests.
- **Scoring:** percent of 225 problems solved correctly. Reported as overall **score** between 0–1.
- **Splits:** by language; "edit" leaderboard tests patch-style output specifically.

## Example

A representative item: an Exercism Rust exercise like *"Implement a parser for a tiny calculator language; given a token stream, evaluate to a number."* The model must produce idiomatic Rust, pass the test suite, and ideally fix any failures via diff-style edits rather than rewriting the file.

_Source: [aider.chat/docs/leaderboards](https://aider.chat/docs/leaderboards/)._

## Leaderboard (snapshot)

| Model | Aider Polyglot score | Note | Source |
|---|---:|---|---|
| GPT-5 | 0.880 | top, $$$ per run | [llm-stats.com/benchmarks/aider-polyglot](https://llm-stats.com/benchmarks/aider-polyglot) |
| DeepSeek V3.2-Exp | 0.742 | 22× cheaper than GPT-5 per run, ~$1.30 | [marc0.dev SWE-Bench leaderboard, March 2026](https://www.marc0.dev/en/leaderboard) |
| Average across 22 ranked models | 0.581 | — | [llm-stats.com/benchmarks/aider-polyglot](https://llm-stats.com/benchmarks/aider-polyglot) |

### Aider Polyglot Edit (separate leaderboard)

| Model | Edit score | Source |
|---|---:|---|
| DeepSeek-V3 | 0.797 | top | [llm-stats.com/benchmarks/aider-polyglot-edit](https://llm-stats.com/benchmarks/aider-polyglot-edit) |

_Aider's leaderboard is one of the few that reports per-run cost alongside scores, exposing performance-per-dollar — useful for production deployment decisions._

## Critique & known issues

- **Exercism contamination.** Exercises are public; many have crossed into pre-training data. Pure pass-rate must be interpreted with this in mind.
- **Edit format dependence.** "Edit" scoring depends on the diff format the model uses (Aider supports several); not all models output naturally in those formats.
- **Per-language imbalance.** 225 exercises across 6 languages = ~37 per language; per-language rankings noisy.
- **Aider as a vendor.** The benchmark is maintained by a coding-tool vendor whose own product uses these scores in marketing. Useful but not neutral.
- **Last-updated date matters.** The leaderboard updates discontinuously; quote the snapshot date.

## Related benchmarks

- [HumanEval](HumanEval.md) — older Python-only sibling
- [BigCodeBench](BigCodeBench.md) — function-call-heavy
- [SWE-bench Verified](SWE-bench-Verified.md) — repo-level patches
- [Multi-SWE-Bench](Multi-SWE-Bench.md) — multilingual SWE
- [LiveCodeBench](LiveCodeBench.md) — competition style, contamination-resistant

## Update log

- 2026-04-15: Initial entry; seeded with GPT-5 (0.880), DeepSeek V3.2-Exp (0.742), DeepSeek-V3 Edit (0.797), and dataset average (0.581)
