#!/bin/bash

# iostat -d -h -s -j LABEL sda | awk 'NR == 4 {print $2 " " $3}'
iostat -d  -h -s -j LABEL sda 2 2 | awk 'NR % 2 == 0 && $2 != "" {print $2 " " $3}' | tail -n 1
