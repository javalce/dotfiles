#!/bin/bash

set -euo pipefail

descargas="$HOME/Descargas"
imagenes="$HOME/Imágenes"
videos="$HOME/Vídeos"
documentos="$HOME/Documentos"
dev="$HOME/Dev"

# Clean tmp directories
tmp_files=('node_modules' '.angular' 'dist' '.next' '.ruff_cache' '.mypy_cache' '.pytest_cache' '__pycache__')
for tmp_file in "${tmp_files[@]}"; do
    find "$documentos" -name "$tmp_file" -type d -prune -exec rm -rf '{}' \;
    find "$dev" -name "$tmp_file" -type d -prune -exec rm -rf '{}' \;
done

# Compress with tar
tar -czvf "$descargas.tgz" "$descargas"
tar -czvf "$imagenes.tgz" "$imagenes"
tar -czvf "$videos.tgz" "$videos"
tar -czvf "$documentos.tgz" "$documentos"
tar -czvf "$dev.tgz" "$dev"

# Copy to external hard drive with rsync
read -r -p 'Directory to copy files: ' DIRECTORY
rsync -avh --progress "$HOME"/*.tgz "$DIRECTORY"

# Delete compressed files
rm "$HOME"/*.tgz
