#!/bin/bash

arg1=$1
file="note.txt"
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
    *)
        echo "wrong args"
        exit 2
     esac
done



if [ $edit -eq 1 ]; then
	micro ~/Documents/$file
else
	cat ~/Documents/$file
fi
