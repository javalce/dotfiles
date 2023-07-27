#!/bin/sh

fnm="$HOME/.local/share/fnm/fnm"

# Install fnm, a node version manager
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

$fnm install lts-latest
$fnm default lts-latest

# Add fnm completions
$fnm completions --shell bash >"$HOME/.bash_completion.d/_fnm"
$fnm completions --shell zsh >"$HOME/.zfunc/_fnm"

# Install pnpm, a node package manager
npm i -g pnpm

# Install @angular/cli
npm install -g @angular/cli
