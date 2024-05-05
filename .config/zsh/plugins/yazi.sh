#!/usr/bin/env bash

if command -v yazi &>/dev/null; then
    function ya() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            cd -- "$cwd" || exit
        fi
        rm -f -- "$tmp"
    }
fi
