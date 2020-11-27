#!/bin/bash

random_num=$((1 + $RANDOM % 100))
if [ $random_num -lt $1 ]
then
	exit 0
fi

exit 1
