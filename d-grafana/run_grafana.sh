#!/bin/bash

function usage {
    echo ""
    echo "run_grafana.sh script:"
    echo "run the grafana docker container."
    echo ""
    echo "        ./run_grafana.sh [<bind-ip-address>]"
    echo ""
    exit 1;
}

GRAFANADIR="${PWD}/grafana-data"

if [[ "$#" -gt 1 ]];
then
    usage
elif [[ "$#" -e 1 ]];
then
    HOSTIP="$1"
else
    #HOSTIP="10.11.0.192"
    HOSTIP="0.0.0.0"
fi

# Remove dead containers
docker container prune -f

INTERACTIVE=false
if [ "$INTERACTIVE" == true ]; 
then

    mkdir -p ${GRAFANADIR}
    
    docker run \
        --name smiley_graf \
        -i \
        -p 3000:3000 \
        -v ${GRAFANADIR}:/var/lib/grafana \
        -e "GF_SERVER_ROOT_URL=http://${HOSTIP}"  \
        -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-piechart-panel,grafana-simple-json-datasource  1.2.3" \
        grafana/grafana:latest

else

    docker run \
        --name smiley_graf \
        -d \
        -p 3000:3000 \
        -v ${GRAFANADIR}:/var/lib/grafana \
        -e "GF_SERVER_ROOT_URL=http://${HOSTIP}"  \
        -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-piechart-panel,grafana-simple-json-datasource  1.2.3" \
        grafana/grafana:latest

fi

