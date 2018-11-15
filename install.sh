#!/bin/sh

chmod +x ./install-software.sh
./install-software.sh

# SSH Link
ln -s $DOTFILES_DIR/ssh/config ~/.ssh

pip install powerline

#VIM links
ln -sf $DOTFILES_DIR/vim/.vimrc ~/.vimrc

# GIT links
ln -sf $DOTFILES_DIR/git/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/git/.gitignore_global ~/.gitignore_global
ln -sf $DOTFILES_DIR/git/.gitk ~/.gitk

# ZSH links
ln -sf $DOTFILES_DIR/zsh/.zshrc ~/.zshrc

# Karabiner link
ln -s $DOTFILES_DIR/karabiner ~/.config

# OS X defaults
source ./defaults.sh

#automation
chmod +x ./automation/spotify/getCurrentTrack.js
chmod +x ./automation/spotify/toggleShuffle.js
