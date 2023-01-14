#!/bin/bash
PLG=$HOME/plugfiles/
CFG=$HOME/.config

cd ~/

# Rust env
. "$HOME/.cargo/env"

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

# STARSHELL WELCOME MSG
source $CFG/starshell.sh

