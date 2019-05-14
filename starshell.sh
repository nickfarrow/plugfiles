#!/bin/bash
CFGLOC=~/.config
SCENEDIR=$CFGLOC/starshell

# Make folder if doesn't exist
[ -d $SCENEDIR ] || mkdir $SCENEDIR

# Save starwars to file
if [ ! -f $SCENEDIR/main ]; then 
    telnet towel.blinkenlights.nl | sed -e 's/\[H/Z/g' | tee $SCENEDIR/main

    SCENEDATA=$(<"$SCENEDIR/main")
    
    # Load scenes
    IFS=$'Z' read -d '' -ra SCENES <<< "$SCENEDATA" 
    
    # Save "good" scenes to files
    for SCENENUM in $(seq 115 ${#SCENES[@]}); do
        echo "${SCENES[$SCENENUM]}" >> $SCENEDIR/s_$SCENENUM  
    done
fi

echo "$(<$(ls "$SCENEDIR/s_"* | shuf -n 1))"


# Approx first 115 scenes are garbage
#SCENENUM=$(shuf -i 100-${#SCENES[@]} -n 1)
#echo "${SCENES[$SCENENUM]}"

#mkdir $CFGLOC/.starshell



#for i in $(seq 115 ${#SCENES[@]}); do
#for SCENE in "${SCENES[@]}"; do
#    echo "$SCENE" >> 
#done
#
#
#echo ${#SCENES[@]}



