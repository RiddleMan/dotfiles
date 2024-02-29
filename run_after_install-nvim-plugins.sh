#!/usr/bin/env sh

set -e

nvim --headless "+Lazy! restore" "+MasonUpdate" "+DapInstall" "+mkspell! ~/.config/nvim/spell/en.utf-8.add" +qa
