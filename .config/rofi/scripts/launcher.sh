#!/usr/bin/env bash

# Import Current Theme
theme=~/.config/rofi/themes/launcher.rasi

rofi_cmd() {
  rofi -normal-window \
    -theme "${theme}" \
    -show drun
}

rofi_cmd
