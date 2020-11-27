#!/bin/bash

info=$(acpi)
status=$(echo $info | awk -F "," '{print $1}' | awk '{print $3}')
bat_level=$(echo $info | awk -F "," '{print $2;}' | sed 's/%//;s/ //')

echo "$status : $bat_level%"

if [ "$status" != "Discharging" ]; then
	exit
fi

if [ $bat_level -lt 30 ]; then
	notify-send "Low battery" "Please charge your battery"
	echo "Low batterty, Bat: $bat_level%"
	
	if [ $bat_level -lt 15 ]; then
		notify-send "Battery Level Critical" "Charge your battery or Shutdown"
		choice=$(echo -e "Yes\nNo" | dmenu -p "Shutdown ?")
	fi
fi
