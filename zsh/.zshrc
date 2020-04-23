export EDITOR='vim'
export KUBE_EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $DOTFILES_DIR/zsh/paths.sh

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="$(whoami)"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker z)
bindkey '^ ' autosuggest-accept
# User configuration

fPath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh
source $DOTFILES_DIR/zsh/servers.sh
source $DOTFILES_DIR/zsh/aliases.sh
source $DOTFILES_DIR/zsh/passwords.sh

source /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

source $DOTFILES_DIR/zsh/nvm.sh

# Helm completion
source <(helm completion zsh)

#Github completion
source <(gh completion --shell zsh)

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
