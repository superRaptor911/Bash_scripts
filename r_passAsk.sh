#!/bin/bash

pText="Enter root password"

if [ "$1" != "" ]; then
	pText="$1"
fi

echo "" | dmenu -p "$pText"
