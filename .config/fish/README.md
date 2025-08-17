# Fish

This repository contains your Fish configuration and related utilities (completions and functions)

## `local.fish` file

This file is for per-machine configuration and should not be version controlled. It is sourced by `config.fish` if it exists.

It allows you to define variables, functions and customizations that you don't want to share across machines, like api keys or machine-specific paths.

```sh
set -g PROJECT_PATHS $HOME/Documents
set -g AWS_ACCESS_KEY_ID your_access_key
set -g AWS_SECRET_ACCESS_KEY your_secret_key
```

## Functions

### `pj`

- `pj` searches for projects (immediate subdirectories) within the paths defined in `PROJECT_PATHS`.
- No argument: opens `fzf` with all projects from all paths.
- With argument: accepts a short name (shown in autocomplete); that short maps to the corresponding path and `pj` searches only in that base.
- Internally prefers `fd` (if installed) and falls back to `find`.

#### Autocompletion

- `pj` generates completions using the basename of each entry in `PROJECT_PATHS`, normalizes it to lowercase, and removes non-alphanumeric characters. Example: `/home/user/Documents` → `documents`.
- Completion only offers those short names and does not suggest files/directories from the cwd.

The following example shows how `pj` can be used with autocompletion:

```sh
# local.fish
set -g PROJECT_PATHS $HOME/Documents $HOME/Dev $HOME/Images/Wallpapers

# Autocompletion
pj <TAB>

documents (~/Documents)
dev (~/Dev)
wallpapers (~/Images/Wallpapers)
```
