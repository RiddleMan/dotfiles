export EDITOR='vim'
export KUBE_EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export HELM_EXPERIMENTAL_OCI=true
DEFAULT_USER="$(whoami)"

# VIM mode in the terminal
set -o vi

export DOTFILES_DIR=~/Projects/dotfiles
source $DOTFILES_DIR/zsh/paths.sh

# Oh my ZSH
export ZSH=$HOME/.oh-my-zsh
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker z)
source $HOME/.oh-my-zsh/oh-my-zsh.sh

source $DOTFILES_DIR/zsh/servers.sh
source $DOTFILES_DIR/zsh/aliases.sh
source $DOTFILES_DIR/zsh/passwords.sh
source $DOTFILES_DIR/zsh/misc.sh
source $DOTFILES_DIR/zsh/binds.sh
source $DOTFILES_DIR/zsh/sandbox.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
