#!/bin/bash

pText="Enter root password"

if [ "$1" != "" ]; then
	pText="$1"
fi

passwrd=$(echo "" | dmenu -p "$pText")
chk=$(echo "$passwrd" | sudo -S echo "Y")

if [ "$chk" != "Y" ]; then
	notify-send "Pass Ask" "Wrong Password"
	exit 1
fi
