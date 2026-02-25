function pbcopy
    if type -q xclip
        xclip -selection clipboard -in
    else if type -q xsel
        xsel -b
    else if type -q wl-copy
        wl-copy
    else if type -q termux-clipboard-set
        termux-clipboard-set
        # WSL 1 o 2
    else if string match -q "linux*" $OSTYPE; and test -r /proc/version; and string match -iq "*microsoft*" (cat /proc/version)
        clip.exe
    else if string match -q "darwin*" $OSTYPE
        command pbcopy
    else if string match -rq "^(cygwin|msys)" $OSTYPE
        tee /dev/clipboard
    end
end
