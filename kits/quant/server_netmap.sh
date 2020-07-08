#!/bin/bash
cp server_netmap.sh ../../extern/quant/Release .
cd ../../extern/quant/Release & 
taskset 128 ip netns exec blue ./bin/server-warp -b 50000 -i ens3f1 -p 4433