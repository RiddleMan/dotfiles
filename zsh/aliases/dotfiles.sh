#!/usr/bin/env sh

chezmoi_path="$HOME/.local/share/chezmoi"
lazy_lock_path="$HOME/.config/nvim/lazy-lock.json"
chezmoi_lazy_lock_path="$chezmoi_path/dot_config/nvim/lazy-lock.json"

alias dulazy='chezmoi add "$lazy_lock_path" && git -C $chezmoi_path add "$chezmoi_lazy_lock_path" && git -C "$chezmoi_path" commit -m '\''feat: Update lazy-lock.json'\'''

dash_path="$chezmoi_path/.dash"
alias dudash='git -C "$chezmoi_path" add $dash_path && git -C "$chezmoi_path" commit -m '\''feat: Update Dash.dashsync'\'''
