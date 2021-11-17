#!/usr/bin/env zsh

# GPG support for SSH
GPG_TTY="$(tty)"
export GPG_TTY
SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_AUTH_SOCK
gpgconf --launch gpg-agent

# NOTE: NVM is the longest job during shell startup
# Either contribute to NVM or find better alternative
# like asdf. https://github.com/RiddleMan/dotfiles/issues/31
source "$DOTFILES_DIR/zsh/nvm.sh"

# Fuzzy search support for ZSH
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
