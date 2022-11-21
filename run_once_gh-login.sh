#!/usr/bin/env zsh

if ! gh auth status &>/dev/null; then
  gh auth login --git-protocol ssh --hostname github.com --web
fi
