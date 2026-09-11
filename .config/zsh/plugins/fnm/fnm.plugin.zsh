() {
  if [[ -z $FNM_DIR ]]; then
    if [[ -d "$HOME/.fnm" ]]; then
      FNM_DIR="$HOME/.fnm"
    elif [[ -n "$XDG_DATA_HOME" ]]; then
      FNM_DIR="$XDG_DATA_HOME/fnm"
    elif [[ "$OS" = "Darwin" ]]; then
      FNM_DIR="$HOME/Library/Application Support/fnm"
    else
      FNM_DIR="$HOME/.local/share/fnm"
    fi
  fi

  [[ -d "$FNM_DIR" ]] || return 0

  [[ ":$PATH:" != *":$FNM_DIR:"* ]] && PATH="$FNM_DIR:$PATH"

  local command=${commands[fnm]}
  [[ -z $command ]] && return 1

  # generating completions
  local compfile=$1/functions/_fnm
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completions --shell=zsh >| $compfile
    print -u2 -PR "* Detected new version 'fnm'. Regenerated completions."
  fi

  # loading fnm environment
  local -a fnm_env_cmd
  if zstyle -T ':plugins:fnm' use-on-cd; then
    fnm_env_cmd+=("--use-on-cd")
  fi
  eval "$($command env --shell=zsh $fnm_env_cmd)"
} ${0:h}
