#!/bin/bash
PLG=$HOME/plugfiles/
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

# CUDA
export PATH=/opt/cuda/bin:$PATH

# Ruby excecutables
export PATH="$PATH:/home/nick/.gem/ruby/2.6.0/bin"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Rust Path
PATH=~/.cargo/bin:$PATH

# Website Dir
SITE=~/repos/nicholasfarrow.github.io

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

# Bitcoin
alias btcdir="cd ~/.bitcoin/"
alias bc="bitcoin-cli"
alias btcinfo='bitcoin-cli getwalletinfo | egrep "\"balance\""; bitcoin-cli getnetworkinfo | egrep "\"version\"|connections"; bitcoin-cli getmininginfo | egrep "\"blocks\"|errors"'



# STARSHELL WELCOME MSG
source $CFG/starshell.sh

export PATH="$HOME/.cargo/bin:$PATH"
