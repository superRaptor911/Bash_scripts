#!/bin/bash

arg1=$1
file="note.txt"


if [ "$arg1" == "-edit" ] || [ "$arg1" == "-e" ]; then
	micro ~/Documents/$file
else
	cat ~/Documents/$file
fi
