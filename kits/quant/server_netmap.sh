#!/bin/ bash

taskset 128 ip netns exec blue ./bin/server-warp -b 50000 -i ens3f0 -p 4433
