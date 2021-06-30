#!/bin/bash


if [ "$1" == "-s" ]; then
	# OSX-like area selection screenshots
    file_name=$(echo 'image.png' | dmenu -p 'Save file as')
    scrot --line style=dash,width=3,color="red" -s $file_name -e 'mkdir -p ~/Pictures/screenshots && mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/`ls -1 -t ~/Pictures/screenshots | head -1`' # Area selection

elif [ "$1" == "-ds" ]; then
    scrot --line style=dash,width=3,color="red" -s $file_name -e 'mkdir -p ~/Pictures/screenshots &&
        mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i
            ~/Pictures/screenshots/`ls -1 -t ~/Pictures/screenshots | head -1`' # Area selection

else
    file_name=$(echo 'image.png' | dmenu -p 'Save file as')
    scrot $file_name -e 'mkdir -p ~/Pictures/screenshots && mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/`ls -1 -t ~/Pictures/screenshots | head -1`' # All screens
fi

notify-send "Saving screenshot as" $file_name
