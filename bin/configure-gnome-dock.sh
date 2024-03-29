#!/bin/bash

set -euo pipefail

# Reset the dock to the default settings
gsettings reset-recursively org.gnome.shell.extensions.dash-to-dock

######################
# POSITION AND SIZE
######################
# Set the dock to show on all monitors
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true

# Set the dock to the bottom
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

# Set the dock to intellihide
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true

# Set the dock to autohide
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock autohide-in-fullscreen false

# Set the dock to not require pressure to show
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show false

# Set the dock to 0.9 size
gsettings set org.gnome.shell.extensions.dash-to-dock height-fraction 0.9

######################
# LAUNCHERS
######################
# Set the dock to show trash
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash true

# Set the dock to show mounted volumes
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts-only-mounted true

# Set the dock to show the applications button on the right
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true

######################
# BEHAVIOUR
######################
# Set the dock to minimize or show previews on click
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'

######################
# APPEARANCE
######################
# Set the dock to shrink the theme
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true

# Set the dock to use the custom theme
gsettings set org.gnome.shell.extensions.dash-to-dock apply-custom-theme true
