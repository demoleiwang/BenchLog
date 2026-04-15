# tests/

Validation suite for the markdown linter at [`.claude/hooks/lint-benchmark-entry.sh`](../.claude/hooks/lint-benchmark-entry.sh).

## Layout

```
tests/
├── README.md             this file
├── run-fixtures.sh       runs the linter against every fixture
└── fixtures/
    ├── good/             entries that MUST pass the linter (exit 0)
    └── bad/              entries that MUST fail the linter (exit 1)
```

## Usage

```bash
bash tests/run-fixtures.sh
```

Exit 0 if every fixture behaves as expected (good → pass, bad → fail). Exit 1 on any mismatch.

## Adding a new bad fixture

When the linter gains a new check, add a corresponding fixture in `fixtures/bad/` that demonstrates the violation. The filename should describe the violation (e.g. `NoSourceLink.md`, `PdfLink.md`, `MissingSection.md`).

## Adding a new check

1. Add the check to the linter.
2. Add a `bad/` fixture that the new check rejects.
3. Make sure the existing `good/ExampleBench.md` still passes (it represents a fully-conforming entry — update it if a new required field is introduced).
4. Run `tests/run-fixtures.sh` and confirm 0 failures.
