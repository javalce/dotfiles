#
# Antidote
#

: ${ANTIDOTE_HOME:=${XDG_CACHE_HOME:-~/.cache}/repos}
: ${ZPLUGINS:=${ZSH_HOME}/zplugins}

ANTIDOTE_REPO=$ANTIDOTE_HOME/mattmc3/antidote

zstyle ':antidote:home' path $ANTIDOTE_HOME
zstyle ':antidote:repo' path $ANTIDOTE_REPO
zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:plugin:*' defer-options '-p'
zstyle ':antidote:*' zcompile 'yes'

# Clone antidote if necessary.
if [[ ! -d $ANTIDOTE_REPO ]]; then
  git clone https://github.com/mattmc3/antidote $ANTIDOTE_REPO
fi

# Load antidote.
source $ANTIDOTE_REPO/antidote.zsh

# Load antidote plugins.
[[ -f ${ZPLUGINS} ]] || touch ${ZPLUGINS}

if [[ ! ${ZPLUGINS}.zsh -nt ${ZPLUGINS} ]]; then
  antidote bundle <${ZPLUGINS} >|${ZPLUGINS}.zsh
fi

source ${ZPLUGINS}.zsh
