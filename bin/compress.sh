#!/bin/bash

set -euo pipefail

descargas="Descargas"
imagenes="Imágenes"
videos="Vídeos"
documentos="Documentos"
dev="Dev"
work="Work"

# Go to home directory
cd "$HOME"

# Clean tmp directories
tmp_files=(
	'node_modules'
	'.angular'
	'dist'
	'.next'
	'.venv'
	'.ruff_cache'
	'.mypy_cache'
	'.pytest_cache'
	'__pycache__'
	'htmlcov'
	'.coverage'
)

clean_tmp_files() {
	find "$1" -name "$tmp_file" -type d -prune -exec rm -rf '{}' \;
}

compress() {
	tar -czvf "${1}.tgz" "$1"
}

for tmp_file in "${tmp_files[@]}"; do
	clean_tmp_files "$documentos"
	clean_tmp_files "$dev"
	clean_tmp_files "$work"
done

compress "$descargas"
compress "$imagenes"
compress "$videos"
compress "$documentos"
compress "$dev"
compress "$work"

# Copy to external hard drive with rsync
read -r -p 'Directory to copy files: ' DIRECTORY
rsync -avh --progress "$HOME"/*.tgz "$DIRECTORY"

# Delete compressed files
rm "$HOME"/*.tgz
