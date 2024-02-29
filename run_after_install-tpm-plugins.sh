#!/usr/bin/env sh

set -e

have_plugins_been_installed() {
  for dir in ~/.tmux/plugins/*; do
    case $dir in
    *tpm) continue ;;
    *) return 0 ;;
    esac
  done

  return 1
}

if ! have_plugins_been_installed; then
  echo "Installing tmux plugins..."
  ~/.tmux/plugins/tpm/bin/install_plugins
else
  echo "Updating tmux plugins..."
  ~/.tmux/plugins/tpm/bin/update_plugins all
fi
