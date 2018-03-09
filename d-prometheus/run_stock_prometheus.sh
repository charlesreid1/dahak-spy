#!/bin/bash

function usage {
    echo ""
    echo "run_stock_prometheus.sh script:"
    echo "run prometheus db docker container."
    echo ""
    echo "        ./run_stock_prometheus.sh [<bind-ip-address>]"
    echo ""
    exit 1;
}

if [[ "$#" -gt 1 ]];
then
    usage
elif [[ "$#" -e 1 ]];
then
    HOSTIP="$1"
else
    HOSTIP="10.11.0.192"
fi

# Remove dead containers
docker container prune -f

INTERACTIVE=false
if [ "$INTERACTIVE" == true ]; 
then

    docker run \
            --name helms_prom \
            -v helms_prom_data:/prometheus \
            -v ${PWD}/config/netdata.yml:/etc/prometheus/prometheus.yml \
            -p ${HOSTIP}:9090:9090 \
            -i \
            prom/prometheus

else

    docker run \
            --name helms_prom \
            -v helms_prom_data:/prometheus \
            -v ${PWD}/config/netdata.yml:/etc/prometheus/prometheus.yml \
            -p ${HOSTIP}:9090:9090 \
            -d \
            prom/prometheus

fi

