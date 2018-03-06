#!/bin/bash
# 
# Run the grafana docker container
# 
# http://charlesreid1.com/wiki/Docker/Basics

function usage {
    echo ""
    echo "run_grafana.sh script:"
    echo "run the grafana docker container."
    echo ""
    echo "        ./run_grafana.sh"
    echo ""
}

IPADDR="`dig +short myip.opendns.com @resolver1.opendns.com`"
GRAFANADIR="${PWD}/grafana-data"
INTERACTIVE=false
#INTERACTIVE=true

if [[ "$#" -ne 0 ]];
then

    usage

else

    if [ "$INTERACTIVE" == true ]; 
    then

    mkdir -p ${GRAFANADIR}
    
    docker run \
        --name smiley \
        -i \
        -p 3000:3000 \
        -v ${GRAFANADIR}:/var/lib/grafana \
        -e "GF_SERVER_ROOT_URL=http://${IPADDR}"  \
        -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-piechart-panel,grafana-simple-json-datasource  1.2.3" \
        grafana/grafana:latest

    else

    docker run \
        --name smiley \
        -d \
        -p 3000:3000 \
        -v ${GRAFANADIR}:/var/lib/grafana \
        -e "GF_SERVER_ROOT_URL=http://${IPADDR}"  \
        -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-piechart-panel,grafana-simple-json-datasource  1.2.3" \
        grafana/grafana:latest

    fi

fi
