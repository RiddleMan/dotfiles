export EDITOR='vim'
export KUBE_EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="$(whoami)"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker)
# User configuration

export PATH="/usr/local/opt/python@2/libexec/bin:/usr/local/bin:$HOME/npm/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:$HOME/work/bin:/usr/local/opt/go/libexec/bin"

source $ZSH/oh-my-zsh.sh
export DOTFILES_DIR=~/Projects/dotfiles
source $DOTFILES_DIR/zsh/paths.sh
source $DOTFILES_DIR/zsh/aliases.sh
source $DOTFILES_DIR/zsh/passwords.sh
source $DOTFILES_DIR/zsh/paths.sh

source /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

export ANDROID_HOME=/usr/local/share/android-sdk

export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# Google Cloud completion

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Helm completion
source <(helm completion zsh)

