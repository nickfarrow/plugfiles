#!/bin/bash
#for CFGFOLDER in `find $HOME/plugfiles/.config/ -maxdepth 1`

PLUGLOC=$HOME/plugfiles
CFGLOC=$HOME/.config

[ -f $CFGLOC ] || mkdir $CFGLOC

for CFGFOLDER in $PLUGLOC/.config/*/
do
  FOLDERNAME=$(basename $CFGFOLDER)
    
  OLDDIR=$CFGLOC/$FOLDERNAME/
  
  [ -d "$OLDDIR" ] && echo "deleting $OLDDIR" && rm -r $OLDDIR 
  cp -R "$CFGFOLDER" "$OLDDIR"
done

[ -f "$CFGLOC/.aliasrc" ] && rm "$CFGLOC/.aliasrc"
cp "$PLUGLOC/.config/.aliasrc" "$CFGLOC/.aliasrc"
cp "$PLUGLOC/.config/.compton.conf" "$CFGLOC/.compton.conf"
cp "$PLUGLOC/starshell.sh" "$CFGLOC/starshell.sh"
cp -r "$PLUGLOC/.config/starshell" "$CFGLOC/starshell"

ln -svf "$PLUGLOC/.bash_profile" ~
ln -svf "$PLUGLOC/.bash_profile" ~/.profile
ln -svf "$PLUGLOC/.bashrc" ~
ln -svf "$PLUGLOC/.inputrc" ~


source "$PLUGLOC/.bash_profile"
