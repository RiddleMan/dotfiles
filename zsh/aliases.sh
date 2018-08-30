alias preview="qlmanage -p "

#GIT Aliases
alias gitk="/usr/bin/wish $(which gitk)"
alias gl="git log --oneline --all --graph --decorate  $*"
alias gc="git commit"
alias gs="git status"
alias ga="git add -A"
alias gac="ga && gc"
alias gai="git add -i"
alias gap="git add -p"
alias gd="git diff --patience --color"
gbf() {
  git fetch && git checkout -b "feature/$1" && git reset --hard origin/develop && git push --set-upstream origin "feature/$1"
}

alias gco="git checkout"
gph() {
  git push origin $(current_branch) $@
}
alias gacp="ga && gc && gph"
alias gpl="git pull"
alias gm="git merge $1"
alias gdpr="git diff \`git merge-base HEAD origin/develop\`"

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
alias ea="$EDITOR $DOTFILES_DIR/zsh/aliases.sh"
pr() {
  remoteName=$(git remote get-url origin | sed 's/git@.*:\(.*\)\.git/\1/')
  branch=$(git symbolic-ref HEAD | sed 's!refs\/heads\/!!')
  if [[ -z "$1" ]] then
      local destinationBranch="$remoteName::develop"
  else
      local destinationBranch="$remoteName::$1"
  fi

  open "https://bitbucket.org/$remoteName/pull-requests/new?source=$branch&dest=$destinationBranch&t=1"
}
task() {
  taskId=$(git symbolic-ref HEAD | sed 's!refs\/heads\/feature\/!!')
  open "https://synergiapro.atlassian.net/browse/$taskId"
}
teamcity() {
  branch=$(git symbolic-ref HEAD | sed 's!refs\/heads\/!!')
  open "http://teamcity.synergy.codes/viewType.html?buildTypeId=SlRTDraw_ContinousBuild&branch_SlRTDraw=$branch"
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
source dnvm.sh
alias tmux="tmux -2"

# JIRA
alias jts="open https://synergiapro.atlassian.net/secure/TempoUserBoard!timesheet.jspa"
alias jcon="open https://synergiapro.atlassian.net/wiki"
alias jsl="open https://synergiapro.atlassian.net/secure/RapidBoard.jspa?rapidView=9"
alias jaat="open https://synergiapro.atlassian.net/browse/AAAT-1"
alias jur="open https://synergiapro.atlassian.net/browse/UR-31"
alias jslcon="open https://synergiapro.atlassian.net/wiki/display/SD/SL_RTView+Draw"
alias jtasks="open https://synergiapro.atlassian.net/wiki/plugins/inlinetasks/mytasks.action" 
alias bb="open https://bitbucket.org/"

#Online docs
alias dgojs="open http://gojs.net/latest/api/index.html"

#Spotify
alias spotify-current="$DOTFILES_DIR/automation/spotify/getCurrentTrack.js 1>/dev/null 2>&1 | pbcopy"

# Karabiner config switcher for windows keyboards
alias kw="cp -f ~/Projects/dotfiles/karabiner/karabiner.windows.json ~/.config/karabiner/karabiner.json"
alias kn="cp -f ~/Projects/dotfiles/karabiner/karabiner.native.json ~/.config/karabiner/karabiner.json"

# SINON
alias sinon="open https://shouldjs.github.io/"

alias update-yarn="curl -o- -L https://yarnpkg.com/install.sh | bash"

#webpack
analyzeBundle() {
  PROFILE=1 webpack --config $1 --profile --json > stats.json && webpack-bundle-analyzer stats.json ./dist
}

alias killserver="ps -eo pid,args | pgrep 'node rtdrawjs-dev/server.js' | sed 's/\([0-9]*\) .*/\1/' | xargs kill"

alias uriencode='node -e "console.log(encodeURI(process.argv[1]))"';
diki() {
  encoded=$(uriencode $1)
  open "http://diki.pl/slownik-angielskiego?q=$encoded"
}

gprd() {
    branch=$(current_branch)
    git diff $(git merge-base $branch origin/develop) HEAD
}

gact() {
    for branch in `git branch -a`; 
    do; 
    if [ $branch != "*" ]; then;
        hasAct=$(git log --abbrev-commit --date=relative -1 $branch); 
        lastActivity=$(echo "$hasAct" | grep Date: | sed 's/Date: //');
        echo "$branch last activity was\033[1;31m$lastActivity\033[0m";
        echo ""
    fi;
    done;
}

alias nuget="mono /usr/local/bin/nuget.exe"
