export EDITOR="nvim"

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
alias vim='nvim'
# alias open='xdg-open'

# yadm alias
alias yadmsync="yadm add -u && yadm commit && yadm push"

# Load starship prompt
if command -v starship &>/dev/null; then
  export STARSHIP_CONFIG=~/.config/starship/starship.toml
  eval "$(starship init zsh)"
fi

# Load zoxide (z command)
if command -v zoxide &>/dev/null; then eval "$(zoxide init zsh)"; fi

# fnm
if [ -d "$HOME/.local/share/fnm" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
fi

# Angular CLI completion
if command -v ng &>/dev/null; then source <(ng completion script); fi

# pnpm
export PNPM_HOME="/home/javalce/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
