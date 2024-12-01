# dotfiles

Using **yadm** to manage my dotfiles for my [Pop!_OS](https://pop.system76.com) system.

You can also bootstrap your [Fedora](https://fedoraproject.org), [Manjaro](https://manjaro.org) or [EndeavourOS](https://endeavouros.com) system with this repository.

## Prerequisites

- [yadm](https://yadm.io) (Yet Another Dotfiles Manager)
- [curl](https://curl.se) or [wget](https://www.gnu.org/software/wget/)

If you are using Manjaro or EndeavourOS, make sure you have `AUR` repositories enabled and `base-devel` and `git` packages installed.

```bash
sudo pacman -S base-devel git
```

## Setup

You can use the installer provided in this repository or do it manually.

The installer will backup some of your current dotfiles like `.bashrc`, `.profile` and `.zshrc` if they exist, then will clone this repository and bootstrap the system using the commands `yadm clone` and `yadm bootstrap`.

The bootstrap command is intended to be run only once in a new system and it will install all the dependencies and tools needed to have a good development environment.

After bootstrapping is done, log out and log back in to apply changes.

### Using the installer

```bash
curl -fsSL https://raw.githubusercontent.com/javalce/dotfiles/master/.github/setup | bash
```

> :warning: The installer will clone the repository using https by default. If you want to use ssh, you need to pass the `--ssh` flag to the installer.

```bash
curl -fsSL https://raw.githubusercontent.com/javalce/dotfiles/master/.github/setup | bash - --ssh
```

If you want to use skip the bootstrap process, you can pass the `--no-bootstrap` flag to the installer.

```bash
curl -fsSL https://raw.githubusercontent.com/javalce/dotfiles/master/.github/setup | bash - --no-bootstrap
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

- JetBrains Mono
- JetBrains Mono Nerd Font
- Cascadia Code

### Node

- [fnm](https://github.com/Schniz/fnm) (Fast Node Manager)
- [npm](https://www.npmjs.com)
- [pnpm](https://pnpm.io)
- [@angular/cli](https://angular.dev)
- [@nestjs/cli](https://nestjs.com)

### Python

- python-is-python3 (you can use python3 as python, only in Debian and derivatives)
- pip
- pipx
- [poetry](https://python-poetry.org)
- [uv](https://docs.astral.sh/uv)

### Docker

Installs docker and docker-compose as **Docker** recommends in their [docs](https://docs.docker.com/engine/install). Also adds the current user to the docker group.

- docker
- docker compose

### SDKMAN

Installs [SDKMAN](https://sdkman.io) and some SDKs and tools.

- Java 17
- Maven
