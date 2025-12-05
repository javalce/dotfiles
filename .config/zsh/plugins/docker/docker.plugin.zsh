() {
  local command=${commands[fnm]}
  [[ -z $command ]] && return 1

  # generating completions
  local compfile=${ZSH_CACHE_DIR}/completions/_docker
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected new version 'docker'. Regenerated completion."
  fi
} ${0:h}
