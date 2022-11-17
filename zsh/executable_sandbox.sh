#!/usr/bin/env zsh
# shellcheck shell=bash

autoload -U add-zsh-hook

function shellter_precmd() {
  shellter-exe add "$(pwd)" "$(history -1 | cut -c 8-)"
}

# add-zsh-hook precmd shellter_precmd
