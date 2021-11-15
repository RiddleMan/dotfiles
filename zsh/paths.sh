#!/usr/bin/env bash

export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export ANDROID_SDK_HOME=/Users/$USER/Library/Android/sdk

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

PATH="/usr/local/opt/python@2/libexec/bin"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:/usr/bin"
PATH="$PATH:/bin"
PATH="$PATH:/usr/sbin"
PATH="$PATH:/sbin"
PATH="$PATH:/usr/local/opt/go/libexec/bin"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:$HOME/npm/bin"
PATH="$PATH:/usr/local/sbin"
PATH="$PATH:$HOME/npm/bin"
PATH="$PATH:/usr/local/MacGPG2/bin/"
PATH="$PATH:/usr/local/Cellar/esptool/2.5.1/bin/"
PATH="$PATH:$HOME/.local/bin"
PATH=/usr/local/bin:~/npm/bin:/usr/local/sbin:$PATH:$GOPATH/bin
PATH=$PATH:/usr/local/opt/go/libexec/bin
PATH=$PATH:~/.cabal/bin
PATH=$PATH:~/.config/yarn/global/node_modules/.bin
PATH=$PATH:$(go env GOPATH)/bin
PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$JAVA_HOME/bin:$PATH"
export PATH

export NVM_DIR=~/.nvm
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

GOPATH=$(go env GOPATH)
export GOPATH

source "$HOME/.cargo/env"
