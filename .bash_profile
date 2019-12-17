#!/bin/bash

CFG=$HOME/.config
SHD=/media/sea/

# start X if on TTY 1
#if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]
#  then
#  exec startx
#fi



#for DOTFILE in `find $HOME/plugfiles`
#do
#  [ -f “$DOTFILE” ] && source “$DOTFILE”
#done

# Multinest Path
#export LD_LIBRARY_PATH=$HOME/MultiNest/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=~/repos/MultiNest/lib/:$LD_LIBRARY_PATH
export PATH=~/.local/bin:$PATH

# Ruby excecutables
export PATH="$PATH:/home/nick/.gem/ruby/2.6.0/bin"

# Autocomplete without case matching
set completion-ignore-case on

# cd by typing directory name
shopt -s autocd

# Load aliases
# (if exists then load)
[ -f "$HOME/.config/.aliasrc" ] && . "$HOME/.config/.aliasrc" || echo "aliasrc failed to load"

# Inifinite History
HISTSIZE=
HISTFILESIZE=

# Debugging
#echo "Loaded .bash_profile"

# STARSHELL WELCOME MSG
source $CFG/starshell.sh
