#!/bin/ bash

taskset 128 ip netns exec blue ./bin/server-warp -b 50000 -i ens3f1 -p 4433
