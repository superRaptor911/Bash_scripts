#!/bin/bash

arg1=$1
file="note"
ext=".rnt"
edit=0

args=("$@")

for (( i=0; i<$#; i++ ))
do
	case "${args[$i]}" in
	-e)
		edit=1
		;;
	-f)
		let i=$i+1
		file="${args[$i]}"

		if [ "$file" == "" ]; then
			echo "Error : empty file name"
			exit 2
		fi
		;;
	-l)
		ls | grep "$ext" | sed "s/$ext//"
		exit 0
		;;
    *)
        echo "wrong args"
        exit 2
     esac
done


file="$file$ext"
if [ $edit -eq 1 ]; then
	micro ~/Documents/$file
else
	cat ~/Documents/$file
fi
