# QUIC-measurement-kit
This repo is the tools & scripts used for conducting the QUIC measurement described in [1] and the generated results.

### What are these files?

Being said that these are a bunch of toolkits for protocol's implementation performance profiling, its hard to make them well-organized in a repo based on the fact that we need to adapt them for various opensource implementations. However, I did try the best to make them easy to read and reuse.

In general, this repo contains 2 branches: `single_conn` and `multi_conn` and a adapted `TLEM` toolkit. `single_conn` is responsible for measurement based on a single QUIC connection, similar speak to `multi_conn`. The adapted `TLEM` is based on the built-in network simulator `TLEM` in `netmap`. I modified its source code to be able to introduce network interference only to specific packets (e.g., QUIC ACKs). 

In each branch, there are 2 sub-branches: `CPU profileing` and `throughput profiling`. In each of the branch, there is a  `main.py` script which is able to conduct the measurement automatically. In order to successfully launch the measurement, some parameters are needed. use `main.py -help` for the details of these parameters. Bare in mind that these script now can only be used for the adapted `quant`, `picoquic`, `quicly` and `mvfst`. In order to use these scripts for other QUIC implementations, modifications of the source code are needed. It is highly recommended users modify these scripts based on their requirements. 

### How to run them & collect data from them?

Users should first copy the files in each branch to the root directory of the implementation they want to measure. Then, run the scripts `main.py` (with **correct parameters**) to launch the measurement. For CPU profiling, the results are stores as `server.perf` and `client.perf`. To better visualize the result, [flamegraph tools](https://github.com/brendangregg/FlameGraph) are highly recommended for analyses & calculation.

For throughput profiling, the real-time throughput results are stored in `throughput.txt`.  After the file is generated, users can use `auto_proc.py` to analyse the result (sum, average, etc.). Again, customizing the scripts based on your own needs is high recommended.   

### How do they work?

For CPU profiling, `perf` is the core tool that is called in the scripts. As for throughput, the process is a bit more complex: instrumentations need to be added in the source-code to obtain the real-time throughput. This is the main reason why this kit only support the QUIC implementations I adapted. 

### How to contribute to them?

Any helpful contribution to the scripts is welcome:

1. Optimize the scripts for better formed results.
2. Change the ways to obtain the throughput so that we don't have to add instrumentations every time.
3. create a high-level script to run all the tasks (CPU profiling, throughput test, etc.) automatically.
4. support the test for latency.

### Reference 

1. Dissecting QUIC Implementation Performance, Xiangrui et al. EuroSys2020 Poster, Greece.