export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

zstyle ':omz:update' mode auto              # update automatically without asking
zstyle ':omz:lib:directories' aliases no    # remove disgusting directory aliases
zstyle ':omz:lib:misc' aliases no           # remove disgusting sudo alias

export STARSHIP_CONFIG=${HOME}/.config/starship/starship.toml

# Oh My Zsh plugins
plugins=(
  aliases                     # Search aliases
  aws                         # AWS completion and utiliy commands
  colored-man-pages           # The name says it all
  copyfile                    # Copy the content of a file to the clipboard
  copybuffer                  # Copy the content selection to the clipboard
  git                         # Git aliases
  pj                          # cd to local projects with completions
  starship                    # Prompt
  zoxide                      # Quick directory jumping
  zsh-autosuggestions         # Suggest commands based on history
  zsh-syntax-highlighting     # Syntax highlighting
  autoupdate                  # Auto update Oh My Zsh custom plugins and themes

  # Custom plugins
  utility
)

fpath+=(
  ${ZSH_CUSTOM}/plugins/zsh-completions/src
  ${HOME}/.zfunc
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

PROJECT_PATHS=(
  ${HOME}/Work/TheWiseDreams
  ${HOME}/Work/UV
  ${HOME}/Dev
)

# FNM (Fast Node Manager)
export FNM_DIR="$HOME/.local/share/fnm"
export PATH="$FNM_DIR:$PATH"
eval "$(fnm env --use-on-cd)"

# pnpm
export PNPM_HOME="/home/javalce/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
