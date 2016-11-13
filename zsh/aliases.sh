#!/usr/bin/env zsh

# Load sub files
for filename in $DOTFILES_DIR/zsh/aliases/{*.sh,*/aliases.sh}; do
    source $filename
done

# Dotfiles
alias ra="source ${DOTFILES_DIR}/zsh/aliases.sh"
alias ea="$EDITOR $DOTFILES_DIR/zsh/aliases.sh"
alias preview="qlmanage -p "
alias cddot="cd $DOTFILES_DIR"
