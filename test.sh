#!/bin/sh

choice=$(   find -H /home/wifiengine/Documents\
            /home/wifiengine/Images\
            /home/wifiengine/code\
            /home/wifiengine/.scripts\
            /home/wifiengine/.source | fzf )

echo $choice

confirmed=$(cat /home/wifiengine/.scripts/sendtosite/confirmation | fzf)

if [ $confirmed == "no" ]
then
    echo "you selected no"
elif [ $confirmed == "yes" ]
then
    curl -F'file=@'$choice https://0x0.st
else
    echo "error"
fi
