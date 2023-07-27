#!/bin/bash

# Install fnm, a node version manager
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

# Add fnm to path
export PATH="$HOME/.local/share/fnm:$PATH"

# Install nodejs
fnm install lts-latest
fnm default lts-latest

# Add fnm to shell
eval "$(fnm env)"

# Add fnm completions
fnm completions --shell bash >"$HOME/.bash_completion.d/_fnm"
fnm completions --shell zsh >"$HOME/.zfunc/_fnm"

# Install global dependencies
npm install -g npm
npm install -g pnpm
npm install -g @angular/cli
