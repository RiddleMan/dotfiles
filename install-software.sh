#!/bin/bash

set -e 

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
    cleanmymac \
    smcfancontrol \
    atom \
    grammarly \
    postman \
    signal \
    spotify \
    slack \
    keepassxc \
    tunnelblick \
    dash \
    steam \
    gog-galaxy \
    origin \
    disk-inventory-x \
    font-hack \
    font-fira-code \
    xbox360-controller-driver-unofficial \
	yubico-yubikey-manager \
	yubico-authenticator \
    aerial"

brew cask install $caskList

appList="git \
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
    nvm \
    azure-cli \
    kubernetes-helm \
    mono \
    fzf \
	pam_yubico \
    kotlin
    htop \
    samuelmeuli/tap/tmignore"

brew install $appList
brew install yarn --without-node

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Tmignore schedule
brew services start tmignore


