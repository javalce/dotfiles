set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
set -x FNM_DIR $HOME/.local/share/fnm
set -x PNPM_HOME $HOME/.local/share/pnpm
set -x BUN_INSTALL $HOME/.bun

if set -q SSH_CONNECTION
    set -x EDITOR vim
else
    set -x EDITOR nvim
end

fish_add_path -g $HOME/.local/bin $HOME/AppImages $FNM_DIR $PNPM_HOME $BUN_INSTALL/bin $HOME/.lmstudio/bin

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Install Fisher if not installed
    if not functions -q fisher
        curl -sL https://git.io/fisher | source
        fisher install jorgebucaran/fisher
    end

    if test "$TERM_PROGRAM" != vscode; and test -t 1
        # Start tmux/zellij
        if not set -q TMUX
            exec tmux
        end

        # if not set -q ZELLIJ
        #     exec zellij
        # end
    end
end

starship init fish | source
zoxide init fish | source
atuin init fish --disable-up-arrow | source
fzf --fish | source

if not set -q FNM_MULTISHELL_PATH
    fnm env --use-on-cd --shell fish | source
end

set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense'

carapace _carapace | source

if test -f ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end

if type -q yazi
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
end

set -g fish_greeting ""

alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim (fzf --preview="bat --theme=gruvbox-dark --color=always {}")'

set -l foreground F3F6F9 normal
set -l selection 263356 normal
set -l comment 8394A3 brblack
set -l red CB7C94 red
set -l orange DEBA87 orange
set -l yellow FFE066 yellow
set -l green B7CC85 green
set -l purple A3B5D6 purple
set -l cyan 7AA89F cyan
set -l pink FF8DD7 magenta

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
