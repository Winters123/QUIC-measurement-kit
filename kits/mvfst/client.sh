#!/bin/ bash
#a stands for total repetitions of test (duration)

echo "+++{$a}" >> throughput.txt
#taskset 128 ./tperf -max_log_size 1 -congestion cubic -duration {$a} -host 192.168.0.1 -mode client -p 4433
#use the cmd below to fire up perf.
perf record --call-graph lbr -- taskset 128 ~/yuecheng/QUIC-measurement-kit/extern/mvfst/_build/build/quic/tools/tperf/./tperf -max_log_size 1 -congestion cubic -duration $1 -host 192.168.0.1 -mode client -port 4433
sleep 1
echo "---{$1}" >> throughput.txt
