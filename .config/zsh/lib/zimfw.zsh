#
# Set Zimfw configuration paths.
#

export ZIM_HOME=${HOME}/.zim
export ZIM_CONFIG_FILE=${ZSH_HOME}/zimrc

# Set ZSH_CACHE_DIR to the path where cache files should be created
# ZSH_CACHE_DIR=${ZSH_CACHE_DIR:-${XDG_CACHE_HOME:-${HOME}/.cache}/zsh}

# Create cache and completions dir and add to $fpath
# mkdir -p "$ZSH_CACHE_DIR/completions"
# (( ${fpath[(Ie)$ZSH_CACHE_DIR/completions]} )) || fpath=($ZSH_CACHE_DIR/completions $fpath)

#
# Load Zimfw plugin manager
#

# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
      https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Install missing modules and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi

# Initialize modules.
source ${ZIM_HOME}/init.zsh

