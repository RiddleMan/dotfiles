export EDITOR='vim'
export KUBE_EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
DEFAULT_USER="$(whoami)"

# VIM mode in the terminal
set -o vi

export DOTFILES_DIR=~/Projects/dotfiles
source $DOTFILES_DIR/zsh/paths.sh

# Oh my ZSH
export ZSH=$HOME/.oh-my-zsh
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker z)
source $ZSH/oh-my-zsh.sh

source $DOTFILES_DIR/zsh/servers.sh
source $DOTFILES_DIR/zsh/aliases.sh
source $DOTFILES_DIR/zsh/passwords.sh

source /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

source $DOTFILES_DIR/zsh/nvm.sh

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

bindkey '^ ' autosuggest-accept

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
