() {
  add_to_path "$PNPM_HOME"

  local command=${commands[pnpm]}
  [[ -z $command ]] && return 1

  # generating completions
  local compfile=${ZSH_HOME}/functions/_pnpm
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected new version 'pnpm'. Regenerated completions."
  fi
}
