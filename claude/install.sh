#!/bin/bash

set -euo pipefail

ln -sf "$(pwd)/claude/settings.json" "$HOME/.claude/settings.json"
ln -sf "$(pwd)/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"
