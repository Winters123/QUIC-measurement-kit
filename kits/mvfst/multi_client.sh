#!/bin/bash
# a stands for overall number of connections
a=$1
# b stands for tags (packet loss rate, etc.)
b=$2
ifconfig ens3f1 192.168.0.4
echo "+++${b}" >>throughput.txt
for i in $(eval echo {0..${a}})
do
        myval=$(echo "2^${i}"|bc)
        #use the cmd below to fire up perf.
        #perf record --call-graph lbr -- taskset 64 ./tperf -max_log_size 1 -congestion cubic -duration {$a} -host 192.168.0.1 -mode client -p 4433 &
        taskset $myval ./tperf -max_log_size 1 -congestion cubic -duration {$a} -host 192.168.0.1 -mode client -p 4433 &

done
sleep 15
echo "---${b}" >>throughput.txt
