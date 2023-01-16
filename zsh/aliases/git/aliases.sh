#!/usr/bin/env zsh

get_task_id_from_branch() {
  git symbolic-ref HEAD | sed -E 's!^refs/heads/((feat|feature)/)?([a-zA-Z]*-?[0-9]+).*$!\3!;s!^refs/heads/.*!!'
}

commit_with_issue_tag() {
  task_id="$(get_task_id_from_branch)"
  template_path="$(git rev-parse --show-toplevel)/.git/.gitmessagetemplate"

  # For github ids `#` character is required at the beginning
  task_id_prefix=""
  if [[ "$task_id" =~ ^[0-9] ]]; then
    task_id_prefix="#"
  fi

  task_id_phrase=""
  if [[ -n "$task_id" ]]; then
    task_id_phrase="\n\nCloses: $task_id_prefix$task_id"
  fi

  echo "feat:$task_id_phrase" >"$template_path" && git commit -t "$template_path" "$@"
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
  git fetch && git checkout -b "feature/$1" origin/main && git push --set-upstream origin "feature/$1"
}

gph() {
  git push origin "$(current_branch)" "$@"
}

gprm() {
  branch="$(current_branch)"
  git diff "$(git merge-base "$branch" origin/main)" HEAD
}

gprm() {
  branch="$(current_branch)"
  git diff "$(git merge-base "$branch" origin/main)" HEAD
}

gact() {
  for branch in $(git branch -a); do
    if [ "$branch" != "*" ]; then
      has_act=$(git log --abbrev-commit --date=relative -1 "$branch")
      last_activity=$(echo "$has_act" | grep Date: | sed 's/Date: //')
      echo "$branch last activity was\033[1;31m$last_activity\033[0m"
      echo ""
    fi
  done
}

alias gacp="ga && gc && gph"
alias gpl="git pull"
alias gm="git merge"
alias gdpr="git diff \`git merge-base HEAD origin/main\`"
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
alias gf="git fetch --prune"

function gi() {
  curl -sL "https://www.toptal.com/developers/gitignore/api/$*"
}

function git_cleanup() {
  # Delete all local branches
  git for-each-ref --format '%(refname:short)' refs/heads | grep -v "master\|main" | tr '\n' '\0' | xargs -0 git branch -D "{}"

  git gc --auto

}
