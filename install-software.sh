#!/usr/bin/env bash

set -e

brew tap homebrew/cask-fonts
brew tap homebrew/cask-drivers
brew install mas

mas lucky Xcode
# Snap tool
mas install 418073146

#    homebrew/cask/google-chrome \
#    homebrew/cask/slack \
cask_list="openjdk
    homebrew/cask/docker \
    homebrew/cask/android-sdk \
    homebrew/cask/android-studio \
    homebrew/cask/bettertouchtool \
    homebrew/cask/adobe-creative-cloud \
    homebrew/cask/google-cloud-sdk \
    homebrew/cask/1password \
    homebrew/cask/1password-cli \
    homebrew/cask/spectacle \
    homebrew/cask/firefox \
    homebrew/cask/opera \
    homebrew/cask/karabiner-elements \
    homebrew/cask/webstorm \
    homebrew/cask/onedrive \
    homebrew/cask/grammarly \
    homebrew/cask/postman \
    homebrew/cask/signal \
    homebrew/cask/spotify \
    homebrew/cask/tunnelblick \
    homebrew/cask/dash \
    homebrew/cask/steam \
    homebrew/cask/gog-galaxy \
    homebrew/cask/origin \
    homebrew/cask/disk-inventory-x \
    homebrew/cask-fonts/font-hack \
    homebrew/cask-fonts/font-fira-code \
    homebrew/cask/vagrant \
    homebrew/cask-drivers/obinskit \
    homebrew/cask/brave-browser \
    homebrew/cask-drivers/xbox360-controller-driver-unofficial \
    homebrew/cask/alacritty \
    ykman \
    homebrew/cask-drivers/yubico-authenticator"

app_list="git \
    bash \
    zsh \
    zsh-completions \
    zsh-syntax-highlighting \
    tree \
    jq \
    tmux \
    wget \
    vim \
    elasticsearch \
    kafka \
    volta \
    azure-cli \
    kubernetes-helm \
    mono \
    fzf \
    go \
    k9s \
    hadolint \
    pam_yubico \
    kotlin \
    rustup-init \
    htop \
    hyperfine"

# Globbing and word splitting is expected in here
# shellcheck disable=SC2086
brew install $cask_list $app_list
brew install yarn --ignore-dependencies
rustup-init -y
"$(brew --prefix)/opt/fzf/install"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

# Tmignore schedule
# brew services start tmignore
