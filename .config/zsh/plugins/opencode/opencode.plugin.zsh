() {
  OPENCODE_BIN=${OPENCODE_BIN:-${HOME}/.opencode/bin}
  [[ ":$PATH:" != *":$OPENCODE_BIN:"* ]] && PATH="$OPENCODE_BIN:$PATH"

  local command=${commands[opencode]}
  [[ -z $command ]] && return 1

  # generating completions
  local compfile=$1/completion-for-opencode.zsh
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion >| $compfile
    zcompile -UR $compfile
    print -u2 -PR "* Detected new version 'opencode'. Regenerated completions."
  fi

  source $compfile
} ${0:h}

