# User path
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export EDITOR="vim"

# ANTIGEN PLUGIN MANAGER
source /usr/share/zsh-antigen/antigen.zsh

# load plugins
antigen use oh-my-zsh

antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle copybuffer
antigen bundle copyfile
antigen bundle git
antigen bundle git-flow-avh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

fpath+=~/.zfunc
autoload -Uz compinit && compinit

# some more ls aliases
alias ll='ls -alh'
alias la='ls -Alh'
alias l='ls -CF'

# add new aliases
alias sshk='kitty +kitten ssh'
alias icat='kitty +kitten icat'
alias diffk='kitty +kitten diff'
# alias open='xdg-open'

# yadm alias
alias yadmsync="yadm add -u && yadm commit && yadm push"

# Load starship prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# Load zoxide (z command)
eval "$(zoxide init zsh)"

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"

# Angular CLI completion
source <(ng completion script)
