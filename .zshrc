# User path
if ! [[ "$PATH" =~ $HOME/bin:$HOME/.local/bin ]]; then
    export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
fi

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
fi

# ANTIGEN PLUGINS
function load_antigen_config() {
    if [ -d /usr/share/zsh-antigen ]; then
        source /usr/share/zsh-antigen/antigen.zsh
    elif [ -f /usr/share/zsh/share/antigen.zsh ]; then
        source /usr/share/zsh/share/antigen.zsh
    fi

    # load plugins
    if command -v antigen &>/dev/null; then
        antigen use oh-my-zsh

        antigen bundle colored-man-pages
        antigen bundle command-not-found
        antigen bundle git
        antigen bundle git-flow-avh

        antigen bundle zsh-users/zsh-syntax-highlighting
        antigen bundle zsh-users/zsh-autosuggestions

        antigen apply
    fi
}

# ZPLUG PLUGINS
function load_zplug_config() {
    if [ -d /usr/share/zplug ]; then
        source /usr/share/zplug/init.zsh
    elif [ -d /usr/share/zsh/share/zplug ]; then
        source /usr/share/zsh/share/zplug/init.zsh
    fi

    if command -v zplug &>/dev/null; then
        # load oh-my-zsh config
        zplug "lib/clipboard", from:oh-my-zsh
        zplug "lib/compfix", from:oh-my-zsh
        zplug "lib/completion", from:oh-my-zsh
        zplug "lib/grep", from:oh-my-zsh
        zplug "lib/key-bindings", from:oh-my-zsh

        # load oh-my-zsh plugins
        zplug "plugins/colored-man-pages", from:oh-my-zsh
        zplug "plugins/command-not-found", from:oh-my-zsh
        zplug "plugins/git", from:oh-my-zsh
        zplug "plugins/git-flow-avh", from:oh-my-zsh

        # load zsh-syntax-highlighting and zsh-autosuggestions
        zplug "zsh-users/zsh-syntax-highlighting", from:github
        zplug "zsh-users/zsh-autosuggestions", from:github

        # zplug check returns true if all packages are installed
        # Therefore, when it returns false, run zplug install
        if ! zplug check; then zplug install; fi

        # source plugins and add commands to the PATH
        zplug load
    fi
}

ZSH_PLUGIN="zplug"
case "$ZSH_PLUGIN" in
antigen)
    load_antigen_config
    ;;
zplug)
    load_zplug_config
    ;;
esac
unset ZSH_PLUGIN load_antigen_config load_zplug_config

fpath+=~/.zfunc
autoload -U compinit && compinit

# some more ls aliases
alias ll='ls -alh'
alias la='ls -Alh'
alias l='ls -CF'

# add new aliases
alias sshk='kitty +kitten ssh'
alias icat='kitty +kitten icat'
alias diffk='kitty +kitten diff'
# alias open='xdg-open'

export EDITOR="vim"

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
