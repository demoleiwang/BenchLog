# Humanity's Last Exam (HLE)

> 2,500 expert-written questions across more than 100 academic subjects, built by CAIS and Scale AI specifically to be hard for frontier models — the highest-profile "reasoning ceiling" benchmark of 2025–2026.

|  |  |
|---|---|
| **Category** | reasoning / frontier-ceiling |
| **Released** | questions finalized 2025-04-03; Nature publication 2026-01-28 (Nature 649, 1139–1146) |
| **Paper / Publication** | [Nature article](https://www.nature.com/articles/s41586-025-XXXXX) via [lastexam.ai](https://lastexam.ai/) |
| **Project / Code** | [lastexam.ai](https://lastexam.ai/) |
| **Maintainer** | Center for AI Safety (CAIS) + Scale AI; ~1,000 subject experts from > 500 institutions across 50 countries |
| **Size** | 2,500 questions |
| **License** | questions released alongside eval infra; private test held out |
| **Status** | active; headline "frontier is still climbing" metric |

## What it measures

Expert-level reasoning and knowledge across the academic subject landscape. Questions are written by subject-area PhDs and deliberately selected to be unanswerable by then-frontier models; the benchmark was built expressly to replace saturated tests (MMLU, GPQA) as a reasoning ceiling.

Two headline metrics: **accuracy** (did you get it right) and **calibration error** (how well-calibrated the stated confidence is). The calibration metric is novel in this tier and penalises models that hallucinate with high confidence.

## Task format

- **Input:** short-answer / multiple-choice expert question.
- **Output:** answer + confidence (0–100%).
- **Scoring:** accuracy %; calibration error %.
- **Splits:** public set released with paper; private holdout maintained to detect overfitting.

## Example

HLE question stems are written by subject experts and span domains from Classics to Ecology to pure mathematics. Public samples are available via [lastexam.ai](https://lastexam.ai/).

_Source: [lastexam.ai](https://lastexam.ai/) — sample browser on the landing page._

## Leaderboard (snapshot)

Values from the project's own reporting (see [lastexam.ai](https://lastexam.ai/)). Scores below are point-in-time; HLE is actively re-scored as new frontier models appear.

| Model | Accuracy | Source |
|---|---:|---|
| Claude Mythos Preview (HLE w/ tools) | 64.7% | [red.anthropic.com/2026/mythos-preview](https://red.anthropic.com/2026/mythos-preview/) |
| DeepSeek V4-Pro Max (HLE w/ tools) | 48.2% | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| DeepSeek V4-Pro Max (HLE Pass@1, no tools) | 37.7% | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| GLM-5.1 Thinking (HLE w/ tools, DS-reported) | 50.4% | [huggingface.co/deepseek-ai/DeepSeek-V4-Pro](https://huggingface.co/deepseek-ai/DeepSeek-V4-Pro) |
| GPT-5.5 Pro (HLE w/ tools) | 57.2% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| Claude Opus 4.7 (HLE w/ tools, OpenAI-reported) | 54.7% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| Kimi K2.6 (HLE-Full w/ tools) | 54.0% | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Claude Opus 4.6 (max effort, HLE w/ tools, Kimi-reported) | 53.0% | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| GPT-5.5 (HLE w/ tools) | 52.2% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| GPT-5.4 (xhigh, HLE w/ tools, Kimi-reported) | 52.1% | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Gemini 3.1 Pro (thinking high, HLE w/ tools, Kimi-reported) | 51.4% | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Claude Opus 4.7 (HLE no tools, OpenAI-reported) | 46.9% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| Gemini 3.1 Pro (HLE no tools, OpenAI-reported) | 44.4% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| GPT-5.5 Pro (HLE no tools) | 43.1% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| GPT-5.5 (HLE no tools) | 41.4% | [openai.com/index/introducing-gpt-5-5](https://openai.com/index/introducing-gpt-5-5/) |
| Gemini 3.1 Pro (HLE-Full, Kimi-reported) | 44.4% | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Claude Opus 4.6 (HLE-Full, Kimi-reported) | 40.0% | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| GPT-5.4 (HLE-Full, Kimi-reported) | 39.8% | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Kimi K2.6 (HLE-Full) | 34.7% | [huggingface.co/moonshotai/Kimi-K2.6](https://huggingface.co/moonshotai/Kimi-K2.6) |
| Hy3-preview (HLE) | 30.0% | [huggingface.co/tencent/Hy3-preview](https://huggingface.co/tencent/Hy3-preview) |
| MiroThinker-1.7 (235B) | 42.9% (HLE-Text) | [huggingface.co/miromind-ai/MiroThinker-1.7](https://huggingface.co/miromind-ai/MiroThinker-1.7) |
| MiroThinker-v1.5-235B | 39.2% (HLE-Text) | [github.com/MiroMindAI/MiroThinker](https://github.com/MiroMindAI/MiroThinker) |
| Meta Muse Spark (Contemplating mode) | 58% | [ai.meta.com/blog/introducing-muse-spark-msl](https://ai.meta.com/blog/introducing-muse-spark-msl/) |
| Kimi K2.5 (w/ tools, HLE-Full) | 50.2% | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Qwen3.5-397B-A17B (HLE w/ tool) | 48.3% | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Gemini 3 Pro (HLE-Verified) | 48.0% | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| GPT-5.2 (HLE-Full w/ tools, Kimi-reported) | 45.5% | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Gemini 3 Pro (HLE-Full w/ tools, Kimi-reported) | 45.8% | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Claude 4.5 Opus (HLE-Full w/ tools, Kimi-reported) | 43.2% | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| MiroThinker-1.7 (235B) | 42.9% (HLE-Text) | [huggingface.co/miromind-ai/MiroThinker-1.7](https://huggingface.co/miromind-ai/MiroThinker-1.7) |
| DeepSeek V3.2 (HLE-Full w/ tools, text-only, Kimi-reported) | 40.8% | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| MiroThinker-v1.5-235B | 39.2% (HLE-Text) | [github.com/MiroMindAI/MiroThinker](https://github.com/MiroMindAI/MiroThinker) |
| Gemini 3 Pro | 38.3% | [lastexam.ai](https://lastexam.ai/) |
| MiroThinker-v1.0-72B | 37.7% (HLE-Text) | [github.com/MiroMindAI/MiroThinker](https://github.com/MiroMindAI/MiroThinker) |
| Qwen3.5-397B-A17B (base HLE) | 28.7% | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| MiroThinker-v1.0-72B | 37.7% (HLE-Text) | [github.com/MiroMindAI/MiroThinker](https://github.com/MiroMindAI/MiroThinker) |
| GPT-5 | 25.3% | [lastexam.ai](https://lastexam.ai/) |
| Grok 4 | 24.5% | [lastexam.ai](https://lastexam.ai/) |
| Claude 4.5 Sonnet | 13.7% | [lastexam.ai](https://lastexam.ai/) |
| GPT-4o | 2.7% | [lastexam.ai](https://lastexam.ai/) |

## Critique & known issues

- **Designed-to-be-hard ≠ skill distribution of real use.** HLE deliberately selects against current frontier; the skill distribution it samples is not representative of everyday LLM usage.
- **"Calibration" metric dependence on elicitation.** Confidence elicitation methods vary (self-reported vs. log-probs vs. verbalized); reported numbers are not always comparable.
- **Private test leak risk grows over time.** As many models submit for evaluation, the private test content leaks through response patterns. The maintainers rotate questions but the leak risk is real.
- **Subject mix is not uniform.** Coverage in some soft-science subjects is thinner; per-subject accuracy can swing a lot.
- **Contamination.** Questions were seeded by experts, but some overlap with textbooks / exam prep material is unavoidable.

## Related benchmarks

- [GPQA Diamond](GPQA-Diamond.md) — older reasoning-ceiling benchmark, now saturating
- [MMLU-Pro](../knowledge/MMLU-Pro.md) — domain-breadth, easier
- FrontierMath — math-only analog at research tier

## Update log

- 2026-04-15: Initial entry with reported scores from [lastexam.ai](https://lastexam.ai/)
- 2026-04-15 (session 1 extension): added 10 new rows — Meta Muse Spark (58%, Contemplating mode), Kimi K2.5 (HLE-Full w/ tools 50.2), Qwen3.5-397B (HLE w/ tool 48.3, base 28.7), Gemini 3 Pro (HLE-Verified 48.0), GPT-5.2 / Claude 4.5 Opus / DeepSeek V3.2 (all Kimi-reported), MiroThinker family (v1.0/1.5/1.7)
- 2026-04-24: added 17 rows from 4 fresh frontier releases — **Claude Mythos Preview 64.7% w/ tools (new SOTA)**, GPT-5.5 Pro w/tools 57.2% / no-tools 43.1%, GPT-5.5 w/tools 52.2% / no-tools 41.4%, Kimi K2.6 HLE-Full 34.7 / w/tools 54.0, Claude Opus 4.7 no-tools 46.9% / w/tools 54.7% (OpenAI-reported), plus Kimi K2.6-reported GPT-5.4 / Opus 4.6 / Gemini 3.1 Pro, and Hy3-preview 30.0%. Sources: red.anthropic.com/2026/mythos-preview, openai.com/introducing-gpt-5-5, Kimi K2.6 and Hy3-preview model cards.
- 2026-04-28: added 3 DeepSeek-reported rows — DeepSeek V4-Pro Max 37.7 (no tools) / 48.2 (w/ tools), GLM-5.1 Thinking 50.4 (w/ tools, DS-reported). Source: huggingface.co/deepseek-ai/DeepSeek-V4-Pro.
