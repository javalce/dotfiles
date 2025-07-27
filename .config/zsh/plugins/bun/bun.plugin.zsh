() {
  add_to_path ${BUN_HOME}/bin

  local command=${commands[bun]}
  [[ -z $command ]] && return 1

  #generating completions
  local compfile=${ZSH_HOME}/functions/_bun
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    cp ${BUN_HOME}/_bun $compfile
    print -u2 -PR "* Detected new version 'bun'. Regenerated completions."
  fi
}
