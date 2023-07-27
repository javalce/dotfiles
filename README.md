# dotfiles

Using yadm to manage my dotfiles for [Debian](https://www.debian.org/) and [Linux Mint](https://linuxmint.com/).

## Setup

```bash
# Install yadm and clone this repo
sudo apt-get install -y yadm
yadm clone --no-bootstrap 'git@github.com:javalce/dotfiles.git'
yadm bootstrap
```

The bootstrap command is intended to be run only once in a new system. It will install all dependencies and set up the environment.

After bootstrapping is done, log out and log back in to apply changes.

## Dependencies and stuff yadm bootstrap installs

### Environment

- ca-certificates
- curl
- gnupg
- wget
- git
- git-flow
- unzip
- tar

### Terminal

- zsh
- zsh-antigen
- kitty (also sets as default terminal)
- vim
- neovim (installed as appimage)
- [starsip prompt](https://starship.rs/)
- zoxide
- ripgrep
- tldr (simple man pages)

### Fonts

- JetBrains Mono (installed through apt)
- JetBrains Mono Nerd Font (installed in ~/.local/share/fonts)
- Cascadia Code (installed through apt if available or in ~/.local/share/fonts)

### Node

- [fnm](https://github.com/Schniz/fnm) (Fast Node Manager)
- npm
- pnpm
- @angular/cli

### Python

- python-is-python3 (you can use python3 as python)
- python3-pip
- [poetry](https://python-poetry.org)

### Docker

Installs docker and docker-compose as **Docker** recommends in their [docs](https://docs.docker.com/engine/install). Also adds the current user to the docker group.

- docker
- docker compose
