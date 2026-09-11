#!/bin/zsh
#
# .zshrc - Run on interactive Zsh session.
#

# Load colors
autoload -U colors && colors

# Zsh configuration paths.
export ZSH_HOME=${HOME}/.config/zsh
export ZSH_PLUGINS=${ZSH_HOME}/plugins

# Starship configuration path.
export STARSHIP_CONFIG=${HOME}/.config/starship/starship.toml

# Add binary paths to $PATH if not already present.
[[ ":$PATH:" != *":$HOME/.local/bin:"* ]] && PATH="$HOME/.local/bin:$PATH"
[[ ":$PATH:" != *":$HOME/AppImages:"* ]] && PATH="$HOME/AppImages:$PATH"
[[ ":$PATH:" != *":$HOME/go/bin:"* ]] && PATH="$HOME/go/bin:$PATH"

# Lazy-load (autoload) custom Zsh function files from a directory
# Contains: open, pbcopy, pbpaste, y
fpath=($ZSH_HOME/functions $fpath)
autoload -Uz $ZSH_HOME/functions/*(N.:t)

# Set keybinding mode to emacs
bindkey -e

# Set preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=${commands[vim]:-vi}
else
  export EDITOR=${commands[nvim]:-${commands[vim]:-vi}}
fi


# Load zstyles file with customizations.
[[ -r ${ZSH_HOME}/.zstyles ]] && source ${ZSH_HOME}/.zstyles

# Load local user configuration (private, not version controlled)
local_config=${ZSH_HOME}/lib/local.zsh
[[ -f ${local_config} ]] || touch ${local_config} && source ${local_config}
unset local_config

# Load Zimfw plugin manager.
source $ZSH_HOME/lib/zimfw.zsh

export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# Always return success
true
