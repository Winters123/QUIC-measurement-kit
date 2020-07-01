#!/bin/bash

ip netns exec blue taskset 256 ./picoquicdemo -p 4433

#default cc is cubic, use -G to change cc algorithms.

#use the cmd below to fire up perf.
#perf record --call-graph lbr -- ip netns exec blue taskset 256 ./picoquicdemo -p 4433