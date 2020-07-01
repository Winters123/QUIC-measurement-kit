#!/bin/bash
#a stands for the repetitions
a=$1
#b stands for the tags (loss rate, etc.)
b=$2
#generate a fixed size output.dat file.
dd if /dev/zero of=output.dat bs=50M count=1
echo "+++${b}" >> flow_completion_time.txt
for i in $(eval echo {0..${a}})
do
        #perf record --call-graph lbr -- taskset 16 ./cli 192.168.0.1 4433 -p /output.dat -o
        taskset 128 ./cli 192.168.0.1 4433 -p /output.dat -o
        myval=$(echo "2^$i"|bc)
        #taskset $myval ./cli 192.168.0.1 4433 -p /output.dat -o &
        #sleep 0.05
done
sleep 5
echo "---${b}" >> flow_completion_time.txt
