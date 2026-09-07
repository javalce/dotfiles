() {
  local command=${commands[herdr]}
  [[ -z $command ]] && return 1

  # generating completions
  local compfile=$1/functions/_herdr
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completions zsh >| $compfile
    print -u2 -PR "* Detected new version 'herdr'. Regenerated completions."
  fi
} ${0:h}

