#!/bin/bash

delay="now"

if [ "$1" != "" ]; then
	delay="$1"
fi

espeak -s 150 "Do you want to shutdown" &
choice=$(echo -e "Yes\nNo" | dmenu -p "Do you want to shutdown ?")

if [ "$choice" == "Yes" ]; then
	shutdown $delay
else
	notify-send "Not shutting down" "Pc will not turnoff"
    espeak "OK! Not shutting down"
fi
	
