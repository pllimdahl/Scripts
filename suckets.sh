#!/bin/bash

port=4455;
hex_port=$(python -c 'print(hex('$port')[2:])');
inode=$(cat /proc/net/tcp | grep ":$hex_port" | awk '{print $10}');
for i in $(ps axo pid); do  
    if ls -l /proc/$i/fd 2> /dev/null | grep -q ":\[$inode\]"; then
        echo "Process ID: $i"
        ps -p $i -o comm=
    fi
done