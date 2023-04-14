#!/bin/bash

function install() {
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
}

function uninstall() {
    rm -fr ~/.config/nvim
    rm -fr ~/.local/share/nvim
    rm -fr ~/.cache/nvim
}

function help() {
    echo "Usage $0 [COMMAND]"
    echo 
    echo "Commands:"
    echo "  install"
    echo "  uninstall"
    echo "  help"
}

if [ $# -eq 0 ] || [ $# -gt 1 ]; then
    help
    exit
fi

case "$1" in
install)
    install
    ;;
uninstall)
    uninstall
    ;;
help | *)
    help
    ;;
esac
