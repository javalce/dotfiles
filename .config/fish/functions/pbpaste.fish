function pbpaste
    if type -q xclip
        xclip -selection clipboard -out
    else if type -q xsel
        xsel -b
    else if type -q wl-paste
        wl-paste
    else if type -q termux-clipboard-get
        termux-clipboard-get
        # WSL 1 o 2
    else if string match -q "linux*" $OSTYPE; and test -r /proc/version; and string match -iq "*microsoft*" (cat /proc/version)
        powershell.exe -NoProfile -NonInteractive -Command Get-Clipboard
    else if string match -q "darwin*" $OSTYPE
        command pbpaste
    else if string match -rq "^(cygwin|msys)" $OSTYPE
        cat /dev/clipboard
    end
end
