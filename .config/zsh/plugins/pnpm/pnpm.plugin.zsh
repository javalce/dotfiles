() {
  export PNPM_HOME=${PNPM_HOME:-$HOME/.local/share/pnpm}

  [[ ":$PATH:" != *":$PNPM_HOME:"* ]] && PATH="$PNPM_HOME:$PATH"

  local command=${commands[pnpm]}
  [[ -z $command ]] && return 1

  # generating completions
  local compfile=$1/completion-for-pnpm.zsh
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    zcompile -UR $compfile
    print -u2 -PR "* Detected new version 'pnpm'. Regenerated completions."
  fi

  source $compfile
} ${0:h}
