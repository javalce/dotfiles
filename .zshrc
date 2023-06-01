# User path
if ! [[ "$PATH" =~ $HOME/bin:$HOME/.local/bin ]]; then
    export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
fi

# ANTIGEN PLUGINS
if [ -d /usr/share/zsh-antigen ]; then
    source /usr/share/zsh-antigen/antigen.zsh
else
    source /usr/share/zsh/share/antigen.zsh
fi

antigen use oh-my-zsh
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle copybuffer
antigen bundle copyfile
antigen bundle ripgrep
antigen bundle virtualenv
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle bobthecow/git-flow-completion
antigen apply

fpath+=~/.zfunc
autoload -Uz compinit && compinit

# remove unwanted aliases
unalias -- -
unalias \...
unalias \....
unalias \.....
unalias \......
unalias 1
unalias 2
unalias 3
unalias 4
unalias 5
unalias 6
unalias 7
unalias 8
unalias 9
unalias _

# add new aliases
alias ll="ls -alF"
alias vim="nvim"
alias sshk='kitty +kitten ssh'
alias icat='kitty +kitten icat'
alias diffk='kitty +kitten diff'
alias open='xdg-open'

export EDITOR="nvim"

# yadm alias
alias yadmsync="yadm add -u && yadm commit && yadm push"

# Load starship theme
if command -v starship &>/dev/null; then
    export STARSHIP_CONFIG=~/.config/starship/starship.toml
    eval "$(starship init zsh)";
fi

# Load zoxide (z command)
if command -v zoxide &>/dev/null; then eval "$(zoxide init zsh)"; fi

# source <(kubectl completion zsh)
# source <(minikube completion zsh)

# fnm
if [ -d "$HOME/.local/share/fnm" ]; then
    export PATH="$HOME/.local/share/fnm:$PATH"
    eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
fi

# Angular CLI completion
# if command -v ng &>/dev/null; then source <(ng completion script); fi
