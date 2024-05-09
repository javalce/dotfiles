# dotfiles

Using **yadm** to manage my dotfiles.

You can bootstrap your [Debian](https://www.debian.org), [Ubuntu](https://ubuntu.com), [Linux Mint](https://linuxmint.com), [Fedora](https://getfedora.org) or [Manjaro](https://manjaro.org) system with this repository.

## Prerequisites

- [yadm](https://yadm.io) (Yet Another Dotfiles Manager)
- [curl](https://curl.se) or [wget](https://www.gnu.org/software/wget/)

## Setup

You can use the installer provided in this repository or do it manually.

The installer will backup some of your current dotfiles like `.bashrc`, `.profile` and `.zshrc` if they exist, then will clone this repository and bootstrap the system using the commands `yadm clone` and `yadm bootstrap`.

The bootstrap command is intended to be run only once in a new system and it will install all the dependencies and tools needed to have a good development environment.

After bootstrapping is done, log out and log back in to apply changes.

### Using the installer

> :warning: The installer will clone the repository using https. If you want to use ssh, you can do it manually.

```bash
# Using curl
curl -fsSL https://raw.githubusercontent.com/javalce/dotfiles/tree/master/.github/installer | bash

# Using wget
wget -qO- https://raw.githubusercontent.com/javalce/dotfiles/tree/master/.github/installer | bash
```

### Manually

```bash
# Backup your some of your current dotfiles if you want to keep them
cp ~/.bashrc ~/.bashrc.bak
cp ~/.profile ~/.profile.bak
cp ~/.zshrc ~/.zshrc.bak

# Clone the repository
yadm clone --no-bootstrap https://github.com/javalce/dotfiles.git

# Checkout the files
yadm checkout "$HOME"

# Bootstrap the system
yadm bootstrap
```

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
- [zimfw](https://zimfw.sh)
- kitty
- vim
- neovim
- [starsip prompt](https://starship.rs/)
- zoxide
- ripgrep
- tldr (simple man pages)

### Fonts

- JetBrains Mono (installed through repo)
- JetBrains Mono Nerd Font (installed in ~/.local/share/fonts)
- Cascadia Code (installed through repo if available or in ~/.local/share/fonts)

### Node

- [fnm](https://github.com/Schniz/fnm) (Fast Node Manager)
- npm
- [pnpm](https://pnpm.io)
- @angular/cli

### Python

- python-is-python3 (you can use python3 as python, only in Debian and derivatives)
- pip
- pipx
- [poetry](https://python-poetry.org)

### Docker

Installs docker and docker-compose as **Docker** recommends in their [docs](https://docs.docker.com/engine/install). Also adds the current user to the docker group.

- docker
- docker compose
