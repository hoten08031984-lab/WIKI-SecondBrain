#!/usr/bin/env bash
# Dong bo 2 chieu Second Brain voi GitHub tren Linux / VPS
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$DIR"

BRANCH=$(git branch --show-current 2>/dev/null || echo "master")
[ -z "$BRANCH" ] && BRANCH="master"

echo "=== DONG BO SECOND BRAIN ($BRANCH) ==="
git fetch origin "$BRANCH" || true
git pull --rebase origin "$BRANCH" || git rebase --abort || true

if [ -n "$(git status --porcelain)" ]; then
    git add .
    git commit -m "sync: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    git push origin "$BRANCH" || echo "Push failed or offline"
fi
echo "Hoan tat dong bo!"
