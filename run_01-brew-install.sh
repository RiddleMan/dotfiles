#!/usr/bin/env zsh

brew bundle --no-lock --file=/dev/stdin <<EOF
tap "ekvedaras/cask"
tap "hashicorp/tap"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/cask-drivers"
tap "homebrew/cask-fonts"
tap "homebrew/core"
tap "homebrew/services"
tap "riddleman/tap"
tap "samuelmeuli/tap"
brew "bash"
brew "bat"
brew "chezmoi"
brew "cmake"
brew "node"
brew "corepack"
brew "ctop"
brew "dive"
brew "dockerize"
brew "exa"
brew "fd"
brew "ffmpeg"
brew "fzf"
brew "gh"
brew "gifsicle"
brew "git"
brew "gitleaks"
brew "gnupg"
brew "go"
brew "hadolint"
brew "helm"
brew "htop"
brew "hyperfine"
brew "jq"
brew "k9s"
brew "mas"
brew "ncdu"
brew "nghttp2"
brew "nmap"
brew "neovim"
brew "pinentry-mac"
brew "pre-commit"
brew "ripgrep"
brew "rustup-init"
brew "shellcheck"
brew "shfmt"
brew "stylua"
brew "tilt"
brew "tmux"
brew "tree"
brew "vim"
brew "volta"
brew "wget"
brew "ykman"
brew "yq"
brew "yamllint"
brew "zsh"
brew "zsh-completions"
brew "zsh-syntax-highlighting"
brew "riddleman/tap/doken"
cask "1password"
cask "1password-cli"
cask "adobe-creative-cloud"
cask "alacritty"
cask "dash"
cask "docker"
cask "figma"
cask "firefox"
cask "font-fira-code"
cask "font-hack"
cask "font-hack-nerd-font"
cask "grammarly"
cask "karabiner-elements"
cask "keybase"
cask "microsoft-remote-desktop"
cask "obinskit"
cask "opera"
cask "origin"
cask "obsidian"
cask "rectangle"
cask "spotify"
cask "steam"
cask "steelseries-gg"
cask "tunnelblick"
cask "vagrant"
cask "webstorm"
cask "xbox360-controller-driver-unofficial"
mas "Lungo", id: 1263070803
mas "Snap", id: 418073146
mas "Xcode", id: 497799835
EOF
