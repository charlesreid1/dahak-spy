#!/bin/bash

HOSTIP="10.11.0.192"
PROMDATA="${PWD}/prometheus-data"
INTERACTIVE=false
#INTERACTIVE=true

mkdir -p ${PROMDATA}
chown 777 ${PROMDATA}

# Remove dead containers
docker container prune -f


if [ "$INTERACTIVE" == true ]; 
then

    docker run \
            --name helms \
            -v ${PROMDATA}:/prometheus \
            -v ${PWD}/config/netdata.yml:/etc/prometheus/prometheus.yml \
            -p ${HOSTIP}:9090:9090 \
            -i \
            prom/prometheus

else

    docker run \
            --name helms \
            -v ${PROMDATA}:/prometheus \
            -v ${PWD}/config/netdata.yml:/etc/prometheus/prometheus.yml \
            -p ${HOSTIP}:9090:9090 \
            -d \
            prom/prometheus

fi

