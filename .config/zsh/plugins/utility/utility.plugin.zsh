# Set preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  EDITOR='vim'
else
  EDITOR='nvim'
fi
