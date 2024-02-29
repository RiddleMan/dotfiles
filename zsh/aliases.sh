#!/usr/bin/env sh

# Load sub files
find "$HOME/zsh/aliases" -name '*.sh' -type f -exec echo {} \; | while read -r filename; do
  # Non-constant script couldn't be followed
  # shellcheck source=/dev/null
  . "$filename"
done

# Dotfiles
alias ra='source ${HOME}/zsh/aliases.sh'
alias ea='$EDITOR ${HOME}/zsh/aliases.sh'
alias preview="qlmanage -p "
