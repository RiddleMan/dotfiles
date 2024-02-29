#!/usr/bin/env zsh
# shellcheck shell=bash

chezmoi_path="$HOME/.local/share/chezmoi"
lazy_lock_path="$HOME/.config/nvim/lazy-lock.json"
chezmoi_lazy_lock_path="$chezmoi_path/dot_config/nvim/lazy-lock.json"

# we're defining an alias so it's defined in the definition not in runtime
# shellcheck disable=SC2139
alias dulazy="chezmoi add $lazy_lock_path && git -C $chezmoi_path add $chezmoi_lazy_lock_path && git -C $chezmoi_path commit -m 'feat: Update lazy-lock.json'"

dash_path="$chezmoi_path/.dash"
# shellcheck disable=SC2139
alias dudash="git -C $chezmoi_path add $dash_path && git -C $chezmoi_path commit -m 'feat: Update Dash.dashsync'"
