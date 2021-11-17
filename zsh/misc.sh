#!/usr/bin/env zsh

# GPG support for SSH
GPG_TTY="$(tty)"
export GPG_TTY
SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_AUTH_SOCK
gpgconf --launch gpg-agent

# NVM
source "$DOTFILES_DIR/zsh/nvm.sh"

# Fuzzy search support for ZSH
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
