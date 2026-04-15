# BrowseComp

> 1,266 questions that require an agent to persistently navigate the web searching for hard-to-find, entangled information — OpenAI's answer to the question "can a browsing agent actually find something buried".

|  |  |
|---|---|
| **Category** | agent / web search / information retrieval |
| **Released** | 2025-04-16 (arXiv submission) |
| **Paper** | [arXiv:2504.12516](https://arxiv.org/abs/2504.12516) |
| **Project / Code** | paper linked from [openai.com/index/browsecomp](https://openai.com/index/browsecomp/) |
| **Maintainer** | OpenAI (Jason Wei, Zhiqing Sun, and colleagues) |
| **Size** | 1,266 questions |
| **License** | _unknown_ |
| **Status** | active; core benchmark in OpenAI's Deep Research launches |

## What it measures

Whether a browsing agent exercises *persistence* and *creativity* when finding information on the open web. Questions are designed such that the answer is short and easily verifiable once you have it — but finding it requires chasing references, cross-linking sources, and filtering noise.

The authors explicitly frame the benchmark as analogous to programming-competition benchmarks: it is "incomplete but useful". It skips open-ended generation and ambiguity in favour of a hard, objectively-gradable information-retrieval core.

## Task format

- **Input:** a natural-language question whose answer is a short factual string.
- **Output:** a short factual answer, verified against a reference.
- **Scoring:** exact-match (or close-match) accuracy against the reference answer.
- **Splits:** a single 1,266-question set.

## Example

The paper illustrates BrowseComp with questions whose answers are short (a name, number, or phrase) but whose search trajectories require crossing multiple sites, disambiguating homonyms, or piecing together partial matches from several sources.

_Source: [arXiv:2504.12516](https://arxiv.org/abs/2504.12516)._

## Leaderboard (snapshot)

### BrowseComp (English, 1,266 questions)

| Model / Agent | Accuracy | Source-reported-by / note | Source |
|---|---:|---|---|
| Kimi K2.5 (Agent Swarm scaffold) | 78.4% | self-reported, 2026-01-29 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Qwen3.5-397B-A17B | 78.6% | self-reported, 2026-02 | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Kimi K2.5 (with context management) | 74.9% | self-reported, 2026-01-29 | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| MiroThinker-1.7 (235B, Qwen3-thinking fine-tune) | 74.0% | own release, 2026-04 | [huggingface.co/miromind-ai/MiroThinker-1.7](https://huggingface.co/miromind-ai/MiroThinker-1.7) |
| MiroThinker-v1.5-235B | 69.8% | own release, 2026-03 | [github.com/MiroMindAI/MiroThinker](https://github.com/MiroMindAI/MiroThinker) |
| Qwen3.5's GPT-5.2 (Qwen-reported) | 65.8% | Qwen3.5 card | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| GPT-5.2 (Kimi-reported, no scaffold) | 65.8% | Kimi K2.5 card | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Kimi K2.5 (no scaffold) | 60.6% | self-reported | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Qwen3.5's Gemini 3 Pro (Qwen-reported) | 59.2% | Qwen3.5 card | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| GPT-5 (thinking) | 54.9% | MiniMax-M2 card, 2025-10 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| DeepSeek V3.2 (Kimi-reported) | 51.4% | Kimi K2.5 card | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| MiroThinker-v1.0-72B | 47.1% | own release, 2026-01 | [github.com/MiroMindAI/MiroThinker](https://github.com/MiroMindAI/MiroThinker) |
| MiniMax-M2 | 44% | own card, 2025-10 | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Gemini 3 Pro (Kimi-reported, no scaffold) | 37.8% | Kimi K2.5 card | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Claude 4.5 Opus (Kimi-reported, no scaffold) | 37.0% | Kimi K2.5 card | [huggingface.co/moonshotai/Kimi-K2.5](https://huggingface.co/moonshotai/Kimi-K2.5) |
| Claude Sonnet 4.5 | 19.6% | MiniMax-M2 card | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Claude Sonnet 4 | 12.2% | MiniMax-M2 card | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |
| Gemini 2.5 Pro | 9.9% | MiniMax-M2 card | [huggingface.co/MiniMaxAI/MiniMax-M2](https://huggingface.co/MiniMaxAI/MiniMax-M2) |

### BrowseComp-ZH (Chinese companion set — sibling benchmark, cited together)

| Model / Agent | Accuracy | Source |
|---|---:|---|
| GPT-5.2 (Qwen-reported) | 76.1% | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| MiroThinker-1.7 (235B) | 75.3% | [huggingface.co/miromind-ai/MiroThinker-1.7](https://huggingface.co/miromind-ai/MiroThinker-1.7) |
| MiroThinker-v1.5-235B | 71.5% | [github.com/MiroMindAI/MiroThinker](https://github.com/MiroMindAI/MiroThinker) |
| Qwen3.5-397B-A17B | 70.3% | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Gemini 3 Pro (Qwen-reported) | 66.8% | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| Claude 4.5 Opus (Qwen-reported) | 62.4% | [huggingface.co/Qwen/Qwen3.5-397B-A17B](https://huggingface.co/Qwen/Qwen3.5-397B-A17B) |
| MiroThinker-v1.0-72B | 55.6% | [github.com/MiroMindAI/MiroThinker](https://github.com/MiroMindAI/MiroThinker) |

_MiroThinker-1.7 is currently SOTA among open-source on BrowseComp-ZH per its own release notes. The model is a Qwen3-235B-A22B-Thinking-2507 fine-tune released by MiroMind in April 2026. Paper: [arXiv:2603.15726](https://arxiv.org/abs/2603.15726) — "MiroThinker-1.7 & H1: Towards Heavy-Duty Research Agents via Verification"._

_The ~5× gap between deep-research agents (MiroThinker, GPT-5 thinking, MiniMax-M2) and chat-tuned frontier models (Claude / Gemini without research scaffolds) reflects BrowseComp's bias toward persistent multi-hop browsing. Base-model scores without browsing scaffolds collapse toward zero._

## Critique & known issues

- **Short-answer scoring is brittle.** Correct answers phrased differently may fail exact-match; evaluators use heuristics that vary by report.
- **Web drift.** As the web changes, questions can become unanswerable (source removed) or trivial (answer now in a snippet). Reproducibility has a best-before date.
- **Search-engine dependence.** Agents relying on Google vs. Bing vs. custom search see different retrieval distributions; numbers quoted without naming the search stack are suspect.
- **Answer-verifiability filter biases the sample.** Questions where "what is the answer" is unambiguous are easier to grade but over-represent factoid-style retrieval.
- **Deep-Research framing.** Benchmark was seeded with tasks that highlight multi-source chasing — its results align with that specific agent archetype; less so with short-turn assistants.

## Related benchmarks

- [GAIA](GAIA.md) — shorter tool-use chains, broader modality
- [WebArena](WebArena.md) — interaction-heavy, not retrieval-heavy
- Mind2Web — broader site coverage
- SimpleQA — OpenAI's simpler factoid sibling

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with 5 rows (GPT-5, MiniMax-M2, Claude 4/4.5, Gemini 2.5 Pro) from MiniMax-M2 model card; later same day added MiroThinker family (1.7 = 74.0%, v1.5 = 69.8%, v1.0 = 47.1%) and BrowseComp-ZH companion table from MiroMind AI's GitHub README and HF card
- 2026-04-15 (session 1 extension): added frontier scaffold-aware rows from Kimi K2.5 and Qwen3.5 cards. **Kimi K2.5 Agent Swarm 78.4%** is current public OSS SOTA; Qwen3.5 at 78.6%. New rows expose scaffold sensitivity: Kimi K2.5 goes 60.6% no-scaffold → 74.9% w/ context mgmt → 78.4% Agent Swarm. Claude 4.5 Opus no-scaffold at 37.0% vs 62.4% self-reported (Qwen-reported) shows same effect. User reported MiroThinker near-90% and GPT-5.4 Pro 89+; neither verifiable from public sources as of this session — flagged in STATUS.md.
