# ExampleBench

> A toy benchmark used as a fixture to validate the linter.

|  |  |
|---|---|
| **Category** | reasoning |
| **Released** | 2026-01 |
| **Paper** | [arXiv:2601.00000](https://arxiv.org/abs/2601.00000) |
| **Project / Code** | [github.com/example/example-bench](https://github.com/example/example-bench) |
| **Maintainer** | Example Lab |
| **Size** | 100 tasks |
| **License** | MIT |
| **Status** | active |

## What it measures

ExampleBench is a synthetic benchmark for linter testing. It does not measure anything real. Its only purpose is to exercise the schema validator with a complete, well-formed entry.

## Task format

- **Input:** a string
- **Output:** another string
- **Scoring:** exact match
- **Splits:** test only

## Example

```
input: "hello"
output: "world"
```

_Source: [fixture readme](https://example.com/fixture)_

## Leaderboard (snapshot)

| Model | Score | Date | Source |
|-------|------:|------|--------|
| Claude Opus 4.6 | 99.0 | 2026-04-15 | [example.com/result](https://example.com/result) |

## Critique & known issues

- Synthetic benchmark — no external validity.
- Used only for fixture testing.

## Related benchmarks

- _none_

## Update log

- 2026-04-15: Initial fixture
