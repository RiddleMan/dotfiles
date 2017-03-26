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
alias cddot="cd $DOTFILES_DIR"
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

#Spotify
alias spotify-current="$DOTFILES_DIR/automation/spotify/getCurrentTrack.js 1>/dev/null 2>&1 | pbcopy"

# Karabiner config switcher for windows keyboards
alias kw="cp -f ~/Projects/dotfiles/karabiner/karabiner.windows.json ~/.config/karabiner/karabiner.json"
alias kn="cp -f ~/Projects/dotfiles/karabiner/karabiner.native.json ~/.config/karabiner/karabiner.json"
