# d-prometheus

Prometheus is a time series database.

This directory contains files for creating and running 
a Docker container for Prometheus. 

## Run the docker image

See [dockerhub prometheus](https://hub.docker.com/r/prom/prometheus/).

```
./run_stock_prometheus.sh
```

Prometheus has a web interface available on port 9090.

## Using custom Prometheus config

See [prometheus repo](https://github.com/prometheus/prometheus/blob/master/documentation/examples/prometheus.yml)
for an example `prometheus.yml` config file.

Prometheus expets a `prometheus.yml` file to be in `/etc/prometheus/prometheus.yml`
inside the container.

To use a custom `prometheus.yml` config file, there are two options:

Bind mount the file prometheus.yml in the container using the `-v` flag:

```
docker run \
        -p 9090:9090 
        -v ${PWD}/prometheus.yml:/etc/prometheus/prometheus.yml \
        prom/prometheus
```

Bind a host directory to a container directory using the `-v` flag, and point to the config file with a `--config.file` flag:

```
docker run \
        -p 9090:9090 \
        -v ${PWD}/prometheus-data:/prometheus-data \
        prom/prometheus \
        --config.file=/prometheus-data/prometheus.yml
```

## Netdata-Prometheus config



