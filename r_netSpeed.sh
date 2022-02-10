#!/bin/bash

delay=$1

computeNetSpeed() {
    b=${1:-0}; d=''; s=0; S=(B {K,M,G,T,E,P,Z,Y})
    b=$((b / $delay))
    while ((b > 1024)); do
        d="$(printf ".%02d" $((b % 1024 * 100 / 1024)))"
        b=$((b / 1024))
        let s++
    done
    echo "$b$d${S[$s]}"
}

bytes=($(ifstat wlo1 | awk 'NR == 4 {print $6 " " $8}' | sed 's/K/000/g'))

downSpeed=$(computeNetSpeed ${bytes[0]}) 
upSpeed=$(computeNetSpeed ${bytes[1]}) 

echo "$upSpeed $downSpeed"
