#!/bin/bash

music_folder="/home/raptor/Music/"
s_music_folder="/home/raptor/music/"
address="raptorinc.ml"

# Push to server
rsync -rvaz $music_folder "raptor@$address:$s_music_folder" 
if [ "$?" -eq "0" ]
then
  notify-send "Music sync" "Successful"
else
  notify-send "Music sync" "Failed to sync to server"
fi


# Pull from server
rsync -rva "raptor@$address:$s_music_folder" $music_folder 
if [ "$?" -eq "0" ]
then
  notify-send "Music sync" "Successful"
else
  notify-send "Music sync" "Failed to sync from server"
fi
