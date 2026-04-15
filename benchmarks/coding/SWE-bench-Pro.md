# SWE-bench Pro

> A harder successor to SWE-bench Verified: 1,865 enterprise-grade, long-horizon coding tasks across 41 repositories (including commercial partnerships), where even GPT-5 reaches only 23.3% pass@1.

|  |  |
|---|---|
| **Category** | coding (enterprise, long-horizon) |
| **Released** | 2025-09-19 |
| **Paper / Project** | [labs.scale.com/papers/swe-bench-pro](https://labs.scale.com/papers/swe-bench-pro) |
| **Maintainer** | Scale Labs |
| **Size** | 1,865 problems across 41 repositories |
| **Tiers** | public (11 repos, open), held-out (12 repos, private), commercial (18 repos, partnership-only) |
| **License** | _unknown_ (public tier open; commercial tier partner-gated) |
| **Status** | active; the hardest published SWE-agent benchmark as of late 2025 |

## What it measures

Whether a coding agent can complete enterprise-realistic software tasks — "long-horizon" problems that a professional engineer might spend hours to days on, often requiring patches across multiple files and substantial modifications. Explicitly positioned as "beyond the scope of SWE-bench [Verified]".

The three-tier structure is novel: a public tier for reproducible research, a held-out tier to guard against leaderboard overfitting, and a commercial tier sourced from proprietary codebases under formal partnership agreements. The commercial tier is the most differentiating: unlike every earlier SWE benchmark, training data is guaranteed not to include these repos.

## Task format

- **Input:** repo state at a specific commit + a long-form task description (often multi-file, with ambiguity).
- **Output:** a patch that, when applied, makes the hidden test suite pass.
- **Scoring:** pass@1 — single-attempt success rate on the target tests, with no prior test failures regressing.
- **Splits:** three tiers (public / held-out / commercial); scores are commonly reported for the public tier.

## Example

SWE-bench Pro does not publish task stems verbatim (commercial tier is private). The public tier's difficulty profile is anchored by tasks "that may require hours to days for a professional software engineer to complete, often involving patches across multiple files."

_Source: [labs.scale.com/papers/swe-bench-pro](https://labs.scale.com/papers/swe-bench-pro)._

## Leaderboard (snapshot)

| Model | pass@1 | Tier / note | Source |
|---|---:|---|---|
| GPT-5 | 23.3% | top-scoring at launch | [labs.scale.com/papers/swe-bench-pro](https://labs.scale.com/papers/swe-bench-pro) |
| GLM-4.5 | 9.67 | as reported in GLM-4.6 card | [huggingface.co/zai-org/GLM-4.6](https://huggingface.co/zai-org/GLM-4.6) |

_Scale Labs' launch write-up notes that "widely used coding models generally score below 25%." This is ~3× harder than SWE-bench Verified where frontier models cluster 70–82%._

## Critique & known issues

- **Commercial-tier opacity.** Scores on the commercial tier are not reproducible by third parties; quoted numbers depend on Scale Labs to mediate.
- **Low absolute scores make noise visible.** With scores in the 10–25% range, a few lucky task successes swing the rate materially.
- **Hours-to-days tasks stretch agent horizons.** Token / time budgets vary by harness; a compute-constrained evaluation under-reports what a model *could* do given more steps.
- **Language mix and stack mix.** Tier-specific repo composition is not fully disclosed; if it skews to a few languages, cross-language generalisation claims are weak.
- **Contamination.** Held-out and commercial tiers were designed to resist leakage; public tier is still crawlable over time.

## Related benchmarks

- [SWE-bench Verified](SWE-bench-Verified.md) — direct predecessor, now the less-hard baseline
- [SWE-Lancer](../agent/SWE-Lancer.md) — freelance software tasks, dollar-weighted
- [Terminal-Bench](../agent/Terminal-Bench.md) — broader-than-SWE terminal work
- Multi-SWE-Bench — multilingual SWE extension (mentioned in MiniMax-M2 card at 36.2%)

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with GPT-5 (23.3%) from Scale Labs launch, GLM-4.5 (9.67) from GLM-4.6 model card
