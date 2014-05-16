#!/bin/bash

# grep -A2  "\(date \|ping statistics\)" screenlog.0 > processed0.txt

timestamp=0
cat $1 | while read line; do
    if echo $line | grep '^136[0-9]*\.' > /dev/null; then
        timestamp=$(echo $line | sed 's/\n//' | grep -o '[0-9\.]*')
    elif echo $line | grep "time=" > /dev/null; then
        idati=$(echo $line | awk '{print $4 " " $7}' | awk -F ':' '{print "0" $2 " " $NF}' | sed 's/time=//')
        echo "${timestamp} ${idati}"
    fi
done


