(( ${+commands[tmux]} || ${+commands[zellij]} )) && () {
  if ! [[ -n "$MULTIPLEXOR" ]]; then
    return
  fi

  function _start_multiplexer() {
    local command
    local wm_var
    if [[ $MULTIPLEXOR == tmux ]]; then
      command=${commands[tmux]}
      vm_var="$TMUX"
    else
      command=${commands[zellij]}
      vm_var="$ZELLIJ"
    fi

    if [[ $- == *i* ]] && [[ -z "$vm_var" ]] && [[ -t 1 ]]; then
      exec $command
    fi
  }

  autoload -Uz add-zsh-hook
  add-zsh-hook precmd _start_multiplexer
}
