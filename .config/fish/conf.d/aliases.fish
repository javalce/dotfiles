if not type -q pbcopy
    set -l os (uname)
    set -l os_type (uname -o 2>/dev/null)
    if string match -q 'CYGWIN*' $os
        alias pbcopy 'tee > /dev/clipboard'
        alias pbpaste 'cat /dev/clipboard'
    else if test "$os_type" = Android
        alias pbcopy termux-clipboard-set
        alias pbpaste termux-clipboard-get
    else if type -q wl-copy; and type -q wl-paste
        alias pbcopy wl-copy
        alias pbpaste wl-paste
    else if set -q DISPLAY
        if type -q xclip
            alias pbcopy 'xclip -selection clipboard -in'
            alias pbpaste 'xclip -selection clipboard -out'
        else if type -q xsel
            alias pbcopy 'xsel --clipboard --input'
            alias pbpaste 'xsel --clipboard --output'
        end
    end
end

alias ls lsd
