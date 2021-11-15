#!/usr/bin/env bash

set -xe

DOTFILES_DIR=~/Projects/dotfiles
chmod +x ./install-software.sh
./install-software.sh

# SSH Link
ln -sf $DOTFILES_DIR/ssh/config ~/.ssh

pip3 install powerline-status || true

#VIM links
ln -sf $DOTFILES_DIR/vim/.vimrc ~/.vimrc

# GIT links
ln -sf $DOTFILES_DIR/git/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/git/.gitignore_global ~/.gitignore_global
ln -sf $DOTFILES_DIR/git/.gitk ~/.gitk

# ZSH links
ln -sf $DOTFILES_DIR/zsh/.zshrc ~/.zshrc

pushd ${ZSH_CUSTOM:-$ZSH/custom}/plugins
git clone https://github.com/iam4x/zsh-iterm-touchbar.git || true
git clone https://github.com/zsh-users/zsh-autosuggestions || true
popd

# Karabiner link
ln -sf $DOTFILES_DIR/karabiner ~/.config

# Powerline config
ln -sf $DOTFILES_DIR/powerline ~/.config

# OS X defaults
source ./defaults.sh

# Alacritty
ln -sf $DOTFILES_DIR/alacritty ~/.config

#automation
chmod +x ./automation/spotify/getCurrentTrack.js
chmod +x ./automation/spotify/toggleShuffle.js

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim || true
vim +PluginInstall +qall

ln -sf $DOTFILES_DIR/tmux/.tmux.conf ~

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
~/.tmux/plugins/tpm/bin/install_plugins

# Install the latest LTS version of node
nvm install --lts --default

# FZF bindings
$(brew --prefix)/opt/fzf/install \
  --no-bash \
  --key-bindings \
  --completion \
  --no-update-rc

# Terraform
ln -sf $DOTFILES_DIR/terraform/.terraformrc ~/.terraformrc
