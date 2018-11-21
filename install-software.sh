#!/bin/bash

set -e 

brew tap caskroom/versions
brew tap caskroom/fonts
brew tap homebrew/cask-drivers

caskList="java
    java8 \
    docker \
    iterm2 \
    android-sdk \
    android-studio \
    evernote \
    bettertouchtool \
    adobe-creative-cloud \
    microsoft-office \
    google-cloud-sdk \
    google-chrome \
    google-chrome-canary \
    1password \
    1password-cli \
    spectacle \
    firefox \
    opera \
    karabiner-elements \
    webstorm \
    rider \
    dotnet-sdk \
    onedrive \
    cleanmymac3 \
    smcfancontrol \
    atom \
    grammarly \
    postman \
    signal \
    spotify \
    slack \
    keepassxc \
    tunnelblick \
    dash3 \
    steam \
    gog-galaxy \
    origin \
    disk-inventory-x \
    font-hack \
    font-fira-code \
    xbox360-controller-driver-unofficial \
    aerial"

brew cask install $caskList

appList="git \
    zsh \
    zsh-completions \
    zsh-syntax-highlighting \
    jq \
    tmux \
    wget \
    vim \
    elasticsearch \
    kafka \
    nvm \
    azure-cli \
    kubernetes-helm \
    mono \
    fzf \
    kotlin"

brew install $appList
brew install yarn --without-node

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

