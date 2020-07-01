#!/bin/bash

# a stands for the overall connections during the test.
a=$1
ifconfig ens3f1 192.168.0.4
for i in {1..$a}
do
        #perf record --call-graph lbr -- taskset 16 ./cli 192.168.0.1 4433 -p /output.dat -o
        #taskset 16 ./cli 192.168.0.1 4433 -p /output.dat -o
        myval=$(echo "2^$i"|bc)
        taskset $myval ./cli 192.168.0.1 4433 -p /output.dat -o &
        #sleep 0.05
done
echo "---${a}" >> flow_completion_time.txt
