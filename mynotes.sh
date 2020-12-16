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
		cd ~/Documents/
		ls | grep "$ext" | sed "s/$ext//"
		exit 0
		;;
	-h)
		echo "My Notes, View and edit notes"
		echo -e "-e \t\tTo edit Note\n-f \t\tTo specify Note\n-l \t\tTo list Notes"
		exit 0
		;;
	*)
	    echo "wrong args"
	    exit 2
     esac
done


file="$file$ext"
if [ $edit -eq 1 ]; then
	vim ~/Documents/$file
else
	cat ~/Documents/$file
fi
