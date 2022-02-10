#!/bin/bash

xdotool key Super_L+2
xdotool key Ctrl+t

for (( i = 0; i < 10; i++ )); do
    sleep 2
    xdotool key F5
done

xdotool key Ctrl+w
