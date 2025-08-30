if (( ! ${+commands[uv]} )); then
  return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_uv" ]]; then
  typeset -g -A _comps
  autoload -Uz _uv
  _comps[uv]=_uv
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_uvx" ]]; then
  typeset -g -A _comps
  autoload -Uz _uvx
  _comps[uvx]=_uvx
fi

uv generate-shell-completion zsh >| "$ZSH_CACHE_DIR/completions/_uv" &|
uvx --generate-shell-completion zsh >| "$ZSH_CACHE_DIR/completions/_uvx" &|
