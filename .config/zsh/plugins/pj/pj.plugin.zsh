##? prj - project jumper

pj() {
  if ! command -v fzf >/dev/null; then
    echo "fzf command not found" >&2
    return 1
  fi

  if [[ -z "$PROJECT_PATHS" ]]; then
    echo "PROJECT_PATHS variable is not defined" >&2
    return 1
  fi

  local -a projects

  for basedir ($PROJECT_PATHS); do
    projects+=(${basedir}/*(/N))
  done

  local selection=$(printf "%s\n" ${projects[@]} | fzf --layout=reverse-list)

  if [[ -n $selection ]] && [[ -d $project_dir/$selection ]]; then
    cd $project_dir/$selection
  fi
}
