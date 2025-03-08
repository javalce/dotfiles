export FNM_DIR="$HOME/.local/share/fnm"

[[ ":$PATH:" != *":$FNM_DIR:"* ]] && export PATH="$FNM_DIR:$PATH" && eval "$(fnm env --use-on-cd)"

if [[ ! -f "$ZSH_CACHE_DIR/completions/_fnm" ]]; then
  autoload -Uz _fnm
  typeset -g -A _comps
  _comps[fnm]=_fnm
  fnm completions --shell=zsh >|"$ZSH_CACHE_DIR/completions/_fnm"
fi
