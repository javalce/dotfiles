#
# aliases - Zsh and bash aliases
#

# Remove BAD aliases set by OMZ
unalias '...'
unalias '....'
unalias '.....'
unalias '......'
unalias '_'
unalias -- '-'
unalias '1'
unalias '2'
unalias '3'
unalias '4'
unalias '5'
unalias '6'
unalias '7'
unalias '8'
unalias '9'

# Ensure pbcopy/pbpaste commands exist.
if ! (($+commands[pbcopy])); then
  if [[ "$OSTYPE" == cygwin* ]]; then
    alias pbcopy='tee > /dev/clipboard'
    alias pbpaste='cat /dev/clipboard'
  elif [[ "$OSTYPE" == linux-android ]]; then
    alias pbcopy='termux-clipboard-set'
    alias pbpaste='termux-clipboard-get'
  elif [[ -n $WAYLAND_DISPLAY ]] && (($+commands[wl-copy] && $+commands[wl-paste])); then
    alias pbcopy='wl-copy'
    alias pbpaste='wl-paste'
  elif [[ -n $DISPLAY ]]; then
    if (($+commands[xclip])); then
      alias pbcopy='xclip -selection clipboard -in'
      alias pbpaste='xclip -selection clipboard -out'
    elif (($+commands[xsel])); then
      alias pbcopy='xsel --clipboard --input'
      alias pbpaste='xsel --clipboard --output'
    fi
  fi
fi

if ! (($+commands[open])) && (($+commands[xdg-open])); then
    alias open='xdg-open'
fi

# Use lsd as a replacement for ls
alias ls='lsd'
