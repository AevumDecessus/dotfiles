# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export BASHRC_VERSION="2019.12.06"

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

# Set VISUAL and EDITOR correctly
export VISUAL="vim"
export EDITOR="${VISUAL}"
# Source Aliases
if [ -f $HOME/.bash_aliases ]; then
    . ${HOME}/.bash_aliases
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

