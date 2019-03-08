#! /bin/bash

#######################
# Setup GeoZIL Server #
#######################

#####################
# Setup Host System #
#####################

# Note: A fresh Ubuntu Server 16.04 is considered
 
# Export LC_ALL for pip install
export LC_ALL=C

# Install Docker dependencies

sudo apt-get update
sudo apt-get install docker docker-compose python3 python3-pip htop emacs

sudo -H pip3 install --upgrade pip

sudo -H pip3 install docker-compose


# Set vm.max_map_count for Elasticsearch

sudo sysctl -w vm.max_map_count=262144

#########################
# Setup GeoIP2 Database #
#########################

mkdir geoip2_db 

cd geoip2_db

wget https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz

tar zxvf GeoLite2-City.tar.gz

sudo -H pip3 install geoip2

cd ..


#######################
# Setup Elastic Stack #
#######################


git clone https://github.com/elastic/stack-docker.git es

cd es

# Add PWD variable to .env file
printf "PWD=%s\n" $PWD >> .env
printf "LOGSTASH_KEYSTORE_PASS=pwgeheim\n" >> .env

sudo -H docker-compose -f setup.yml up

sudo docker-compose up -d

sudo docker-compose -f docker-compose.yml -f docker-compose.setup.yml down --remove-orphans

sudo docker-compose up -d

cd ..

######################
# Setup Zilliqa Node #
######################

mkdir zilliqa && cd zilliqa

wget https://mainnet-join.zilliqa.com/configuration.tar.gz

tar zxvf configuration.tar.gz

curl https://ipinfo.io/ip

./launch_docker.sh


