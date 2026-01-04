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

# Lazy-load (autoload) Zsh function files from a directory
fpath=($ZSH_HOME/functions $fpath)
autoload -Uz $ZSH_HOME/functions/*(N.:t)

# Set keybinding mode to emacs
bindkey -e

# Set preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Load zstyles file with customizations.
[[ -r ${ZSH_HOME}/.zstyles ]] && source ${ZSH_HOME}/.zstyles

# Load local config
local_config=${ZSH_HOME}/lib/local.zsh
[[ -r ${local_config} ]] || touch ${local_config} && source ${local_config}
unset local_config

# Load Zimfw plugin manager.
source $ZSH_HOME/lib/zimfw.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Always return success
true
