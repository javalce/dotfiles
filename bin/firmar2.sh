#!/bin/bash

function help() {
    echo "Usage $0 [FILE]"
    echo
    echo "This script signs a file using DNIe"
}

function sign_file() {
    IN="$1"
    DIR="${IN%/*}"
    FILE="${IN##*/}"
    FILE_WO_EXT="${FILE%.*}"
    EXTENSION="${IN##*.}"
    OUT="${DIR}/${FILE_WO_EXT}_signed.${EXTENSION}"

    echo "**** Firmando digitalmente ${IN} ==> ${OUT}: **"
    RES=$(autofirma sign -i "$IN" -o "$OUT" -certgui \
        -store dni | grep 'result>true' | wc -l | sed -e 's/^[[:space:]]*//')
    if [ "$RES" == "1" ]; then
        echo " >>> ${OUT} FIRMADO SATISFACTORIAMENTE."
    else
        echo " <<< ERROR EN FIRMA DIGITAL, no se ha podido firmar ${IN} en ${OUT}"
    fi
    echo "DONE"
}

if [ $# -eq 0 ]; then
    help
    exit 0
elif [ $# -eq 1 ]; then
    echo "* SIGNING: $1"
    sign_file $1
    exit 0
else
    for f in "$@"; do
        echo "* SIGNING: $f"
        sign_file $f
        echo
    done
fi
