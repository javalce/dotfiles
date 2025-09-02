() {
  FNM_DIR=${FNM_DIR:-${HOME}/.local/share/fnm}
  [[ ":PATH:" != *":$FNM_DIR:"* ]] && PATH="$FNM_DIR:$PATH"

  local command=${commands[fnm]}
  [[ -z $command ]] && return 1

  # loading fnm environment
  if [[ -z "$FNM_MULTISHELL_PATH" ]]; then
    eval "$($command env --use-on-cd)"
  fi

  # generating completions
  local compfile=${ZSH_CACHE_DIR}/completions/_fnm
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completions --shell=zsh >| $compfile
    print -u2 -PR "* Detected new version 'fnm'. Regenerated completions."
  fi
} ${0:h}
