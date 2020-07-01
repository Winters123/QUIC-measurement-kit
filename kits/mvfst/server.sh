#!/bin/bash

ip netns exec blue taskset 128 ./tperf -max_log_size 1 -congestion cubic -host 192.168.0.1 -mode server -p 4433
#use the cmd below to fire up perf.
#perf record --call-graph lbr ip netns exec blue taskset 128 ./tperf -max_log_size 1 -congestion cubic -host 192.168.0.1 -mode server -p 4433
