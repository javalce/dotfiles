() {
  local functions_dir="$1/functions"

  _gen_py_completion() {
    local bin="$1"
    local compfile="$functions_dir/_$bin"
    local gen_cmd="$2"
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

  _gen_py_completion pipx   "register-python-argcomplete pipx"
  _gen_py_completion uv     "generate-shell-completion zsh"
  _gen_py_completion uvx    "--generate-shell-completion zsh"
  _gen_py_completion poetry "completions zsh"

  unset -f _gen_py_completion
} ${0:h}
