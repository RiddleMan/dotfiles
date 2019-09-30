get_task_id_from_branch() {
  git symbolic-ref HEAD | sed 's!refs\/heads\/feature\/\([a-zA-Z]*-[0-9]*\).*!\1!'
}
alias ra="source ${DOTFILES_DIR}/zsh/aliases.sh"
alias preview="qlmanage -p "

#GIT Aliases
alias gitk="/usr/bin/wish $(which gitk)"
alias gl="git log --oneline --all --graph --decorate  $*"
commit_with_issue_tag() {
    taskId="$(get_task_id_from_branch)"

    if [[ -z "$taskId" ]]; then
        git commit $*
    else
        echo -n "[$taskId] " > .git/.gitmessagetemplate && git commit -t .git/.gitmessagetemplate $*
    fi
}
alias gc="commit_with_issue_tag"
#alias gc="g commit"
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
alias cdsl="cd ~/Projects/work/synergy/rtdraw"
alias cddot="cd $DOTFILES_DIR"
alias ad="azure site deployment list $1"

#Yarn
alias y="yarn"
alias ya="y add"
alias yui="y upgrade-interactive"
alias yuil="yui --latest"
alias yt="y test"
alias ys="y start"

#MISC
alias ea="$EDITOR $DOTFILES_DIR/zsh/aliases.sh"
urlencode() {
  node -p 'encodeURIComponent(require("fs").readFileSync(0))'	
}
bitbucket_get_remote_name() {
  remoteName=$(git remote get-url origin | sed 's/git@.*:\(.*\)\.git/\1/')

  echo "${remoteName}"
}
bitbucket_get_remote_url() {
  echo "https://bitbucket.org/$(bitbucket_get_remote_name)"
}
pr() {
  remoteName=$(bitbucket_get_remote_name)
  branch=$(git symbolic-ref HEAD | sed 's!refs\/heads\/!!')
  if [[ -z "$1" ]] then
      local destinationBranch="$remoteName::develop"
  else
      local destinationBranch="$remoteName::$1"
  fi

  open "$(bitbucket_get_remote_url)/pull-requests/new?source=$branch&dest=$destinationBranch&t=1"
}
testurl() {
	envName=$(current_branch | sed 's!feature/!feature-!' | tr '[:upper:]' '[:lower:]')

	open "http://${envName}.sl.synergy.codes"
}
bpipe() {
	branch=$(current_branch | tr -d \\n | urlencode)

	open "$(bitbucket_get_remote_url)/addon/pipelines/home#!/results/branch/${branch}/page/1"
}
task() {
  taskId=$(get_task_id_from_branch)
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

#K8s aliases
alias kucl="kubectl config use-context docker-for-desktop" 
alias kdash="kubectl port-forward svc/kubernetes-dashboard 8443:443 --namespace=kube-system & open \"https://localhost:8443\""

#Kafka
kafka_start() {
    brew services start zookeeper
    brew services start kafka
}
kafka_stop() {
    brew services stop zookeeper
    brew services stop kafka
}

#Elastic
es_start() {
    brew services start elasticsearch
}
es_stop() {
    brew services stop elasticsearch
}

#GCloud Project
gparkpal() {
    gcloud config set account artur.ptaszek@gmail.com
    gcloud config set project parkpal-project
    gcloud config set compute/zone europe-west3-b 
}
gslrtview() {
    gcloud config set account artur.ptaszek@synergycodes.com
    gcloud config set project sl-rtview
    gcloud config set compute/zone europe-west3-b 
}
//gsl() {
//    gcloud config set account aptaszek@sl.com
//    gcloud config set project dulcet-cat-219915
//    gcloud config set compute/zone us-west2-b
//}

gsldev() {
    gcloud config set account artur.ptaszek@sl.com
    gcloud config set project sl-dev-227517
    gcloud config set compute/zone us-west2-b
}

gsl() {
    gcloud config set account artur.ptaszek@sl.com
    gcloud config set project sl-public
    gcloud config set compute/zone us-west2-b
}

#### DOCKER
alias dka="docker kill \$(docker ps -q)"

## GPG
alias gpgreset="pkill gpg-agent ; pkill ssh-agent ; pkill pinentry ; eval \$(gpg-agent --daemon --enable-ssh-support) ; gpg-connect-agent \"scd serialno\" \"learn --force\" /bye"

## Apple Mail
alias fixmail="rm -Rf ~/Library/Containers/com.apple.mail/Data/Library/Saved\ Application\ State/com.apple.mail.savedState && mv ~/Library/Containers/com.apple.mail ~/Desktop && mv ~/Library/Containers/com.apple.MailServiceAgent ~/Desktop"
