export PATH=$HOME/bin:$HOME/.local/bin:$PATH

ANTIDOTE_HOME=${ZDOTDIR:-${HOME}}/.antidote
zplugins=${ZDOTDIR:-${HOME}}/.zplugins

[[ -e ${ANTIDOTE_HOME} ]] || git clone --depth=1 https://github.com/mattmc3/antidote.git $ANTIDOTE_HOME

[[ -f ${zplugins} ]] || touch ${zplugins}

fpath=(${ANTIDOTE_HOME}/functions $fpath)
autoload -Uz antidote

if [[ ! ${zplugins}.zsh -nt ${zplugins} ]]; then
  antidote bundle <${zplugins} >|${zplugins}.zsh
fi

source ${zplugins}.zsh

unset zplugins ANTIDOTE_HOME

fpath+=(~/.zfunc)

# User configuration


PROJECT_PATHS=(~/Work ~/Dev)

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# FNM (Fast Node Manager)
export FNM_DIR="$HOME/.local/share/fnm"
case ":$PATH:" in
*":$FNM_DIR:"*) ;;
*)
  export PATH="$FNM_DIR:$PATH"
  eval "$(fnm env --use-on-cd)"
  ;;
esac

# pnpm
export PNPM_HOME="/home/javalce/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
case ":$PATH:" in
*":$BUN_INSTALL/bin:"*) ;;
*) export PATH="$BUN_INSTALL/bin:$PATH" ;;
esac

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
