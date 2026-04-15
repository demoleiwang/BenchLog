#!/usr/bin/env bash
# lint-benchmark-entry.sh — validate BenchLog markdown files.
#
# Usage:
#   .claude/hooks/lint-benchmark-entry.sh                       # lint all benchmark + digest files
#   .claude/hooks/lint-benchmark-entry.sh path/to/entry.md ...  # lint specific files
#
# Exit codes:
#   0 — no errors (warnings allowed)
#   1 — at least one error
#
# Errors (blocking):
#   - benchmark entry missing a required section
#   - leaderboard data row without a markdown link in the Source column
#   - any link to a local *.pdf
#   - edit to a digest file dated before today (digests are immutable)
#
# Warnings (non-blocking, printed):
#   - internal markdown link target not found on disk
#   - more than 3 _unknown_ markers in a single file
#
# This script is invoked automatically by the PostToolUse hook in
# .claude/settings.json after Write/Edit operations on benchmark or
# digest files. It can also be run by hand for ad-hoc audits.

set -u

REPO_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$REPO_ROOT"

errors=0
warnings=0
today="$(date +%Y-%m-%d)"

REQUIRED_SECTIONS=(
  "## What it measures"
  "## Task format"
  "## Example"
  "## Leaderboard (snapshot)"
  "## Critique & known issues"
  "## Update log"
)

err()  { echo "ERROR   $1: $2" >&2; errors=$((errors+1)); }
warn() { echo "warning $1: $2" >&2; warnings=$((warnings+1)); }

# ---------- collect file list ----------
if [[ $# -gt 0 ]]; then
  files=("$@")
else
  files=()
  while IFS= read -r f; do files+=("$f"); done < <(
    find benchmarks digests -type f -name "*.md" 2>/dev/null
  )
fi

# ---------- per-file checks ----------
if [[ ${#files[@]:-0} -eq 0 ]]; then
  echo "lint summary: 0 error(s), 0 warning(s) across 0 file(s)"
  exit 0
fi

for f in "${files[@]}"; do
  [[ -f "$f" ]] || { err "$f" "file not found"; continue; }

  # Skip TEMPLATES — they intentionally contain placeholders
  [[ "$f" == TEMPLATES/* ]] && continue
  case "$f" in TEMPLATES/*) continue;; esac

  is_benchmark=false
  is_digest=false
  case "$f" in
    benchmarks/*/*.md)        is_benchmark=true ;;
    tests/fixtures/*/*.md)    is_benchmark=true ;;
    */benchmarks/*/*.md)      is_benchmark=true ;;
    */tests/fixtures/*/*.md)  is_benchmark=true ;;
    digests/*.md)             is_digest=true ;;
    */digests/*.md)           is_digest=true ;;
  esac

  # Check 1: required sections in benchmark entries
  if $is_benchmark; then
    for sec in "${REQUIRED_SECTIONS[@]}"; do
      if ! grep -qF "$sec" "$f"; then
        err "$f" "missing required section: $sec"
      fi
    done
  fi

  # Check 2: leaderboard rows have a source link.
  # A leaderboard data row looks like: | Model | 87.3 | 2026-04-15 | [name](url) |
  # We extract the leaderboard block, drop header / separator / placeholder rows,
  # then require each remaining row to contain a markdown link [text](url).
  if $is_benchmark; then
    while IFS= read -r line; do
      # Skip header row.
      case "$line" in "| Model"*|"|Model"*) continue;; esac
      # Skip separator row (only |, -, :, spaces).
      stripped_sep="$(printf '%s' "$line" | tr -d '|:- ')"
      [[ -z "$stripped_sep" ]] && continue
      # Skip empty placeholder row (cells contain only whitespace).
      stripped_all="$(printf '%s' "$line" | tr -d '| ')"
      [[ -z "$stripped_all" ]] && continue
      # Real row: must contain a markdown link.
      if ! printf '%s' "$line" | grep -qE '\[[^]]+\]\([^)]+\)'; then
        err "$f" "leaderboard row without source link: $(printf '%s' "$line" | tr -s ' ')"
      fi
    done < <(awk '
      /^## +Leaderboard/ { inlb=1; next }
      inlb && /^## / { inlb=0 }
      inlb && /^\|/   { print }
    ' "$f")
  fi

  # Check 3: no links to local PDFs
  if grep -nE '\[[^]]+\]\([^)]*\.pdf\)' "$f" | grep -vE '\(https?://' >/dev/null; then
    while IFS= read -r hit; do
      err "$f" "link to local PDF (rule: no PDFs): $hit"
    done < <(grep -nE '\[[^]]+\]\([^)]*\.pdf\)' "$f" | grep -vE '\(https?://')
  fi

  # Check 4: digests older than today must not be modified
  if $is_digest; then
    digest_date="$(basename "$f" .md)"
    if [[ "$digest_date" < "$today" ]]; then
      # Use git to detect modification; if file is staged or has unstaged changes -> error.
      if git diff --quiet -- "$f" 2>/dev/null && git diff --cached --quiet -- "$f" 2>/dev/null; then
        :  # clean
      else
        err "$f" "past digest modified (rule: past digests are immutable)"
      fi
    fi
  fi

  # Check 5 (warn): internal markdown links resolve on disk
  while IFS= read -r mlink; do
    target="$(echo "$mlink" | sed -E 's/.*\(([^)#]+)(#[^)]*)?\).*/\1/')"
    [[ -z "$target" ]] && continue
    [[ "$target" =~ ^https?:// ]] && continue
    [[ "$target" =~ ^mailto: ]] && continue
    # Resolve relative to file's directory.
    dir="$(dirname "$f")"
    abs="$dir/$target"
    if [[ ! -e "$abs" ]]; then
      warn "$f" "internal link target missing: $target"
    fi
  done < <(grep -oE '\[[^]]+\]\(([^)]+)\)' "$f" || true)

  # Check 6 (warn): too many _unknown_ markers
  unk_count="$(grep -c '_unknown_' "$f" 2>/dev/null || echo 0)"
  unk_count="${unk_count//[^0-9]/}"
  : "${unk_count:=0}"
  if (( unk_count > 3 )); then
    warn "$f" "$unk_count _unknown_ markers — consider digging deeper"
  fi
done

file_count=${#files[@]:-0}
echo "lint summary: $errors error(s), $warnings warning(s) across ${file_count} file(s)"
exit $(( errors > 0 ? 1 : 0 ))
