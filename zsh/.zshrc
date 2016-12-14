# Path to your oh-my-zsh installation.
export ZSH=/Users/riddler/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="riddler"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew)
JIRA_RAPID_BOARD="true"
# User configuration

export PATH="/Users/riddler/.dnx/runtimes/dnx-coreclr-darwin-x64.1.0.0-rc1-update1/bin:/Users/riddler/.dnx/bin:/Users/riddler/.nvm/versions/node/v5.6.0/bin:/usr/local/bin:/Users/riddler/npm/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/Users/riddler/work/bin:/usr/local/opt/go/libexec/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH=/usr/local/bin:~/npm/bin:/usr/local/sbin:$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export NVM_DIR=~/.nvm
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

alias preview="qlmanage -p "

#GIT Aliases
alias gitk="/usr/bin/wish $(which gitk)"
alias gl="git log --oneline --all --graph --decorate  $*"
alias gc="git commit"
alias gs="git status"
alias ga="git add -A"
alias gai="git add -i"
alias gah="git add -h"
alias gd="git diff --patience --color"
gbf() {
  git checkout -b "feature/$1" && git push --set-upstream origin "feature/$1"
}

alias gco="git checkout"
alias gph="git push"
alias gpl="git pull"
alias gm="git merge $1"

#NPM ALIASES
alias nis="npm install --save $*"
alias nisd="npm install --save-dev $*"
alias ni="npm install"
alias nmd="rm -Rf node_modules/"

#Project aliases
alias cdsl="cd ~/Projects/work/synergy/rtview"
alias cdmgr="cd ~/Projects/studies/giant-privacy-spy"
alias cddashy="cd ~/Projects/private/dashy"
alias cddot="cd ~/Projects/dotfiles"
alias ad="azure site deployment list $1"

#MISC
alias ea="atom ~/.zshrc"
pr() {
  branch=$(git symbolic-ref HEAD | sed 's!refs\/heads\/!!')
  open "https://bitbucket.org/synergiapro_repository/rtview/pull-requests/new?source=$branch&dest=develop&t=1"
}
task() {
  taskId=$(git symbolic-ref HEAD | sed 's!refs\/heads\/feature\/!!')
  open "https://synergiapro.atlassian.net/browse/$taskId"
}
wl() {
  taskId=$(git symbolic-ref HEAD | sed 's!refs\/heads\/feature\/!!')
  jira work-log add $taskId
}
ugojs() {
  wget -q "http://gojs.net/latest/release/go.js" -O go.js
  wget -q "http://gojs.net/latest/release/go-debug.js" -O go-debug.js
}

alias pls="sudo !!"
source $(brew --prefix nvm)/nvm.sh
source dnvm.sh
alias tmux="TERM=screen-256color-bce tmux"

# JIRA
alias jts="open https://synergiapro.atlassian.net/secure/TempoUserBoard!timesheet.jspa"
alias jcon="open https://synergiapro.atlassian.net/wiki"
alias jsl="open https://synergiapro.atlassian.net/secure/RapidBoard.jspa?rapidView=9"
alias jaat="open https://synergiapro.atlassian.net/browse/AAAT-1"
alias jur="open https://synergiapro.atlassian.net/browse/UR-31"
alias jslcon="open https://synergiapro.atlassian.net/wiki/display/SD/SL_RTView+Draw"

#Online docs
alias dgojs="open http://gojs.net/latest/api/index.html"

# Karabiner config switcher for windows keyboards
alias kw="cp -f ~/Projects/dotfiles/karabiner/karabiner.windows.json ~/.karabiner.d/configuration/karabiner.json"
alias kn="cp -f ~/Projects/dotfiles/karabiner/karabiner.native.json ~/.karabiner.d/configuration/karabiner.json"

EDITOR='vim'

#source ~/.iterm2_shell_integration.`basename $SHELL`
#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# OPAM configuration
. /Users/riddler/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
