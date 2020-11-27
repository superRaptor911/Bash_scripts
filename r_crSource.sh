#!/bin/bash
###############################################
#-------------Raptor inc 2020-----------------#
#Tool to create header file with include guard#
###############################################
if [ -f "$1.cpp" ]; then
	[ "$2" == "-f" ] && rm $1.cpp && echo -e "#include <$1.h>" >> "$1.cpp" && exit 0
    echo "$1.cpp already exists , use -f to force create."
    echo "example : r_crSource $1 -f"
    exit 1
else 
    echo -e "#include <$1.h>" >> "$1.cpp"
fi