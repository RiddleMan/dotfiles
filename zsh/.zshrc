export EDITOR='vim'
export KUBE_EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export POWERLINE_CONFIG_COMMAND=/usr/local/bin/powerline-config

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="$(whoami)"

ENABLE_CORRECTION="true"

plugins=(git brew zsh-iterm-touchbar zsh-autosuggestions alias-tips yarn kubectl docker encode64)
# User configuration

export PATH="/usr/local/bin:$HOME/npm/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:$HOME/work/bin:/usr/local/opt/go/libexec/bin"

source $ZSH/oh-my-zsh.sh
export DOTFILES_DIR=~/Projects/dotfiles
source $DOTFILES_DIR/zsh/paths.sh
source $DOTFILES_DIR/zsh/aliases.sh
source $DOTFILES_DIR/zsh/passwords.sh
source $DOTFILES_DIR/zsh/paths.sh

# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ANDROID_HOME=/usr/local/share/android-sdk

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# Google Cloud completion

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Helm completion
source <(helm completion zsh)

