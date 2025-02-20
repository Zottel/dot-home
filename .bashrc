#!/bin/bash

# Common settings
. ~/.profile

# Only use the following UI settings for interactive shells.
[ -z "$PS1" ] && return

# history: no duplicates
export HISTCONTROL=ignoredups
# readline feature: non-numeric set histsize => No history truncating.
export HISTSIZE=INF
export HISTFILESIZE=INF
# Write history in append mode => No clashes between multiple writers.
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND" # Write history every prompt.

# changing window sizes:
shopt -s checkwinsize

# vi mode
set -o vi

# title bar & prompt
TITLEBAR="\[\033]2;\u@\h:\w \007\]"
RED="\[\033[00;31m\]"
GREEN="\[\033[00;32m\]"
#YELLOW="\[\033[01;33m\]"
YELLOW="\[\033[00;33m\]"
DEFCOLOUR="\[\033[00m\]"
#PS1="${TITLEBAR}${YELLOW}\u${RED}@${GREEN}\h${RED}:${YELLOW}\w${RED}\$${DEFCOLOUR} "

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
starship_precmd_user_func="set_win_title"
eval "$(starship init bash)"

