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

COMPOSE_FILE="docker-compose.yaml"
COMPOSE_COMMNAND="docker compose"
COMMAND=

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
    echo
    echo "Commands:"
    echo "  run                     Builds and starts a container using the sedipualba image"
    echo "  start                   Starts a container using the sedipualba image"
    echo "  build                   Build the sedipualba docker image"
    echo "  stop                    Stops a container"
    echo "  restart                 Restarts a container"
    echo "  ps                      Displays containers state"
}

function check_command() {
    if ! command -v "\$1" &>/dev/null; then
        err "\$1 could not be found"
    fi
}

function build() {
    \$COMPOSE_COMMNAND -f \$COMPOSE_FILE build
}

function run() {
    \$COMPOSE_COMMNAND -f \$COMPOSE_FILE up -d --build
}

function start() {
    \$COMPOSE_COMMNAND -f \$COMPOSE_FILE start
}

function stop() {
    \$COMPOSE_COMMNAND -f \$COMPOSE_FILE stop
}

function restart() {
    \$COMPOSE_COMMNAND -f \$COMPOSE_FILE restart
}

function status() {
    \$COMPOSE_COMMNAND -f \$COMPOSE_FILE ps
}

check_command docker

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
    run) run ;;
    build) build ;;
    start) start ;;
    stop) stop ;;
    restart) restart ;;
    ps) status ;;
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
