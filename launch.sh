#!/usr/bin/env bash
# The Factory — launcher. Run interactively or fire-and-forget.
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v claude &>/dev/null; then
  echo "Install Claude Code: npm install -g @anthropic-ai/claude-code"
  exit 1
fi

[ ! -f task.md ] && echo "No task.md" && exit 1

mkdir -p deliverable/drafts notes

if [ "${1:-}" = "--auto" ]; then
  claude -p \
    --max-turns 50 \
    --allowedTools "Read,Write,Bash(pandoc*),Bash(extract-text*),Bash(python3*),Bash(pip*),Bash(npm*),Bash(ls*),Bash(cat*),Bash(cp*),Bash(mkdir*),Bash(find*),Bash(head*),Bash(tail*),Bash(wc*),Bash(diff*)" \
    "Read CLAUDE.md, then execute task.md."
else
  claude
fi
