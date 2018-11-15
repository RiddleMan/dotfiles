#!/bin/sh
# Turns off useless dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock

# Turns off Character Accent Menu
defaults write -g ApplePressAndHoldEnabled -bool false

# Turns off desktop icons
defaults write com.apple.finder CreateDesktop false; killall Finder

# Iterm2
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$DOTFILES_DIR/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
