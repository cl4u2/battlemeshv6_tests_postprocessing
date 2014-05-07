#!/bin/bash

# grep -A2  "\(date \|ping statistics\)" screenlog.0 > processed0.txt

cat $1 | while read line; do
    #echo $line
    if echo $line | grep '^136[0-9]*\.' > /dev/null; then
        timestamp=$line
    elif echo $line | grep "ping statistics" > /dev/null; then
        aftercolon=$( echo $line | awk '{print $2}' | cut -d ':' -f 2 )
        case $aftercolon in
            *1)
                protocol="OLSR${aftercolon}"
                ;;
            *2)
                protocol="BMX6${aftercolon}"
                ;;
            *4)
                protocol="BABEL${aftercolon}"
                ;;
            *)
                protocol="BADV0"
                ;;
        esac
    elif echo $line | grep "packet loss" > /dev/null; then
        packetloss=$( echo $line | grep -o "[0-9]*\% packet loss" | tr '%' ' ' | awk '{print $1}')
    elif echo $line | grep "^rtt min" > /dev/null; then
        minrtt=$( echo $line | awk '{print $4}' | cut -d "/" -f 1)
        avgrtt=$( echo $line | awk '{print $4}' | cut -d "/" -f 2)
        maxrtt=$( echo $line | awk '{print $4}' | cut -d "/" -f 3)
        echo "$protocol $timestamp $packetloss $minrtt $avgrtt $maxrtt"
    fi
done
