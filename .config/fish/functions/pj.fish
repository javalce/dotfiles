##? prj - project jumper

function pj
    if not type -q fzf
        echo "fzf command not found" >&2
        return 1
    end

    if not set -q PROJECT_PATHS
        echo "PROJECT_PATHS variable is not defined" >&2
        return 1
    end

    set -l projects
    for basedir in $PROJECT_PATHS
        for dir in (find $basedir -maxdepth 1 -type d | grep -v "^$basedir\$")
            set projects $projects $dir
        end
    end

    set -l selection (printf "%s\n" $projects | fzf --layout=reverse-list)

    if test -n "$selection"; and test -d "$selection"
        cd $selection
    end
end
