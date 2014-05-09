#!/bin/bash

# grep -A2  "\(date \|ping statistics\)" screenlog.0 > processed0.txt

for filename in ${1}/*test*; do
    timestamp=$(echo $filename | awk -F'_' '{print $NF}')
    protocol=$(echo $filename | awk -F'_' '{print $3}')
    #echo $filename $timestamp $protocol
    tail -n 3 $filename | while read line; do
        #echo $line
        if echo $line | grep "packet loss" > /dev/null; then
            packetloss=$( echo $line | grep -o "[0-9]*\% packet loss" | tr '%' ' ' | awk '{print $1}')
        elif echo $line | grep "^rtt min" > /dev/null; then
            minrtt=$( echo $line | awk '{print $4}' | cut -d "/" -f 1)
            avgrtt=$( echo $line | awk '{print $4}' | cut -d "/" -f 2)
            maxrtt=$( echo $line | awk '{print $4}' | cut -d "/" -f 3)
            echo "$protocol $timestamp $packetloss $minrtt $avgrtt $maxrtt"
        fi
    done
done

