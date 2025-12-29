() {
  FNM_DIR=${FNM_DIR:-${HOME}/.local/share/fnm}
  [[ ":$PATH:" != *":$FNM_DIR:"* ]] && PATH="$FNM_DIR:$PATH"

  local command=${commands[fnm]}
  [[ -z $command ]] && return 1

  # generating completions
  local compfile=$1/functions/_fnm
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completions --shell=zsh >| $compfile
    print -u2 -PR "* Detected new version 'fnm'. Regenerated completions."
  fi

  # sourcing init file only if FNM_MULTISHELL_PATH is not set
  if [[ -z "$FNM_MULTISHELL_PATH" ]]; then
    eval "$($command env --use-on-cd --shell zsh)"
  fi
} ${0:h}
