#!/bin/bash
# Nicholas Farrow 2019

crypto_rate () {
    if [ "$1" == "BTC" ]; then ln=2; else ln=1; fi
    echo "$(curl -s rate.sx | grep $1 | sed -n ${ln}p | grep -Eo "[0-9]*\.[0-9]*" | head -1)"
}

i3status | while :
do
    read line
    #echo $line   
    BTC=$(crypto_rate "BTC")
    ETH=$(crypto_rate "ETH")
    RATIO=$(bc <<< "scale=6;$ETH/$BTC")

    #echo "BTC:$BTC  ETH:$ETH  ETH/BTC:$RATIO  $line" || exit 1
    
    #RED='\033[0:31m'
    echo -e "${RED}BTC:$BTC  ETH:$ETH  ETH/BTC:$RATIO  $line" || exit 1  
done
