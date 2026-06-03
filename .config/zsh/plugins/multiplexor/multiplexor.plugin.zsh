() {
  [[ $- == *i* && -t 1 ]] || return 0

  case "$TERM_PROGRAM" in
    vscode|zed) return 0 ;;
  esac

  zstyle -s :plugin:multiplexor command multiplexor

  local command=${commands[$multiplexor]}
  [[ -z $command ]] && return 1


  case "$multiplexor" in
    tmux)
      [[ -z $TMUX ]] || return 0

      local tpm_plugin=~/.tmux/plugins/tpm
      if [ ! -d "$tpm_plugin" ]; then
        git clone https://github.com/tmux-plugins/tpm "$tpm_plugin"
      fi

      exec $command
      ;;
    zellij)
      [[ -z $ZELLIJ ]] || return 0
      exec $command
      ;;
    *)
      return 0
      ;;
  esac
} ${0:h}
