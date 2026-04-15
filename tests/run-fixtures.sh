#!/usr/bin/env bash
# run-fixtures.sh — exercise the linter against good/bad fixtures.
#
# - Each file in tests/fixtures/good/  MUST pass the linter (exit 0).
# - Each file in tests/fixtures/bad/   MUST fail the linter (exit 1).
#
# Exit 0 on full success; exit 1 if any fixture behaves wrong.

set -u

REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
LINTER="$REPO_ROOT/.claude/hooks/lint-benchmark-entry.sh"
GOOD_DIR="$REPO_ROOT/tests/fixtures/good"
BAD_DIR="$REPO_ROOT/tests/fixtures/bad"

pass=0
fail=0

run_case() {
  local file="$1"
  local expected="$2"  # "pass" or "fail"
  local out
  out="$("$LINTER" "$file" 2>&1)"
  local rc=$?
  if [[ "$expected" == "pass" && $rc -eq 0 ]]; then
    echo "OK    pass-expected: $file"
    pass=$((pass+1))
  elif [[ "$expected" == "fail" && $rc -ne 0 ]]; then
    echo "OK    fail-expected: $file"
    pass=$((pass+1))
  else
    echo "FAIL  $expected-expected: $file (rc=$rc)"
    echo "$out" | sed 's/^/        /'
    fail=$((fail+1))
  fi
}

for f in "$GOOD_DIR"/*.md; do
  [[ -e "$f" ]] || continue
  run_case "$f" "pass"
done

for f in "$BAD_DIR"/*.md; do
  [[ -e "$f" ]] || continue
  run_case "$f" "fail"
done

echo
echo "fixture results: $pass passed, $fail failed"
exit $(( fail > 0 ? 1 : 0 ))
