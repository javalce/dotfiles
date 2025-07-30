() {
  add_to_path ${FNM_HOME}

  local command=${commands[fnm]}
  [[ -z $command ]] && return 1

  # loading fnm environment
  if [[ -z "$FNM_MULTISHELL_PATH" ]]; then
    eval "$($command env --use-on-cd)"
  fi

  # generating completions
  local compfile=${ZSH_HOME}/functions/_fnm
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completions --shell=zsh >| $compfile
    print -u2 -PR "* Detected new version 'fnm'. Regenerated completions."
  fi
} ${0:h}
