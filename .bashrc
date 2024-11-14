# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export EDITOR="nvim"

# fnm
if [ -d "$HOME/.local/share/fnm" ]; then
	export PATH="$HOME/.local/share/fnm:$PATH"
	eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"
fi

# Load starship prompt
if command -v starship &>/dev/null; then
	export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
	eval "$(starship init bash)"
fi

# Load zoxide (z command)
if command -v zoxide &>/dev/null; then eval "$(zoxide init bash)"; fi

# Angular CLI completion
if command -v ng &>/dev/null; then source <(ng completion script); fi

# pnpm
export PNPM_HOME="/home/javalce/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

. "$HOME/.cargo/env"
