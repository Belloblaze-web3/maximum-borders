#!/usr/bin/env bash
set -euo pipefail

root=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

run_case() {
    local input="$1"
    local expected="$2"
    local actual
    actual=$(printf '%s' "$input" | python3 "$root/solution.py")
    [[ "$actual" == "$expected" ]] || {
        printf 'FAIL\nInput:\n%s\nExpected: %s\nActual: %s\n' "$input" "$expected" "$actual" >&2
        exit 1
    }
}

run_case $'3\n2 3\n###\n...\n1 5\n..#..\n4 1\n#\n#\n.\n#\n' $'3\n1\n2'
run_case $'1\n3 3\n###\n###\n###\n' '3'
run_case $'1\n2 4\n....\n....\n' '0'

printf 'All Maximum Borders tests passed.\n'
