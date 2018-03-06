#!/bin/bash

HOSTIP="10.6.0.2"

# Remove dead containers
docker container prune -f

docker run \
        --name helms \
        -p ${HOSTIP}:9090:9090 \
        -d \
        -v ${PWD}/config/netdata.yml:/etc/prometheus/prometheus.yml \
        prom/prometheus

