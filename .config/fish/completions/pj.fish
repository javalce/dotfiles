function __pj_complete
    # Devuelve nombres cortos para cada ruta en PROJECT_PATHS (basename lowercased y limpiado)
    if not set -q PROJECT_PATHS
        return
    end

    set -l seen
    for base in $PROJECT_PATHS
        if test -d "$base"
            set -l bname (basename "$base")
            set -l short (string lower $bname)
            # eliminar caracteres no alfanuméricos
            set short (string replace -r '[^[:alnum:]]+' '' $short)
            if test -z "$short"
                continue
            end
            # evitar duplicados (mantener la primera aparición)
            if contains -- $short $seen
                continue
            end
            set seen $seen $short
            # imprimir 'valor<TAB>descripción' para que fish muestre la ruta completa
            printf '%s\t%s\n' $short $base
        end
    end
end

# Completar el primer argumento de pj con nombres derivados de PROJECT_PATHS
# -f evita que fish añada completions de archivos/directorios (p.ej. el directorio actual)
complete -c pj -f -a '(__pj_complete)'
