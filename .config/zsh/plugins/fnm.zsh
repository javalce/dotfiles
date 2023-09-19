export FNM_DIR="$HOME/.local/share/fnm"
case ":$PATH:" in
*":$FNM_DIR:"*) ;;
*)
    export PATH="$FNM_DIR:$PATH"
    eval "$(fnm env --use-on-cd)"
    ;;
esac
