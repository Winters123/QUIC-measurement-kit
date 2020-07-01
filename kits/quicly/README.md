### README

1. Firstly you need to setup the connection between two interfaces (`ens3f0` `ens3f1` by default);
2. `TLEM` can be used for this purpose. For example if you want to add 500us latency between the two interfaces, you can use cmds below. More options can be found [here](https://github.com/luigirizzo/netmap/tree/master/apps/tlem).
    > ./tlem -D 500us -i netmap:ens4f0 -i netmap:ens4f1
3. Run `config.sh` and re-compile `quicly`;
4. Copy `server.sh`, `client.sh` and `multi_client.sh` into `extern/quicly/`;
5. Run the quant server first by executing `server.sh`;
6. Run the quant client by executing `client.sh` (with correct parameters);
7. Results (Throughput) is extracted to `flow_completion_time.txt`.