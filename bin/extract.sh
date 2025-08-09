#!/bin/bash

set -euo pipefail

mapfile -t files < <(find ~ -maxdepth 1 -name '*.tgz')

for file in "${files[@]}"; do
	tar xzvf "$file"
done
