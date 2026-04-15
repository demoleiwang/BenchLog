# GDPval

> 220 real-world knowledge-worker tasks across 44 occupations, rubric-graded against deliverables produced by human professionals — OpenAI's benchmark for "economically valuable" work.

|  |  |
|---|---|
| **Category** | agent / economic value / knowledge work |
| **Released** | 2025-09 (OpenAI blog + dataset release) |
| **Paper** | "GDPval: Evaluating AI Model Performance on Real-World Economically Valuable Tasks" — linked from [openai.com/index/gdpval](https://openai.com/index/gdpval/) |
| **Project / Code** | dataset: [huggingface.co/datasets/openai/gdpval](https://huggingface.co/datasets/openai/gdpval); eval site: [evals.openai.com](https://evals.openai.com) |
| **Maintainer** | OpenAI |
| **Size** | 220 tasks across 44 occupations |
| **License** | _unknown_ |
| **Status** | active; new headline benchmark for "is the model actually useful for work?" |

## What it measures

Whether a model can produce deliverables that match what a professional in a specific occupation would produce for a real workplace task. Occupations span accounting, auditing, tax preparation, administrative services management, and 40 others across the professional, scientific, technical services, and government sectors.

The framing is deliberately economic: tasks are weighted and selected to correspond to actual paid knowledge work, not synthetic exam questions. GDPval is meant to complement pure-capability benchmarks (GPQA, HLE) with an explicit "is this productive?" axis.

## Task format

- **Input:** a text prompt (617–6,620 characters per the dataset card) plus 0–17 reference files per task.
- **Output:** 0–6 deliverable files matching the task description.
- **Scoring:** rubric-based, with multiple criteria per task. Criteria carry point values (e.g. +1 / +2 / +3), pass/fail tags, and a required-vs-optional marker.
- **Splits:** single 220-row set per the dataset card.

## Example

An accountant task (illustrative, reconstructed from the dataset description):

> "Review the attached general-ledger export and expense-policy PDF. Produce a reconciliation spreadsheet that (a) categorises every transaction, (b) flags policy exceptions, and (c) writes a one-page memo summarising material discrepancies for management review."

The model must emit the spreadsheet and the memo; the rubric scores categorisation completeness, exception detection, and memo quality.

_Source: [huggingface.co/datasets/openai/gdpval](https://huggingface.co/datasets/openai/gdpval) — dataset card and sample rows._

## Leaderboard (snapshot)

| Model | Score | Date | Source |
|---|---:|---|---|
| _seed pending_ | _unknown_ | _unknown_ | [openai.com/index/gdpval](https://openai.com/index/gdpval/) |

_OpenAI's launch post includes frontier-model comparisons; seed with source-linked rows when pulling from the blog's tables._

## Critique & known issues

- **Occupation coverage is sparse.** 44 occupations is a start but leaves most of the labour market uncovered (healthcare delivery, trades, logistics, education, R&D).
- **Rubric subjectivity.** Rubric-based grading relies on consistent grader calibration; between-grader variance is not widely reported.
- **US-centric.** Tasks reflect US professional conventions (tax codes, accounting standards, admin workflows); non-US applicability is unclear.
- **Deliverable file formats.** Grading excel/docx outputs involves format-specific checks that can be gamed by format-perfect but content-weak output.
- **Released by a vendor.** The benchmark was built and curated by OpenAI, which also competes on its leaderboard. Third-party replications are valuable.

## Related benchmarks

- [SWE-Lancer](SWE-Lancer.md) — freelance *software* analog
- [HLE](../reasoning/HLE.md) — expert-knowledge, not deliverable-focused
- [MLE-Bench](MLE-Bench.md) — narrower to ML-engineering workflows

## Update log

- 2026-04-15: Initial entry
