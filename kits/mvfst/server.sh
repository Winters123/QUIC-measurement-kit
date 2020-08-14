#!/bin/ bash

#ip netns exec blue taskset 128 ~/yuecheng/QUIC-measurement-kit/extern/mvfst/_build/build/quic/tools/tperf/./tperf -max_log_size 1 -congestion cubic -host 192.168.0.2 -mode server -port 4433
#use the cmd below to fire up perf.
perf record --call-graph lbr ip netns exec blue taskset 128 ~/yuecheng/QUIC-measurement-kit/extern/mvfst/_build/build/quic/tools/tperf/./tperf -max_log_size 1 -congestion cubic -host 192.168.0.1 -mode server -port 4434
