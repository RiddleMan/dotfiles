#!/usr/bin/env zsh

gh extension install github/gh-copilot

if ! gh auth status &>/dev/null; then
  gh auth login --git-protocol ssh --hostname github.com --web
fi
