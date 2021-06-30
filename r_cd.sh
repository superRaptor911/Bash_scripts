#!/bin/sh

arg=$1

declare -A dict

dict['rt']=~/program/react
dict['bsh']=~/program/bash
dict['cpp']=~/program/cpp
dict['rtnt']=~/program/reactnative

echo ${dict[$arg]}
