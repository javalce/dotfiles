#!/usr/bin/env bash

if type yazi &>/dev/null; then
    function ya() {
        tmp="$(mktemp -t "yazi-cwd.XXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            cd -- "$cwd" || exit
        fi
        rm -f -- "$tmp"
    }
fi
