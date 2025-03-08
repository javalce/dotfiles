export PNPM_HOME="/home/javalce/.local/share/pnpm"

# Añadir PNPM_HOME al PATH si no está ya presente
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && export PATH="$PNPM_HOME:$PATH"

# Configurar autocompletado si no está ya configurado
if [[ ! -f "$ZSH_CACHE_DIR/completions/_pnpm" ]]; then
  autoload -Uz _pnpm
  typeset -g -A _comps
  _comps[pnpm]=_pnpm
  pnpm completion zsh >|"$ZSH_CACHE_DIR/completions/_pnpm"
fi
