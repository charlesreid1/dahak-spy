# grafana docker

This contains a Dockerfile for grafana.

To build the Docker container, run:

```
$ ./build_grafana.sh
```

To run the Docker container, run:

```
$ ./run_grafana.sh
```

The run script attempts to discover the IP address
of the Grafana server, but the IP address can be
hard-coded into the script if necessary.

