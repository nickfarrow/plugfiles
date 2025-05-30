# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
# immediately write and reload history
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=
HISTFILESIZE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Show available files after one press of TAB
bind 'set show-all-if-ambiguous on'

case "$TERM" in
    xterm-color|*-256color|xterm-kitty) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Enable delete key in st-terminal 
tput smkx

# Reverse scroll direction on trackpad
xinput set-prop "Synaptics TM3471-020" "libinput Natural Scrolling Enabled" 1
# Touch click
xinput set-prop 'Synaptics TM3471-020' 'libinput Tapping Enabled' 1
# horizontal scroll
#xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Two-Finger Scrolling" 1 1
# Pointer speed
xinput set-prop 'Synaptics TM3471-020' 'libinput Accel Speed' 0.3

# Load .xresources theme (transparency for st)
#xrdb ~/.Xresources

# Load pywal theme
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
source ~/.cache/wal/colors.sh

if [ "$color_prompt" = yes ]; then
    PS1='\[\e[38;2;$((0x${color1:1:2}));$((0x${color1:3:2}));$((0x${color1:5:2}))m\]\u@\h\[\e[38;2;$((0x${color2:1:2}));$((0x${color2:3:2}));$((0x${color2:5:2}))m\]:\w $\[\e[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Set capslock to escape for vim
setxkbmap -option caps:escape

export SPLASH_DIR=$HOME/splash
export NDSPMHD_DIR=~/Downloads/ndspmhd
export PATH=$PATH:$SPLASH_DIR/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$SPLASH_DIR/giza/lib

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/home/nick/Downloads/bitcoin-23.1/bin
export PATH=$PATH:/home/nick/install/lightning/lightningd
export PATH=$PATH:/home/nick/install/lightning/cli

# Android NDK (frostsnap mobile)
export ANDROID_NDK_HOME=/home/nick/Android/Sdk/ndk/27.0.11718014
export ANDROID_HOME=/home/nick/Android/Sdk

export PATH="/opt/flutter/bin:$PATH"

export PATH=$PATH:/home/nick/install/xtensa-esp32-elf/bin

export CPATH="$(clang -v 2>&1 | grep "Selected GCC installation" | rev | cut -d' ' -f1 | rev)/include"

#LOAD BASH_PROFILE ALSO
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi

export GPG_TTY=$(tty)

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
. "$HOME/.cargo/env"

export SHELL=/bin/bash
