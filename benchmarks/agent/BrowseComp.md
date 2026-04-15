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

| Model / Agent | Accuracy | Date | Source |
|---|---:|---|---|
| _seed pending_ | _unknown_ | _unknown_ | [openai.com/index/browsecomp](https://openai.com/index/browsecomp/) |

_OpenAI's own Deep Research agent is the headline-reporting system here; add source-linked rows when seeding from the BrowseComp paper tables and from subsequent reports._

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

- 2026-04-15: Initial entry
