() {
  local command=${commands[atuin]}
  [[ -z $command ]] && return 1

  local initfile=$1/atuin-init.zsh
  if [[ ! -e $initfile || $initfile -ot $command ]]; then
    $command init zsh --disable-up-arrow >| $initfile
    zcompile -UR $initfile
  fi

  source $initfile
} ${0:h}
