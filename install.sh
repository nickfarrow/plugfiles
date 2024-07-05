#!/bin/bash

PLUGLOC=$HOME/plugfiles
CFGLOC=$HOME/.config
BINLOC=$HOME/.local/bin

# Copy config folders
for CFGFOLDER in "$PLUGLOC/.config"/*/; do
    FOLDERNAME=$(basename "$CFGFOLDER")
    OLDDIR="$CFGLOC/$FOLDERNAME"
    if [ -d "$OLDDIR" ]; then
        echo "Removing $OLDDIR"
        rm -rf "$OLDDIR"
    fi
    echo "Copying $CFGFOLDER to $OLDDIR"
    cp -R "$CFGFOLDER" "$OLDDIR"
done

# Copy bin files
echo "Copying bin files"
cp -r "$PLUGLOC/bin/"* "$BINLOC/"

# Copy config files
config_files=(".aliasrc" "picom.conf" "emoji")
for file in "${config_files[@]}"; do
    if [ -f "$CFGLOC/$file" ]; then
        echo "Removing old $file"
        rm "$CFGLOC/$file"
    fi
    echo "Copying $file"
    cp "$PLUGLOC/.config/$file" "$CFGLOC/$file"
done

echo "Copying starshell directory"
rm -rf "$CFGLOC/starshell"
cp -r "$PLUGLOC/.config/starshell" "$CFGLOC/starshell"

# Create symlinks
symlink_files=(".bash_profile" ".bashrc" ".inputrc")
for file in "${symlink_files[@]}"; do
    echo "Creating symlink for $file"
    ln -svf "$PLUGLOC/$file" "$HOME/$file"
done

ln -svf "$PLUGLOC/.bash_profile" "$HOME/.profile"
echo "Done! Restart your shell!"
