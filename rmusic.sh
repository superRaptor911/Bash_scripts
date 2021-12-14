#!/bin/bash

arg_count=$#
args=("$@")

saveMusic=0
loadFromFile=0
gui=0

outputName=""
searchQuery=""
mediaPlayer="cvlc"

parseArgs(){
    
    if [[ $arg_count -eq 0 ]]; then
        rmusicHelp
        exit 0
    fi

    for (( i=0; i<$arg_count; i++ ))
    do
        case "${args[$i]}" in
            -s)
                saveMusic=1
                ;;
            -f)
                loadFromFile=1
                ;;
            -gui)
                gui=1
                ;;
            -h)
                rmusicHelp
                exit 0
                ;;
            *)
                searchQuery="${args[$i]}"
        esac
    done
}

rmusicHelp() {
    echo -e "Rmusic - listen and download music from youtube\n"
    echo "usage "
    echo -e "rmusic \"search query\"\n"

    echo "example "
    echo -e "rmusic \"linkin park numb\"\n"

    echo "Commands -"
    echo -e "  -s           \t\tTo save as mp3"
    echo -e "  -h           \t\tTo show help"
    echo -e "  -f           \t\tTo play playlist songs from a file"
    echo -e "  -gui         \t\tPlay with vlc gui"
}

###################### Main ##############################
parseArgs


if [[ $gui -eq 1 ]]; then
    mediaPlayer="vlc"

if [[ $saveMusic -eq 0 ]]; then
    url=$(youtube-dl -f 140 -g "ytsearch1:$searchQuery")
    $mediaPlayer "$url"
else
    outputName="$searchQuery.mp3"
    youtube-dl -f 140 "ytsearch1:$searchQuery" --audio-format mp3 -o "$outputName"
fi


