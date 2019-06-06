#!/bin/bash
# Nicholas Farrow 2019
CFGLOC=~/.config
SCENEDIR=$CFGLOC/starshell

STARTSCENE=115

# Make folder if doesn't exist
[ -d $SCENEDIR ] || mkdir $SCENEDIR

# If $STARTSCENE scene file does not exist, save starwars to file
if [ ! -f $SCENEDIR/s_$STARTSCENE ]; then
    telnet towel.blinkenlights.nl | sed -e 's/.\[H/Z/g' | tee $SCENEDIR/main

    SCENEDATA=$(<"$SCENEDIR/main")

    # Load scenes
    IFS=$'Z' read -d '' -ra SCENES <<< "$SCENEDATA"

    echo ${#SCENES[@]}

    # Save "good" scenes to invividual files
    for SCENENUM in $(seq 115 ${#SCENES[@]}); do
         echo "${SCENES[$SCENENUM]}" >> $SCENEDIR/s_$SCENENUM
         echo $SCENENUM
    done
fi

# Print random scene
echo "$(<$(ls "$SCENEDIR/s_"* | shuf -n 1))"
