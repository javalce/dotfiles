PNPM_HOME=${PNPM_HOME:-${HOME}/.local/share/pnpm}

[[ ":PATH:" != *":$PNPM_HOME:"* ]] && PATH="$PNPM_HOME:$PATH"

if [[ ! -f "$ZSH_CACHE_DIR/completions/_pnpm" ]]; then
  autoload -Uz _pnpm
  typeset -g -A _comps
  _comps[pnpm]=_pnpm
fi

pnpm completion zsh >|"$ZSH_CACHE_DIR/completions/_pnpm" &|
