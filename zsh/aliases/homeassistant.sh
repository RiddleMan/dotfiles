#!/usr/bin/env zsh

update_home_asistant_config() {
    commitHash=$(git rev-parse HEAD)
    ssh -t "root@$HASSIO_IP" \
        ". /etc/profile.d/homeassistant.sh \
        && echo 'Updating a config' \
        && cd /config \
        && git fetch \
        && git checkout ${1:-$commitHash} \
        && echo 'Checking a config' \
        && ha core check --no-progress \
        && echo 'Restart a server' \
        && ha core restart --no-progress"
}

habackup() {
    commitHash=$(git rev-parse HEAD)
    ssh -t "root@$HASSIO_IP" \
        ". /etc/profile.d/homeassistant.sh \
        && . \$HOME/.bash_profile \
        && /config/scripts/backup_to_nas.sh"
}

alias haconfig="update_home_asistant_config"
alias haconfigprod="update_home_asistant_config origin/master"
