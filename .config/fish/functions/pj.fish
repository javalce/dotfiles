##? prj - project jumper

# pj [path]
# - si se pasa un path y existe, fzf buscará solo en ese path
# - si no se pasa parámetro o el path pasado no existe, buscará en todos PROJECT_PATHS
function pj
    # pj [group]
    # Optimized: stream directories to fzf, prefer fd, avoid building large lists.
    set -l target_arg $argv[1]

    if not type -q fzf
        printf 'pj: "fzf" not found. Please install fzf to use this command (https://github.com/junegunn/fzf)\n' >&2
        return 1
    end

    if not set -q PROJECT_PATHS
        printf 'pj: PROJECT_PATHS is not defined. Example:\n  set -a PROJECT_PATHS $HOME/Documents\n' >&2
        return 1
    end

    # Preferir fd si está disponible
    set -l have_fd 0
    if type -q fd
        set have_fd 1
    end

    # Si hay argumento, mapear short -> base en una pasada y validar
    set -l search_paths
    if test -n "$target_arg"
        set -l found_base
        for base in $PROJECT_PATHS
            if not test -d "$base"
                continue
            end
            set -l bname (basename "$base")
            set -l short (string lower $bname)
            set short (string replace -r '[^[:alnum:]]+' '' $short)
            if test "$short" = "$target_arg"
                set found_base $base
                break
            end
        end
        if test -z "$found_base"
            # construir lista de válidos para mensaje
            set -l valids
            for base in $PROJECT_PATHS
                if test -d "$base"
                    set -l nm (basename "$base")
                    set nm (string lower $nm)
                    set nm (string replace -r '[^[:alnum:]]+' '' $nm)
                    if test -n "$nm"
                        set valids $valids $nm
                    end
                end
            end
            set -l valid_list (string join ', ' $valids)
            printf "pj: unknown project group '%s'. Valid groups: %s\n" $target_arg $valid_list >&2
            return 1
        end
        set search_paths $found_base
    else
        set search_paths $PROJECT_PATHS
    end

    # Construir la lista en memoria y pasarla a fzf
    set -l projects
    for base in $search_paths
        if test -d "$base"
            if test $have_fd -eq 1
                for d in (fd --type d --max-depth 1 --absolute-path . "$base" 2>/dev/null)
                    set projects $projects $d
                end
            else
                for d in (find "$base" -maxdepth 1 -mindepth 1 -type d 2>/dev/null)
                    set projects $projects $d
                end
            end
        end
    end

    if test (count $projects) -eq 0
        set -l search_list (string join ', ' $search_paths)
        printf "pj: no projects found in: %s\n" $search_list >&2
        return 1
    end

    set -l selection (printf "%s\n" $projects | fzf --layout=reverse-list)

    if test -n "$selection" -a -d "$selection"
        echo "Selected directory: $selection"
        cd "$selection" || return
    end
end
