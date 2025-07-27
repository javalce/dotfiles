() {
  add_to_path ${FNM_HOME}

  local command=${commands[fnm]}
  [[ -z $command ]] && return 1

  # generating init file
  local initfile=$1/fnm-init.zsh
  if [[ ! -e $initfile || $initfile -ot $command ]]; then
    $command env --use-on-cd >| $initfile
    zcompile -UR $initfile
  fi

  # generating completions
  local compfile=${ZSH_HOME}/functions/_fnm
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completions --shell=zsh >| $compfile
    print -u2 -PR "* Detected new version 'fnm'. Regenerated completions."
  fi

  source $initfile
} ${0:h}
