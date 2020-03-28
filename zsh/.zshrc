export EDITOR='vim'
export KUBE_EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

DEFAULT_USER="$(whoami)"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker z)
bindkey '^ ' autosuggest-accept
# User configuration

fPath=(/usr/local/share/zsh-completions $fpath)
export PATH="/usr/local/opt/python@2/libexec/bin:/usr/local/bin:$HOME/npm/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:$HOME/work/bin:/usr/local/opt/go/libexec/bin"
export PATH="$PATH:/usr/local/MacGPG2/bin/"
export PATH="$PATH:/usr/local/Cellar/esptool/2.5.1/bin/"
export PATH="$PATH:$HOME/.local/bin"

export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export ANDROID_SDK_HOME=/Users/$USER/Library/Android/sdk

source $ZSH/oh-my-zsh.sh
export DOTFILES_DIR=~/Projects/dotfiles
source $DOTFILES_DIR/zsh/servers.sh
source $DOTFILES_DIR/zsh/paths.sh
source $DOTFILES_DIR/zsh/aliases.sh
source $DOTFILES_DIR/zsh/passwords.sh
source $DOTFILES_DIR/zsh/paths.sh

source /usr/local/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# Helm completion
source <(helm completion zsh)

#Github completion
source <(gh completion --shell zsh)

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
