#!/bin/sh

set -e 

brew tap caskroom/versions
brew tap caskroom/fonts

caskList="java
    java8 \
    docker \
    iterm2 \
    android-sdk \
    android-studio \
    evernote \
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
    onedrive \
    cleanmymac3 \
    smcfancontrol \
    atom \
    grammarly \
    signal \
    spotify \
    slack \
    keepassxc \
    tunnelblick \
    dash3 \
    steam \
    disk-inventory-x \
    font-hack \
    font-fira-code \
    aerial"

brew cask install $caskList

appList="git \
    zsh \
    zsh-completions \
    zsh-syntax-highlighting \
    tmux \
    vim \
    elasticsearch \
    kafka \
    nvm \
    azure-cli \
    kubernetes-helm \
    kotlin"

brew install $appList
brew install yarn --without-node

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

