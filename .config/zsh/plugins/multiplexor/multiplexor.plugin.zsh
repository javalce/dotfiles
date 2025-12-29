() {
  check_environment() {
    local mux="$1"
    declare -p "$mux" &>/dev/null
    [[ $? -ne 0 && $- == *i* && -t 1 ]]
  }

  exec_multiplexor() {
    local mux="$1"
    local cmd="$2"
    if check_environment "$mux"; then
      exec $cmd
    fi
  }

  zstyle -s :plugin:multiplexor command multiplexor

  local multiplexors=("tmux" "zellij")
  [[ ! "${multiplexors[@]}" =~ "$multiplexor" ]] && return 1

  local command=${commands[$multiplexor]}
  [[ -z $command ]] && return 1

  if [[ "$multiplexor" == "tmux" ]]; then
    local tpm_plugin=~/.tmux/plugins/tpm
    if [ ! -d "$tpm_plugin" ]; then
      git clone https://github.com/tmux-plugins/tpm "$tpm_plugin"
    fi

    exec_multiplexor "TMUX" "$command"
  elif [[ "$multiplexor" == "zellij" ]]; then
    exec_multiplexor "ZELLIJ" "$command"
  fi

  unset -f check_environment exec_multiplexor
} ${0:h}
