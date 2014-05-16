#!/bin/bash

#grep "ttl=" $1 | awk '{print $4 " " $7}' | awk -F ':' '{print $2 " " $NF}' | sed 's/time=//'
grep "ttl=" $1 | awk '{print $4 " " $7}' | awk -F ':' '{print "0" $2 " " $NF}' | sed 's/time=//'
