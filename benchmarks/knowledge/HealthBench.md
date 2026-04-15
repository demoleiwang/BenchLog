# HealthBench

> OpenAI's medical evaluation benchmark — **5,000 multi-turn conversations** between models and patients/clinicians, graded by **48,562 unique rubric criteria** authored by **262 physicians from 60 countries**. GPT-4o = 32%, o3 = 60%; GPT-4.1 nano beats GPT-4o at 25× lower cost.

|  |  |
|---|---|
| **Category** | knowledge / medical |
| **Released** | 2025-05 |
| **Paper** | [arXiv:2505.08775](https://arxiv.org/abs/2505.08775) |
| **Project** | [openai.com/index/healthbench](https://openai.com/index/healthbench/) (note: page may 403 to WebFetch) |
| **Maintainer** | OpenAI |
| **Size** | 5,000 conversations; 48,562 rubric criteria; 262 physicians from 60 countries |
| **License** | open-source |
| **Status** | active; cited in [GPT-5.4 Thinking system card](https://deploymentsafety.openai.com/gpt-5-4-thinking) and broader frontier model launches |

## What it measures

Performance and **safety** of LLMs in healthcare settings. Each task is a **multi-turn conversation** where the model is judged not on a single answer but on the entire interaction quality, evaluated against rubrics that specify what a good physician response would include.

This is fundamentally different from earlier medical benchmarks (MedQA, USMLE multiple-choice) which test exam-style knowledge in isolation. HealthBench tests behaviour: accuracy, instruction-following, communication tone, refusal calibration, response to ambiguous symptoms.

The rubric design is the contribution:
- **48,562 rubric criteria** — far beyond a typical MCQ benchmark
- Built by **262 physicians** practising in **60 countries** for cultural / regional coverage
- Conversation-specific rubrics (rather than a single global rubric) — each conversation has tailored grading criteria

## Task format

- **Input:** a conversation prompt (single user message + optional context); model must respond and continue the conversation.
- **Output:** complete model responses across multi-turn dialogue.
- **Scoring:** per-conversation rubric grading; multiple criteria evaluated. Categories include emergencies, transforming clinical data, global health, plus behavioral dimensions (accuracy, instruction following, communication).
- **Splits:** by health context and by behavioral dimension.

## Example

A representative conversation (paraphrased): *"Patient: I've had this rash on my arm for 5 days, it's getting worse and starting to spread. I tried hydrocortisone cream but no help. Should I go to the ER?"* The model must respond with appropriate triage guidance, clarify what would warrant urgent care, avoid over- or under-recommending ER, and follow physician communication norms. The rubric for this conversation might include: "did the response correctly identify warning signs?", "did the response avoid prescribing specific medication?", "did the response account for patient anxiety?", etc.

_Source: [arXiv:2505.08775](https://arxiv.org/abs/2505.08775) (paper) — the official [OpenAI launch page](https://openai.com/index/healthbench/) is the canonical reference._

## Leaderboard (snapshot)

| Model | Score | Note | Source |
|---|---:|---|---|
| o3 | 60% | OpenAI launch | [arXiv:2505.08775](https://arxiv.org/abs/2505.08775) |
| GPT-5.4 Thinking | 62.6% | system card 2026-03 | [deploymentsafety.openai.com/gpt-5-4-thinking](https://deploymentsafety.openai.com/gpt-5-4-thinking) |
| GPT-4o | 32% | launch baseline | [arXiv:2505.08775](https://arxiv.org/abs/2505.08775) |
| GPT-3.5 Turbo | 16% | historical baseline | [arXiv:2505.08775](https://arxiv.org/abs/2505.08775) |
| GPT-4.1 nano | > GPT-4o, 25× cheaper | small-model highlight | [arXiv:2505.08775](https://arxiv.org/abs/2505.08775) |

_Per-context breakdowns (emergencies, global health, etc.) are reported separately in the paper. Add source-linked rows from non-OpenAI models when published._

## Critique & known issues

- **OpenAI-built** — they also publish models on the leaderboard. Independent labs running HealthBench is a positive signal of trust; until then, treat as informative-but-not-neutral.
- **Rubric subjectivity** — even with 262 physicians, conversation-specific rubric grading involves judgement. Inter-rater reliability not fully published.
- **Not clinically deployable.** The paper and follow-ups explicitly note HealthBench measures progress, not deployment readiness. PMC review (2025) highlights gaps.
- **Coverage uneven.** 60 countries is broad, but rubric weight by region is not transparent.
- **Multi-turn evaluation is expensive.** Reproducing the full 5K-conversation eval is a significant cost.
- **English-dominant.** Despite 60-country coverage, the conversations are predominantly English.

## Related benchmarks

- MedQA (USMLE) — older multiple-choice medical knowledge benchmark
- ProtocolQA Open-Ended — biology protocols, in GPT-5.4 system card
- TroubleshootingBench — biology troubleshooting
- Multi-select Virology — virology knowledge

## Update log

- 2026-04-15: Initial entry; seeded leaderboard with paper baselines + GPT-5.4 Thinking 62.6% from system card
