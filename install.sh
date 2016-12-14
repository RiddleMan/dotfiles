#!/bin/sh

#VIM links
ln -sf $DOTFILES_DIR/vim/.vimrc ~/.vimrc

# GIT links
ln -sf $DOTFILES_DIR/git/.gitconfig ~/.gitconfig
ln -sf $DOTFILES_DIR/git/.gitignore_global ~/.gitignore_global
ln -sf $DOTFILES_DIR/git/.gitk ~/.gitk

# ZSH links
ln -sf $DOTFILES_DIR/zsh/.zshrc ~/.zshrc

# OS X defaults
source ./defaults.sh
