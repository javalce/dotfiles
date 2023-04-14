#!/bin/bash

set -euo pipefail

FILENAME=

function err() {
    echo "$0: $*" >&2
    echo "Use $0 --help to get more information"
    exit 1
}

function help() {
    echo "Usage: $0 [OPTIONS] [FILENAME]"
    echo
    echo "Options:"
    echo "  -h, --help          Displays this help"
}

function generate_script() {
    cat <<EOF >"$FILENAME"
#!/bin/bash

set -euo pipefail

function err() {
    echo "\$0: \$*" >&2
    echo "Use \$0 --help to get more information"
    exit 1
}

function help() {
    echo "Usage \$0 [OPTIONS] [COMMAND]"
    echo ""
    echo "Options:"
    echo "  -h, --help          Displays this help"
    echo ""
    echo "Commands:"
}

function check_command() {
    if ! command -v "\$1" &>/dev/null; then
        err "\$1 could not be found"
    fi
}

OPTS=\$(getopt \\
    --longoptions "help" \\
    --name "\$(basename "\$0")" \\
    --options ":h" \\
    -- "\$@")
eval set --"\$OPTS"

while [[ \$# -gt 0 ]]; do
    case "\$1" in
    -h | --help)
        help
        exit 0
        ;;
    *)
        shift
        break
        ;;
    esac
done

if [ \$# -eq 0 ]; then
    err "Requires an argument"
fi

COMMAND="\$1"

function main() {
    case "\$COMMAND" in
    *) err "Command '\$COMMAND' is not valid" ;;
    esac
}

main
EOF

    chmod 755 "$FILENAME"
}

OPTS=$(getopt \
    --longoptions "help" \
    --name "$(basename "$0")" \
    --options ":h" \
    -- "$@")
eval set --"$OPTS"

while [[ $# -gt 0 ]]; do
    case "$1" in
    -h | --help)
        help
        exit 0
        ;;
    *)
        shift
        break
        ;;
    esac
done

if [ $# -eq 0 ]; then
    err "Requires an argument"
fi
FILENAME="$1"

if [[ "$FILENAME" != *.sh ]]; then
    FILENAME="$FILENAME.sh"
fi

generate_script
