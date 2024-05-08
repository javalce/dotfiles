#!/bin/bash

FNM_DIR="$HOME/.local/share/fnm"

# Install fnm, a node version manager
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell --install-dir "$FNM_DIR"

# Add fnm to path
export PATH="$FNM_DIR:$PATH"

# Install nodejs
fnm install lts-latest
fnm default lts-latest

# Add fnm to shell
eval "$(fnm env)"

# Add fnm completions
fnm completions --shell bash >"$HOME/.bash_completion.d/_fnm"
fnm completions --shell zsh >"$HOME/.zfunc/_fnm"

# Update npm version
npm install -g npm

# Install global dependencies
npm install -g @angular/cli

# Install pnpm
curl -fsSL https://get.pnpm.io/install.sh | sudo --user="$USER" sh -
