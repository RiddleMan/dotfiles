#!/usr/bin/env zsh

# Load sub files
for filename in $HOME/zsh/aliases/{*.sh,*/aliases.sh}; do
  # Non-constant script couldn't be followed
  # shellcheck disable=SC1090
  source "$filename"
done

# Dotfiles
alias ra='source ${DOTFILES_DIR}/zsh/aliases.sh'
alias ea='$EDITOR $DOTFILES_DIR/zsh/aliases.sh'
alias preview="qlmanage -p "
alias cddot='cd $DOTFILES_DIR'
