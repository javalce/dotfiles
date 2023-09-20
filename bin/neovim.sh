#!/bin/bash

set -euo pipefail

APPIMAGE_NAME="nvim.appimage"
APPIMAGE_DIR="$HOME/.nvim"
APPIMAGE="$APPIMAGE_DIR/$APPIMAGE_NAME"
OLD_APPIMAGE="$APPIMAGE_DIR/old-$APPIMAGE_NAME"
BIN_FILE="$HOME/.local/bin/nvim"
APPIMAGE_URL="https://github.com/neovim/neovim/releases/download/stable/$APPIMAGE_NAME"

function help() {
    echo "Usage: $0 [OPTION]"
    echo "Options:"
    echo "  -u, --update    Update neovim"
    echo "  -i, --install   Install neovim"
    echo "  -h, --help      Show this help message"
    exit 0
}

function update() {
    if [ ! -d "$APPIMAGE_DIR" ] && [ ! -f "$APPIMAGE" ]; then
        echo "Neovim is not installed"
        exit 1
    fi

    wget https://github.com/neovim/neovim/releases/tag/stable -q -O - >/tmp/nvim28dce75c-4317-4006-a103-8069d573e2b2
    RESPONSE="$(wget https://github.com/neovim/neovim/releases/tag/stable --save-headers -O - 2>&1)"

    if [[ "$RESPONSE" =~ 404\ Not\ Found ]]; then
        echo "Couldn't fetch newest Neovim Stable info. Aborting..."
        exit
    fi

    CURR_NVIM_VER="$($APPIMAGE --version | head -n 1)"
    NEW_NVIM_VER="$(xmllint --html --xpath "//pre//code/node()" /tmp/nvim28dce75c-4317-4006-a103-8069d573e2b2 2>/dev/null | grep NVIM)"
    rm /tmp/nvim28dce75c-4317-4006-a103-8069d573e2b2

    if [[ "$CURR_NVIM_VER" == "$NEW_NVIM_VER" ]]; then
        echo "You have the latest version of neovim"
        exit 0
    fi

    echo "Updating neovim"
    mv "$APPIMAGE" "$OLD_APPIMAGE"
    CURL_CMD="curl -L -w http_code=%{http_code}"
    CURL_OUTPUT="$($CURL_CMD -o "$APPIMAGE" "$APPIMAGE_URL")"
    HTTP_CODE="${CURL_OUTPUT##*http_code=}"
    ERROR_MESSAGE="${CURL_OUTPUT%http_code=*}"

    if [[ "$HTTP_CODE" != "200" ]]; then
        echo "Error: $ERROR_MESSAGE"
        echo "Rolling back"
        rm "$APPIMAGE"
        mv "$OLD_APPIMAGE" "$APPIMAGE"
        exit 1
    fi

    chmod 764 "$APPIMAGE"
    [ -f "$OLD_APPIMAGE" ] && rm "$OLD_APPIMAGE"
}

function install() {
    [ -d "$APPIMAGE_DIR" ] || mkdir "$APPIMAGE_DIR"
    rm -rf "${APPIMAGE_DIR:?}"/*

    wget "$APPIMAGE_URL" -q -O "$APPIMAGE"

    chmod 764 "$APPIMAGE"
    ln -sf "$APPIMAGE" "$BIN_FILE"
}

OPTS=$(getopt -o "uih" --long "update,install,help" -n "$0" -- "$@")
eval set -- "$OPTS"

while true; do
    case "$1" in
    -u | --update)
        update
        break
        ;;
    -i | --install)
        install
        break
        ;;
    -h | --help)
        help
        ;;
    --)
        help
        ;;
    *)
        echo "Invalid option: $1"
        exit 1
        ;;
    esac
done
