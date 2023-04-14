#!/bin/bash

set -euo pipefail

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

CURRENT_DIR=$(pwd)
FILE=postman-linux-x64.tar.gz

cd /opt

wget --content-disposition https://dl.pstmn.io/download/latest/linux
tar -xzvf $FILE
rm $FILE

cd $CURRENT_DIR
