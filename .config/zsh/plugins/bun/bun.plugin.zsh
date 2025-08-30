BUN_INSTALL=$HOME/.bun

# [ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

[[ ":PATH:" != *":$BUN_INSTALL/bin:"* ]] && PATH="$BUN_INSTALL/bin:$PATH"

if [[ ! -f "$ZSH_CACHE_DIR/completions/_bun" ]]; then
  autoload -Uz _bun
  typeset -g -A _comps
  _comps[bun]=_bun
fi

cat $BUN_INSTALL/_bun >|"$ZSH_CACHE_DIR/completions/_bun" &|
