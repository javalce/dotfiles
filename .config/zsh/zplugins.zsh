function {
  0=${(%):-%x}
  local staticfile=${0:A}
  [[ -e ${staticfile} ]] || return 1
  if [[ ! -s ${staticfile}.zwc || ${staticfile} -nt ${staticfile}.zwc ]]; then
    builtin autoload -Uz zrecompile
    zrecompile -pq ${staticfile}
  fi
}
fpath+=( "$HOME/.cache/repos/getantidote/use-omz" )
source "$HOME/.cache/repos/getantidote/use-omz/use-omz.plugin.zsh"
fpath+=( "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib" )
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/async_prompt.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/bzr.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/clipboard.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/cli.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/compfix.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/completion.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/correction.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/diagnostics.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/directories.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/functions.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/git.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/grep.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/history.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/key-bindings.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/misc.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/nvm.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/prompt_info_functions.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/spectrum.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/termsupport.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/theme-and-appearance.zsh"
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/lib/vcs_info.zsh"
fpath+=( "$HOME/.cache/repos/ohmyzsh/ohmyzsh/plugins/aliases" )
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/plugins/aliases/aliases.plugin.zsh"
fpath+=( "$HOME/.cache/repos/ohmyzsh/ohmyzsh/plugins/colored-man-pages" )
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/plugins/colored-man-pages/colored-man-pages.plugin.zsh"
fpath+=( "$HOME/.cache/repos/ohmyzsh/ohmyzsh/plugins/git" )
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/plugins/git/git.plugin.zsh"
fpath+=( "$HOME/.cache/repos/ohmyzsh/ohmyzsh/plugins/pj" )
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/plugins/pj/pj.plugin.zsh"
fpath+=( "$HOME/.cache/repos/ohmyzsh/ohmyzsh/plugins/starship" )
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/plugins/starship/starship.plugin.zsh"
fpath+=( "$HOME/.cache/repos/ohmyzsh/ohmyzsh/plugins/zoxide" )
source "$HOME/.cache/repos/ohmyzsh/ohmyzsh/plugins/zoxide/zoxide.plugin.zsh"
fpath+=( "$ZSH_CUSTOM/atuin" )
source "$ZSH_CUSTOM/atuin/atuin.plugin.zsh"
fpath+=( "$ZSH_CUSTOM/aliases" )
source "$ZSH_CUSTOM/aliases/aliases.plugin.zsh"
fpath+=( "$ZSH_CUSTOM/fnm" )
source "$ZSH_CUSTOM/fnm/fnm.plugin.zsh"
fpath+=( "$ZSH_CUSTOM/pnpm" )
source "$ZSH_CUSTOM/pnpm/pnpm.plugin.zsh"
fpath+=( "$ZSH_CUSTOM/bun" )
source "$ZSH_CUSTOM/bun/bun.plugin.zsh"
fpath+=( "$ZSH_CUSTOM/pipx" )
source "$ZSH_CUSTOM/pipx/pipx.plugin.zsh"
fpath+=( "$ZSH_CUSTOM/poetry" )
source "$ZSH_CUSTOM/poetry/poetry.plugin.zsh"
fpath+=( "$ZSH_CUSTOM/uv" )
source "$ZSH_CUSTOM/uv/uv.plugin.zsh"
fpath+=( "$ZSH_CUSTOM/utility" )
source "$ZSH_CUSTOM/utility/utility.plugin.zsh"
fpath+=( "$HOME/.cache/repos/zsh-users/zsh-completions/src" )
fpath+=( "$HOME/.cache/repos/zsh-users/zsh-autosuggestions" )
source "$HOME/.cache/repos/zsh-users/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
fpath+=( "$HOME/.cache/repos/zsh-users/zsh-syntax-highlighting" )
source "$HOME/.cache/repos/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
