_gen_py_completion() {
  local bin="$1"
  local compfile="$2"
  local gen_cmd="$3"
  if (( ${+commands[$bin]} )); then
    local command=${commands[$bin]}
    [[ -z $command ]] && return 1
    if [[ ! -e $compfile || $compfile -ot $command ]]; then
      eval "$command $gen_cmd >| $compfile"
      print -u2 -PR "* Detected new version '$bin'. Regenerated completions."
    fi
  fi
}

_gen_py_completion uv   "$ZSH_HOME/functions/_uv"     "generate-shell-completion zsh"
_gen_py_completion uvx  "$ZSH_HOME/functions/_uvx"    "--generate-shell-completion zsh"
_gen_py_completion poetry "$ZSH_HOME/functions/_poetry" "completions zsh"

unset -f _gen_py_completion
