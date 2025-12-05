() {
  export PNPM_HOME=${PNPM_HOME:-$HOME/.local/share/pnpm}

  [[ ":$PATH:" != *":$PNPM_HOME:"* ]] && PATH="$PNPM_HOME:$PATH"

  local command=${commands[pnpm]}
  [[ -z $command ]] && return 1

  # generating completions
  local compfile=${ZSH_CACHE_DIR}/completions/_pnpm
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected new version 'pnpm'. Regenerated completions."
  fi
}
