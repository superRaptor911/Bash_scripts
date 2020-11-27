#!/bin/bash
###############################################
#-------------Raptor inc 2020-----------------#
#Tool to create header file with include guard#
###############################################
if [ -f "$1.h" ]; then
	[ "$2" == "-f" ] && rm $1.h && echo -e "#ifndef ${1^^}_H\n#define ${1^^}_H\n\n#endif" >> "$1.h" && exit 0
    echo "$1.h already exists , use -f to force create."
    echo "example : r_crHeader $1 -f"
    exit 1
else 
    echo -e "#ifndef ${1^^}_H\n#define ${1^^}_H\n\n#endif" >> "$1.h"
fi