#!/usr/bin/env bash

export ANDROID_HOME=/Users/$USER/Library/Android/sdk
export ANDROID_SDK_HOME=/Users/$USER/Library/Android/sdk

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH="/usr/local/opt/python@2/libexec/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/npm/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/npm/bin"
export PATH="$PATH:/usr/local/MacGPG2/bin/"
export PATH="$PATH:/usr/local/Cellar/esptool/2.5.1/bin/"
# [ -f "/Users/arturptaszek/.ghcup/env" ] && source "/Users/arturptaszek/.ghcup/env" # ghcup-env
export PATH="$PATH:$HOME/.local/bin"
export PATH=/usr/local/bin:~/npm/bin:/usr/local/sbin:$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:~/.cabal/bin
export PATH=$PATH:~/.config/yarn/global/node_modules/.bin
export PATH=$PATH:$(go env GOPATH)/bin
export NVM_DIR=~/.nvm
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH=$(go env GOPATH)
export PATH="$JAVA_HOME/bin:$PATH"

source $HOME/.cargo/env
