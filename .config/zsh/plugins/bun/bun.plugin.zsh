() {
  BUN_INSTALL=$HOME/.bun
  [[ ":PATH:" != *":$BUN_INSTALL/bin:"* ]] && PATH="$BUN_INSTALL/bin:$PATH"

  local command=${commands[bun]}
  [[ -z $command ]] && return 1

  #generating completions
  local compfile=${ZSH_CACHE_DIR}/completions/_bun
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    cp ${BUN_INSTALL}/_bun $compfile
    print -u2 -PR "* Detected new version 'bun'. Regenerated completions."
  fi
}
