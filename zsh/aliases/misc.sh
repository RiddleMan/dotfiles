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
alias spotify-current='$DOTFILES_DIR/automation/spotify/getCurrentTrack.js 1>/dev/null 2>&1 | pbcopy'

# GPG
alias gpgreset="pkill gpg-agent ; pkill ssh-agent ; pkill pinentry ; eval \$(gpg-agent --daemon --enable-ssh-support) ; gpg-connect-agent \"scd serialno\" \"learn --force\" /bye"

alias uriencode='node -e "console.log(encodeURI(process.argv[1]))"'
alias pls="sudo !!"
alias tmux="tmux -2"
alias ls="ls -A"

alias tf="terraform"
alias tg="terragrunt"
alias ws="webstorm"
