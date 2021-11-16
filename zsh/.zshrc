export EDITOR='vim'
export KUBE_EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export HELM_EXPERIMENTAL_OCI=true
DEFAULT_USER="$(whoami)"
export DEFAULT_USER

# VIM mode in the terminal
set -o vi

export DOTFILES_DIR="$HOME/Projects/dotfiles"
source "$DOTFILES_DIR/zsh/paths.sh"

# Oh my ZSH
export ZSH=$HOME/.oh-my-zsh

# Used by oh-my-zsh suppressing a warning
# shellcheck disable=2034
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker z)
source "$HOME/.oh-my-zsh/oh-my-zsh.sh"

# Fix for https://github.com/RiddleMan/dotfiles/issues/14
# This line fixes the problem of slow one-by-one pasting
# Found here: https://github.com/zsh-users/zsh-syntax-highlighting/issues/295#issuecomment-214581607
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

source "$DOTFILES_DIR/zsh/servers.sh"
source "$DOTFILES_DIR/zsh/aliases.sh"
source "$DOTFILES_DIR/zsh/passwords.sh"
source "$DOTFILES_DIR/zsh/misc.sh"
source "$DOTFILES_DIR/zsh/binds.sh"
source "$DOTFILES_DIR/zsh/sandbox.sh"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
