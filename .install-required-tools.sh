#!/bin/sh

set -e

has_xcode_clt() {
  xcode-select -p 1>/dev/null
}

has_1password() {
  type op >/dev/null 2>&1
}

has_homebrew() {
  type brew >/dev/null 2>&1
}

has_gnupg() {
  type gpg >/dev/null 2>&1
}

# exit immediately if xcode, op and brew are already in $PATH
has_xcode_clt && has_homebrew && has_1password && exit

case "$(uname -s)" in
Darwin)
  if ! has_xcode_clt; then
    xcode-select --install
  fi

  if ! has_homebrew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # shellcheck disable=SC2016
    (
      echo
      echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    ) >>/Users/Artur_Ptaszek/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi

  if ! has_1password; then
    brew install --cask 1password 1password-cli
  fi

  if ! has_gnupg; then
    brew install gnupg pinentry-mac yq
    gpg \
      --keyserver hkps://keys.openpgp.org \
      --recv-keys "$(yq -r '.gpg.recipient' ~/.config/chezmoi/chezmoi.toml)"
  fi
  ;;
*)
  echo "unsupported OS"
  exit 1
  ;;
esac
