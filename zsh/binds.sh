#!/usr/bin/env zsh

bindkey '^ ' autosuggest-accept
bindkey -v '^ ' autosuggest-accept

# Add Ctrl+N, Ctrl+P binding in viins (Insert mode)
bindkey -v '^P' up-history
bindkey -v '^N' down-history
