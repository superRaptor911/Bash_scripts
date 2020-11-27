#!/bin/bash

delay="now"

if [ "$1" != "" ]; then
	delay="$1"
fi

choice=$(echo -e "Yes\nNo" | dmenu -p "Do you want to shutdown ?")

if [ "$choice" == "Yes" ]; then
	shutdown $delay
else
	notify-send "Not shuting down" "Pc will not turnoff"
fi
	
