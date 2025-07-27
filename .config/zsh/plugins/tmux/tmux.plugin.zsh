(( ${+commands[tmux]} )) && () {
  if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  function _start_multiplexer() {
    local command=${commands[tmux]}
    if [[ $- == *i* ]] && [[ -z "$TMUX" ]] && [[ -t 1 ]]; then
      exec $command
    fi
  }

  autoload -Uz add-zsh-hook
  add-zsh-hook precmd _start_multiplexer
}
