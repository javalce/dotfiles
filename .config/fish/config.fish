set -x TERM xterm-256color
set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
set -x FNM_DIR $HOME/.local/share/fnm
set -x PNPM_HOME $HOME/.local/share/pnpm
set -x BUN_INSTALL $HOME/.bun
set -Ux SDKMAN_DIR $HOME/.sdkman

if set -q SSH_CONNECTION
    set -x EDITOR vim
else
    set -x EDITOR nvim
end

set -a PROJECT_PATHS $HOME/Dev $HOME/Work/UV $HOME/Work/TheWiseDreams

fish_add_path -g $HOME/.local/bin $HOME/AppImages $FNM_DIR $PNPM_HOME $BUN_INSTALL/bin

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Install Fisher if not installed
    if not functions -q fisher
        curl -sL https://git.io/fisher | source
        fisher install jorgebucaran/fisher
        fisher install reitzig/sdkman-for-fish@v2.1.0
    end

    # if not set -q TMUX
    #     exec tmux
    # end
end

starship init fish | source
zoxide init fish | source
atuin init fish | source

if not set -q FNM_MULTISHELL_PATH
    fnm env --use-on-cd --shell fish | source
end

set -g fish_greeting ""

set -g fish_color_command green
set -g fish_color_error red
set -g fish_color_param normal
set -g fish_color_option normal
set -g fish_color_quote yellow
set -g fish_color_comment brblack
