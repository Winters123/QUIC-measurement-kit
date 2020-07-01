#!/bin/bash
# a stands for overall number of connections
a=$1
# b stands for tags (packet loss rate, etc.)
b=$2
ifconfig ens3f1 192.168.0.4
echo "+++${b}" >>Throughput.txt
for i in $(eval echo {0..${a}})
do
        #perf record --call-graph lbr -- taskset 64 ./picoquicdemo -l n -D 192.168.0.1 4433
        myval=$(echo "2^${i}"|bc)
        taskset $myval ./picoquicdemo -l n -D 192.168.0.1 4433 &

done
sleep 15
echo "---${b}" >>Throughput.txt
