#!/bin/bash
# a stands for overrall connections you would ues.
a=$1
# b stands for repetitions of the test.
b=$2
ifconfig ens3f1 192.168.0.4
echo "+++${b}" >>Throughput.txt
for i in $(eval echo {0..${a}})
do
        #perf record --call-graph lbr -- taskset 64 ./picoquicdemo -l n -D 192.168.0.1 4433
        taskset 128 ./picoquicdemo -l n -D 192.168.0.1 4433
done
sleep 15
echo "---${b}" >>Throughput.txt
