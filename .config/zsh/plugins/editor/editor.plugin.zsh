# Use emacs key bindings

if zstyle -t ':plugin:editor' emacs; then
  bindkey -e
else
  bindkey -v
fi

# Set preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
