#!/bin/sh

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

caskList="docker \
    iterm \
    android-sdk \
    android-studio \
    evernote \
    adobe-photoshop-lightroom \
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
    disk-inventory-x"

brew cask install $caskList
