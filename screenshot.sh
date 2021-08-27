#!/bin/bash

mkdir -p ~/Pictures/screenshots
file_name=$(echo $(date +%d-%m-%y-%H-%M-%S).png | dmenu -p 'Save file as')
file_path=~/Pictures/screenshots/$file_name

if [ "$1" == "-s" ]; then
    import $file_path 
else
    import -window root $file_path
fi

xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/$file_name
notify-send "Saving screenshot as" $file_name
