#! /bin/bash

#######################
# Setup GeoZIL Server #
#######################

. ./scripts/setup_docker.sh
. ./scripts/setup_geoip.sh
. ./scripts/setup_es.sh
. ./scripts/setup_zilliqa.sh


sudo docker-compose up -d
