#!/bin/bash
#replace `cert` and `key` with the actual ones.
ip netns exec blue taskset 128 ./cli -c cert -k key ./cli 192.168.0.1 4433