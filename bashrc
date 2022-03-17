# If not running interactively, don't do anything
[ -z "$PS1" ] && return

if [ -f "$HOME/.dotfiles_version" ] ; then
  source $HOME/.dotfiles_version
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

####################
# Useful Functions #
####################

#################################
# Function to add path to $PATH #
#################################
function pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

# Set VISUAL and EDITOR correctly
export VISUAL="vim"
export EDITOR="${VISUAL}"
# Source Aliases
if [ -f $HOME/.bash_aliases ]; then
    . ${HOME}/.bash_aliases
fi
# My bin folder
pathadd "$HOME/bin"
# pip3 --user bin directory
pathadd "$HOME/.local/bin"

if [ -d "$HOME/.pyenv/bin" ] ; then
  export PYENV_ROOT="$HOME/.pyenv"
  pathadd "$PYENV_ROOT/bin"
  eval "$(pyenv init --path)"
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

