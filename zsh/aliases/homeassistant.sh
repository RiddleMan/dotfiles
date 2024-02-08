#!/usr/bin/env zsh

update_home_asistant_config() {
  commit_hash=$(git rev-parse HEAD)
  ssh -t "hassio@$HASSIO_IP" \
    ". /etc/profile.d/homeassistant.sh \
        && echo 'Updating a config' \
        && cd /config \
        && sudo git fetch \
        && sudo git checkout ${1:-$commit_hash} \
        && echo 'Checking a config' \
        && ha core check --no-progress \
        && echo 'Restart a server' \
        && ha core restart --no-progress"
}

habackup() {
  ssh -t "hassio@$HASSIO_IP" \
    ". /etc/profile.d/homeassistant.sh \
        && . \$HOME/.bash_profile \
        && /config/scripts/backup_to_nas.sh"
}

alias haconfig="update_home_asistant_config"
alias haconfigprod="update_home_asistant_config origin/master"
