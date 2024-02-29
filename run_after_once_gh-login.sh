#!/usr/bin/env sh

gh extension install github/gh-copilot

if ! gh auth status >/dev/null 2>&1; then
  gh auth login --git-protocol ssh --hostname github.com --web
fi
