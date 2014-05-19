#!/bin/sh

if [ -z $1 ]; then
	echo "usage: $0 <node id>"
	exit 1
fi

test_id=$(date +%s)
node_id="$1"
netperf_cmd="netperf -f k -c -C -D 1 -j -l 30 -H"

date +%s.%N
echo "====> babel"
$netperf_cmd fdba:14:${node_id}::1 | tee /data/netperf_${test_id}_babel.log 
sleep 30

date +%s.%N
echo "====> bmx6"
$netperf_cmd fdba:12:${node_id}::1 | tee /data/netperf_${test_id}_bmx6.log 
sleep 30

date +%s.%N
echo "====> batadv"
$netperf_cmd fdbb::${node_id} | tee /data/netperf_${test_id}_batadv.log 
sleep 30

date +%s.%N
echo "====> olsr"
$netperf_cmd fdba:11:${node_id}::1 | tee /data/netperf_${test_id}_olsr.log 
sleep 30


