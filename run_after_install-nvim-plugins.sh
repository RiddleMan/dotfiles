#!/usr/bin/env zsh

set -e

nvim --headless "+Lazy! sync" "+MasonUpdate" "+mkspell! ~/.config/nvim/spell/en.utf-8.add" +qa
