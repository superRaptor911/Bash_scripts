#!/bin/bash

file_name=$(echo 'screenshot_%Y%m%d_%H%M%S.png' | dmenu -p 'Save file as')


if [ "$1" == "-s" ]; then
	# OSX-like area selection screenshots
	scrot -s $file_name -e 'mkdir -p ~/Pictures/screenshots && mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/`ls -1 -t ~/Pictures/screenshots | head -1`' # Area selection
else
	scrot $file_name -e 'mkdir -p ~/Pictures/screenshots && mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/`ls -1 -t ~/Pictures/screenshots | head -1`' # All screens
fi
