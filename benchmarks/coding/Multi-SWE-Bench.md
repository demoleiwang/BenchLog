# Multi-SWE-Bench

> ByteDance-Seed's multilingual answer to SWE-bench — **1,632 issues across 7 languages** (Java, TS, JS, Go, Rust, C, C++) annotated by 68 expert engineers. Fills the "SWE-bench is Python-only" gap.

|  |  |
|---|---|
| **Category** | coding (multilingual, repo-level, agent-style) |
| **Released** | 2025-04 |
| **Paper** | [arXiv:2504.02605](https://arxiv.org/abs/2504.02605) |
| **Project / Code** | [github.com/multi-swe-bench/multi-swe-bench](https://github.com/multi-swe-bench/multi-swe-bench) · dataset [huggingface.co/datasets/ByteDance-Seed/Multi-SWE-bench](https://huggingface.co/datasets/ByteDance-Seed/Multi-SWE-bench) |
| **Maintainer** | ByteDance-Seed |
| **Size** | 1,632 issues across 7 languages |
| **License** | per GitHub |
| **Status** | active; a reference multilingual coding benchmark |

## What it measures

Whether an LLM or coding agent can resolve real GitHub issues in **non-Python** codebases. Existing benchmarks (SWE-bench, SWE-bench Verified) are Python-only, biasing the community's view of coding capability toward Python library maintenance.

Multi-SWE-Bench covers Java, TypeScript, JavaScript, Go, Rust, C, and C++. It's a **multilingual generalisation** of SWE-bench: same task framing (repo + issue → patch → hidden test suite), different languages.

## Task format

- **Input:** issue text + full repository state at a specific commit.
- **Output:** a unified diff patch.
- **Scoring:** % Resolved — the patch is applied, the repo's test suite runs, the targeted tests must pass and previously-passing tests must not regress.
- **Splits:** 1,632 total, broken down by language; per-language results are commonly reported.

## Example

Representative issue (paraphrased from the benchmark's language coverage): *"[Rust repo] Segfault when calling `.into_iter()` on an empty `Vec<T>` where T has a Drop impl. Fix the drop semantics; existing tests in `tests/vec/drop.rs` should still pass, plus add a new test reproducing the segfault."*

_Source: [github.com/multi-swe-bench/multi-swe-bench](https://github.com/multi-swe-bench/multi-swe-bench) — sample tasks by language._

## Leaderboard (snapshot)

| Model | % Resolved | Note | Source |
|---|---:|---|---|
| Claude 4.5 Opus (Qwen-reported) | 77.5 | SWE-bench Multilingual | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| GPT-5.2 (Qwen-reported) | 72.0 | SWE-bench Multilingual | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Qwen3.5-397B-A17B | 69.3 | SWE-bench Multilingual | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Gemini 3 Pro (Qwen-reported) | 65.0 | SWE-bench Multilingual | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Kimi K2 (agentic, single attempt) | 47.3 | SWE-bench Multilingual | [huggingface.co/moonshotai/Kimi-K2-Instruct](https://huggingface.co/moonshotai/Kimi-K2-Instruct) |
| Kimi K2.5 | 47.3 | SWE-bench Multilingual | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| MiniMax-M2 | 36.2 | Multi-SWE-Bench | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |

_Note: "SWE-bench Multilingual" (used by Kimi / Qwen) and "Multi-SWE-Bench" (the ByteDance-Seed benchmark) are closely related — some reports use the names interchangeably. When provenance is ambiguous, cite the lab's naming. SWE-bench Multilingual is also maintained by the SWE-bench team at [swebench.com/multilingual](https://www.swebench.com/multilingual.html)._

## Critique & known issues

- **Language mix can hide strong monolingual models.** A Rust-specialist model may look weaker overall than a JS-generalist; per-language breakdown is essential.
- **Test suite quality varies by language.** Some ecosystems have tighter test harnesses than others; comparing pass rates across languages is not directly meaningful.
- **Dockerized environments are heavyweight.** Re-running the benchmark requires substantial infra; smaller teams often cite without re-running.
- **Naming confusion.** Multi-SWE-Bench (ByteDance) vs. SWE-bench Multilingual (Princeton/SWE-bench team) — check which is cited.
- **Repo selection bias.** High-star, well-maintained repos are over-represented. Niche / internal codebases are unrepresented.

## Related benchmarks

- [SWE-bench Verified](SWE-bench-Verified.md) — Python-only predecessor, direct ancestor
- [SWE-bench Pro](SWE-bench-Pro.md) — Scale Labs' harder enterprise-oriented sibling
- [SWE-Lancer](../agent/SWE-Lancer.md) — freelance software tasks

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 7 rows from Kimi K2 / K2.5, Qwen3.5, and MiniMax-M2 cards
