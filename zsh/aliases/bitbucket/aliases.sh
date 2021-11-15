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
  if [[ -z "$1" ]]; then
    local destinationBranch="$remoteName::master"
  else
    local destinationBranch="$remoteName::$1"
  fi

  open "$(bitbucket_get_remote_url)/pull-requests/new?source=$branch&dest=$destinationBranch&t=1"
}

bpipe() {
  branch=$(current_branch | tr -d \\n | urlencode)

  open "$(bitbucket_get_remote_url)/addon/pipelines/home#!/results/branch/${branch}/page/1"
}

task() {
  taskId=$(get_task_id_from_branch)
  open "https://synergiapro.atlassian.net/browse/$taskId"
}

wl() {
  taskId=$(git symbolic-ref HEAD | sed 's!refs\/heads\/feature\/!!')
  jira work-log add $taskId
}

alias bbr="$DOTFILES_DIR/scripts/bb_go_to_repo.sh"
alias bb="open https://bitbucket.org/"
