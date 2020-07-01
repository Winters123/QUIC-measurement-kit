# QUIC-measurement-kit
This repo is the tools & scripts used for conducting the QUIC measurement described in [1] and the generated results.

### What are these files?

Being said that these are a bunch of toolkits for protocol's implementation performance profiling, its hard to make them well-organized in a repo based on the fact that we need to adapt them for various opensource implementations. However, I did try the best to make them easy to read and reuse.

In general, the subdir `kits` contains all the scripts used for the measurements.
Each implementation subdir contains **4** files and users need to know:
1. `server.sh`: to fire up the QUIC server;
2. `client.sh`: to fire up a single connection client and request a fixed amount of data block from the server;
3. `multi_client.sh`: to fire up multiple connections as clients and request fixed amount of data blocks from the server;
4. `config.sh` to move the instrumented source files into the orignal project.


### How to run them & collect data from them?

Users need to follow the `README.md` in each subdir to conduct the measurements.
Modifications should be made on those scripts (follow the inside comments) to enable/disable `perf`.
To better visualize the `perf` result, [flamegraph tools](https://github.com/brendangregg/FlameGraph) are highly recommended for analyses & calculation.

For throughput profiling, after the file is generated, users can use `auto_proc.py` to analyse the result (sum, average, etc.). Again, customizing the scripts based on your own needs is high recommended.

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