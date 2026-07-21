() {
  [[ $- == *i* && -t 1 ]] || return 0

  case "$TERM_PROGRAM" in
    vscode|zed) return 0 ;;
  esac

  [[ "$TERMINAL_EMULATOR" == "JetBrains-JediTerm" ]] && return 0
  [[ "$GHOSTTY_QUICK_TERMINAL" == "1" ]] && return 0

  local multiplexor command

  zstyle -s :plugin:multiplexor command multiplexor || return 0

  command=${commands[$multiplexor]}
  [[ -z $command ]] && return 0

  if [[ "$multiplexor" == "tmux" && -n $TMUX ]] || [[ $multiplexor == "zellij" && -n $ZELLIJ ]]; then
    return 0
  fi

  exec "$command"
} ${0:h}
