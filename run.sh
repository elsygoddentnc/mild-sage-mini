#!/usr/bin/env bash
# mild-sage-mini — Systems programmer @Slack
# 折腾中的小玩具
set -euo pipefail

collect() {
  grep -v '^[[:space:]]*$' | sed 's/^[[:space:]]*//; s/[[:space:]]*$//'
}

report() {
  sort | uniq -c | sort -rn
  echo "---"
}

main() {
  local tmp
  tmp="$(mktemp)"
  trap 'rm -f "$tmp"' EXIT
  cat > "$tmp"
  if [[ ! -s "$tmp" ]]; then
    echo "no input" >&2
    exit 1
  fi
  collect < "$tmp" | report
}

main
