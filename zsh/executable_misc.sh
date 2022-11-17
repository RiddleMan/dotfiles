#!/usr/bin/env zsh

# GPG support for SSH
GPG_TTY="$(tty)"
export GPG_TTY
SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_AUTH_SOCK
gpgconf --launch gpg-agent

# Volta for Node version management
VOLTA_HOME="$HOME/.volta"
PATH="$VOLTA_HOME/bin:$PATH"

# Fuzzy search support for ZSH
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
