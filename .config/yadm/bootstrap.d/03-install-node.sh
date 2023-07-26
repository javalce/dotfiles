#!/bin/sh

# Install fnm, a node version manager
curl -fsSL https://fnm.vercel.app/install | sh - --skip-shell

# Reload path
# shellcheck source=/dev/null
. "$HOME/.profile"

fnm install lts-latest
fnm default lts-latest

# Add fnm completions
fnm completions --shell bash >"$HOME/.bash_completion.d/_fnm"
fnm completions --shell zsh >"$HOME/.zfunc/_fnm"

# Install pnpm, a node package manager
curl -fsSL https://get.pnpm.io/install.sh | sh -

# Install @angular/cli
npm install -g @angular/cli
