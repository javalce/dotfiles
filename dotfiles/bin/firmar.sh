#!/bin/bash

set -e
set -u
set -o pipefail

STORE="dni"

# Formato para firma de pdfs
FORMAT="pades"
# Texto que queremos que aparezca firma
LAYER2TEXT='Firmado por $$SUBJECTCN$$ el día $$SIGNDATE=dd/MM/yyyy$$ con un certificado emitido por $$ISSUERCN$$'
# Coordenada X Abajo Izquierda
PositionOnPageLowerLeftX='40'
# Coordenada Y Abajo Izquierda
PositionOnPageLowerLeftY='15'
# Coordenada X Arriba Derecha
PositionOnPageUpperRightX='275'
# Coordenada Y Arriba Derecha
PositionOnPageUpperRightY='54'
# Color de letra
l2FontColor='black'
# Tamaño de letra
l2FontSize='12'
# Página donde firmaremos -1=última
sPage='-1'
# Familia de fuente (Courier)
l2FontFamily='0'
# Estilo de Fuente
l2FontStyle='0'

OPTS=$(getopt \
    --longoptions "page:" \
    --name "$(basename "$0")" \
    --options "" \
    -- "$@")
eval set --$OPTS

while [[ $# -gt 0 ]]; do
    case "$1" in
    "--page")
        sPage="$2"
        shift 2
        ;;
    *)
        shift
        break
        ;;
    esac
done

CONFIG="layer2Text=$LAYER2TEXT\n\
signaturePositionOnPageLowerLeftX=$PositionOnPageLowerLeftX\n\
signaturePositionOnPageLowerLeftY=$PositionOnPageLowerLeftY\n\
layer2FontColor=$l2FontColor\n\
signaturePositionOnPageUpperRightX=$PositionOnPageUpperRightX\n\
signaturePositionOnPageUpperRightY=$PositionOnPageUpperRightY\n\
layer2FontSize=$l2FontSize\n\
signaturePage=$sPage\n\
layer2FontFamily=$l2FontFamily\n\
layer2FontStyle=$l2FontStyle"

if [ -z $1 ]; then
    echo "Usage $0 <file>"
    exit 1
fi

autofirma sign -i "$1" -o "${1/.pdf/}_signed.pdf" \
    -store $STORE \
    -format $FORMAT \
    -config "$CONFIG" \
    -certgui
echo
