if ((!$+commands[pipx])); then
  return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_pipx" ]]; then
  typeset -g -A _comps
  autoload -Uz _pipx
  _comps[pipx]=_pipx
fi

register-python-argcomplete pipx >|"$ZSH_CACHE_DIR/completions/_pipx" &|
