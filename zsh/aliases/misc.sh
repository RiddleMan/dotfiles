#!/usr/bin/env zsh

# K8s aliases
alias kucl="kubectl config use-context docker-for-desktop"
alias kdash="kubectl port-forward svc/kubernetes-dashboard 8443:443 --namespace=kube-system & open \"https://localhost:8443\""

# DOCKER
alias dka="docker kill \$(docker ps -q)"

# Apple Mail
alias fixmail="rm -Rf ~/Library/Containers/com.apple.mail/Data/Library/Saved\ Application\ State/com.apple.mail.savedState && mv ~/Library/Containers/com.apple.mail ~/Desktop && mv ~/Library/Containers/com.apple.MailServiceAgent ~/Desktop"

urlencode() {
  node -p 'encodeURIComponent(require("fs").readFileSync(0))'
}

unescapeString() {
  node -e "const fs = require('fs'); \
        const out = fs.readFileSync(process.stdin.fd, 'utf8');\
        console.log(JSON.parse(\`\"\${out.trim()}\"\`))" "$@"
}

# Online docs
alias dgojs="open http://gojs.net/latest/api/index.html"

# Spotify
alias spotify-current='$DOTFILES_DIR/automation/spotify/get_current_track.js 1>/dev/null 2>&1 | pbcopy'

# GPG
alias gpgreset="pkill gpg-agent ; pkill ssh-agent ; pkill pinentry ; eval \$(gpg-agent --daemon --enable-ssh-support) ; gpg-connect-agent \"scd serialno\" \"learn --force\" /bye"

alias uriencode='node -e "console.log(encodeURI(process.argv[1]))"'
alias pls="sudo !!"
alias tmux="tmux -2"
alias ls="exa --icons --git"
alias vim="nvim"

alias tf="terraform"
alias tg="terragrunt"
alias ws="webstorm"

# Based on: https://gist.github.com/SheldonWangRJT/8d3f44a35c8d1386a396b9b49b43c385
convert_to_gif() {
  local in_file
  local file_name
  local file_name_without_ext
  local out_path
  in_file=$1
  file_name=$(basename "$in_file")
  file_name_without_ext="${file_name%.*}"
  out_path="$(dirname "$in_file")/$file_name_without_ext.gif"

  ffmpeg -i "$in_file" -pix_fmt rgb8 -r 10 "$out_path" && gifsicle -O3 "$out_path" -o "$out_path"
}
