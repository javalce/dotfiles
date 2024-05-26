#!/usr/bin/env bash

command_exists() {
	type "$1" &>/dev/null
}

if command_exists batcat; then
	alias cat='batcat'
elif command_exists bat; then
	alias cat='bat'
fi

# some more ls aliases
# alias ll='ls -alh'
# alias la='ls -Alh'
# alias l='ls -CF'

# add new aliases
alias sshk='kitty +kitten ssh'
alias icat='kitty +kitten icat'
alias diffk='kitty +kitten diff'

alias vim='nvim'

# yadm alias
alias yadmsync="yadm add -u && yadm commit && yadm push"
