#!/usr/bin/env zsh

if ! brew bundle check; then
  brew bundle install
fi
