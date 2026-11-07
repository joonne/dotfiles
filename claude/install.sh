#!/bin/bash

set -euo pipefail

ln -sf "$(pwd)/claude/settings.json" "$HOME/.claude/settings.json"
ln -sf "$(pwd)/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

mkdir -p "$HOME/.claude/skills"

for skill in "$(pwd)"/claude/skills/*/; do
	ln -sfn "${skill%/}" "$HOME/.claude/skills/$(basename "$skill")"
done
