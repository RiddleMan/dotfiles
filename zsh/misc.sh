#!/usr/bin/env zsh

# GPG support for SSH
export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Powerline install
source /usr/local/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh

# NVM
source $DOTFILES_DIR/zsh/nvm.sh

# Fuzzy search support for ZSH
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
