#!/bin/bash

for DOTFILE in `find $HOME/plugfiles`
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done


# Multinest Path
export LD_LIBRARY_PATH=$HOME/MultiNest/lib/:$LD_LIBRARY_PATH


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

