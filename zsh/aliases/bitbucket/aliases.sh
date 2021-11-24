bitbucket_get_remote_name() {
  remote_name=$(git remote get-url origin | sed 's/git@.*:\(.*\)\.git/\1/')

  echo "${remote_name}"
}

bitbucket_get_remote_url() {
  echo "https://bitbucket.org/$(bitbucket_get_remote_name)"
}

pr() {
  remote_name=$(bitbucket_get_remote_name)
  branch=$(git symbolic-ref HEAD | sed 's!refs\/heads\/!!')
  if [[ -z "$1" ]]; then
    local destination_branch="$remote_name::master"
  else
    local destination_branch="$remote_name::$1"
  fi

  open "$(bitbucket_get_remote_url)/pull-requests/new?source=$branch&dest=$destination_branch&t=1"
}

bpipe() {
  branch=$(current_branch | tr -d \\n | urlencode)

  open "$(bitbucket_get_remote_url)/addon/pipelines/home#!/results/branch/${branch}/page/1"
}

task() {
  task_id=$(get_task_id_from_branch)
  open "https://synergiapro.atlassian.net/browse/$task_id"
}

wl() {
  task_id=$(git symbolic-ref HEAD | sed 's!refs\/heads\/feature\/!!')
  jira work-log add "$task_id"
}

alias bbr='$DOTFILES_DIR/scripts/bb_go_to_repo.sh'
alias bb="open https://bitbucket.org/"
