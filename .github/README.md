# dotfiles

Using **yadm** to manage my dotfiles for my current [Manjaro](https://manjaro.org) system.

The are also some scripts to bootstrap the following distros:

- [Fedora](https://fedoraproject.org)
- [Linux Mint](https://linuxmint.com)
- [EndeavourOS](https://endeavouros.com)

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
curl -fsSL https://raw.githubusercontent.com/javalce/dotfiles/main/.github/setup | bash
```

> [!WARNING]
> The installer will clone the repository using https by default. If you want to use **ssh**, you need to pass the `--ssh` flag to the installer.

```bash
curl -fsSL https://raw.githubusercontent.com/javalce/dotfiles/main/.github/setup | bash -s -- --ssh
```

If you want to use skip the bootstrap process, you can pass the `--no-bootstrap` flag to the installer.

```bash
curl -fsSL https://raw.githubusercontent.com/javalce/dotfiles/main/.github/setup | bash -s -- --no-bootstrap
```

### Manually

```bash
# Backup your some of your current dotfiles if you want to keep them
cp ~/.bashrc ~/.bashrc.bak
cp ~/.profile ~/.profile.bak
cp ~/.zshrc ~/.zshrc.bak
cp -r ~/.config/fish ~/.config/fish.bak

# Clone the repository
yadm clone --no-bootstrap https://github.com/javalce/dotfiles.git
# or using ssh
yadm clone --no-bootstrap git@github.com:javalce/dotfiles.git

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

### Fonts

- JetBrains Mono
- JetBrains Mono Nerd Font
- Cascadia Code

### Terminal

- [kitty](https://sw.kovidgoyal.net/kitty/) (a fast, feature-rich, GPU-based terminal emulator)
- [wezterm](https://wezfurlong.org/wezterm/) (a GPU-accelerated terminal emulator)
- [ghostty](https://github.com/ghostty/ghostty) (a terminal emulator for the modern age)

#### ZSH

- zsh
- [zim](https://zimfw.sh)

#### Fish

- [fish](https://fishshell.com)

### Terminal tools

- [starship](https://starship.rs/) (the best prompt)
- [zoxide](https://github.com/ajeetdsouza/zoxide) (smart cd command)
- [atuin](https://atuin.sh) (a shell history manager)
- [tldr](https://tldr.sh) (simple man pages)
- [bat](https://github.com/sharkdp/bat) (cat clone with wings)
- [fzf](https://github.com/junegunn/fzf) (fuzzy finder)
- [fd](https://github.com/sharkdp/fd) (simple, fast and user-friendly alternative to 'find')
- [lsd](https://github.com/lsd-rs/lsd) (the next gen ls)

### Neovim

- vim
- [neovim](https://neovim.io)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (line-oriented search tool)
- [lazygit](https://github.com/jesseduffield/lazygit) (simple terminal UI for git commands)

### Fonts

- JetBrains Mono
- JetBrains Mono Nerd Font
- Cascadia Code

### Node

- [fnm](https://github.com/Schniz/fnm) (Fast Node Manager)
- [npm](https://www.npmjs.com)
- [pnpm](https://pnpm.io) (better than pnpm)
- [bun](https://bun.sh) (the faster npm)

### Python

- python-is-python3 (you can use python3 as python, **only in Debian and derivatives**)
- pip
- pipx
- [poetry](https://python-poetry.org)
- [uv](https://docs.astral.sh/uv)

### Docker

Installs docker and docker-compose as **Docker** recommends in their [docs](https://docs.docker.com/engine/install). Also adds the current user to the docker group.

> [!NOTE]
> On Manjaro and EndeavourOS, there are not official packages from Docker, so it installs the `docker` and `docker-compose` packages from their respective distro repositories.

- docker
- docker compose

### SDKMAN

Installs [SDKMAN](https://sdkman.io) and some SDKs and tools.

- Java 17
- Java 21
- Maven
