_gen_py_completion() {
  local bin="$1"
  local compfile="$2"
  local gen_cmd="$3"
  if (( ${+commands[$bin]} )); then
    local command=${commands[$bin]}
    [[ -z $command ]] && return 1
    if [[ ! -e $compfile || $compfile -ot $command ]]; then
      if print -rl -- $gen_cmd | grep -q -- "$bin"; then
        eval "$gen_cmd >| $compfile"
      else
        eval "$command $gen_cmd >| $compfile"
      fi
      print -u2 -PR "* Detected new version '$bin'. Regenerated completions."
    fi
  fi
}

_gen_py_completion pipx "$ZSH_CACHE_DIR/completions/_pipx"   "register-python-argcomplete pipx"
_gen_py_completion uv   "$ZSH_CACHE_DIR/completions/_uv"     "generate-shell-completion zsh"
_gen_py_completion uvx  "$ZSH_CACHE_DIR/completions/_uvx"    "--generate-shell-completion zsh"
_gen_py_completion poetry "$ZSH_CACHE_DIR/completions/_poetry" "completions zsh"

unset -f _gen_py_completion
