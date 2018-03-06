#!/bin/bash

IPADDR="`dig +short myip.opendns.com @resolver1.opendns.com`"

mkdir -p ${PWD}/grafana-data

docker run \
    -i \
    -p 3001:3000 \
    -v ${PWD}/grafana-data:/var/lib/grafana \
    -e "GF_SERVER_ROOT_URL=http://${IPADDR}"  \
    -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-piechart-panel,grafana-simple-json-datasource  1.2.3" \
    grafana/grafana:latest
