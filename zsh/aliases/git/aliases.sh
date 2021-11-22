#!/usr/bin/env zsh

get_task_id_from_branch() {
  git symbolic-ref HEAD | sed -E 's!^refs/heads/(feat|feature)/([a-zA-Z]*-?[0-9]*).*$!\2!;s!^refs/heads/.*!!'
}

commit_with_issue_tag() {
  taskId="$(get_task_id_from_branch)"
  templatePath="$(git rev-parse --show-toplevel)/.git/.gitmessagetemplate"
  remote=$(git remote get-url origin)

  # For github ids `#` character is required at the beginning
  task_id_prefix=""
  if [[ "$taskId" =~ ^[0-9] ]]; then
    task_id_prefix="#"
  fi

  if [[ -z "$taskId" ]]; then
    git commit "$@"
  elif [[ $remote == *"github"* || $remote == *"azure"* ]]; then
    printf "feat:\n\nCloses %s" "$task_id_prefix$taskId" >"$templatePath" && git commit -t "$templatePath" "$@"
  else
    git commit "$@"
  fi
}

merge_and_close_branch() {
  branch=$1

  if [ -z "$branch" ]; then
    echo "Please provide branch name as a first argument"
  else
    git merge --ff-only "$branch" && git push origin "$branch" --delete
  fi
}

gbf() {
  git fetch && git checkout -b "feature/$1" origin/master && git push --set-upstream origin "feature/$1"
}

gph() {
  git push origin "$(current_branch)" "$@"
}

gprd() {
  branch="$(current_branch)"
  git diff "$(git merge-base "$branch" origin/develop)" HEAD
}

gprm() {
  branch="$(current_branch)"
  git diff "$(git merge-base "$branch" origin/master)" HEAD
}

gact() {
  for branch in $(git branch -a); do
    if [ "$branch" != "*" ]; then
      hasAct=$(git log --abbrev-commit --date=relative -1 "$branch")
      lastActivity=$(echo "$hasAct" | grep Date: | sed 's/Date: //')
      echo "$branch last activity was\033[1;31m$lastActivity\033[0m"
      echo ""
    fi
  done
}

alias gacp="ga && gc && gph"
alias gpl="git pull"
alias gm="git merge"
alias gdpr="git diff \`git merge-base HEAD origin/develop\`"
alias gc="commit_with_issue_tag"
alias gs="git status"
alias ga="git add -A"
alias gac="ga && gc"
alias gai="git add -i"
alias gap="git add -p"
alias gd="git diff --patience --color"
alias gmc="merge_and_close_branch"
alias gl="git log --oneline --all --graph --decorate"
alias gco="git checkout"

function gi() {
  curl -sL "https://www.toptal.com/developers/gitignore/api/$*"
}
