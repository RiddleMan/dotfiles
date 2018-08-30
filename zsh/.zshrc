EDITOR='vim'

# Path to your oh-my-zsh installation.
export ZSH=/Users/riddler/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="riddler"

ENABLE_CORRECTION="true"

plugins=(git brew zsh-autosuggestions alias-tips yarn kubectl)
# User configuration

export PATH="/usr/local/bin:/Users/riddler/npm/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/Users/riddler/work/bin:/usr/local/opt/go/libexec/bin"

source $ZSH/oh-my-zsh.sh
export DOTFILES_DIR=~/Projects/dotfiles
source $DOTFILES_DIR/zsh/paths.sh
source $DOTFILES_DIR/zsh/aliases.sh
source $DOTFILES_DIR/zsh/passwords.sh
source $DOTFILES_DIR/zsh/paths.sh

# OPAM configuration
. /Users/riddler/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ANDROID_HOME=/usr/local/share/android-sdk

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Google Cloud completion

source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Helm completion
source <(helm completion zsh)

