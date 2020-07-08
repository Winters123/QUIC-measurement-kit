#!/bin/bash
# $a is the test tag (can be used to identify loss rate, etc.)
a = $1
cp server_netmap.sh ../../extern/quant/Release .
cd ../../extern/quant/Release

echo "+++{$a}" >> bps_ins.txt
#change client-warp to client to replace netmap with socket.
taskset 64 ./bin/client-warp -b 50000 -r 20 -i ens3f1 http://192.168.0.1:4433/50000000
sleep(1)
echo "---{$a}" >> bps_ins.txt