#! /bin/bash

apt-get update
apt-get install docker docker-compose python3 python3-pip htop emacs

pip3 install --upgrade pip

pip3 install docker-compose

sysctl -w vm.max_map_count=262144


# Download GeoIP2 Database

mkdir geoip2_db && cd geoip2_db

wget https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz

tar zxvf GeoLite2-City.tar.gz

pip3 install geoip2

cd ..

exit

mkdir es

git clone https://github.com/elastic/stack-docker.git es

cd es

export LOGSTASH_KEYSTORE_PASS=pwgeheim

docker-compose -f setup.yml up

docker-compose up -d

docker-compose -f docker-compose.yml -f docker-compose.setup.yml down --remove-orphans

docker-compose up -d

cd ..

mkdir zilliqa && cd zilliqa

wget https://mainnet-join.zilliqa.com/configuration.tar.gz

tar zxvf configuration.tar.gz

curl https://ipinfo.io/ip

./launch_docker.sh


