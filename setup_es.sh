#! /bin/sh

apt-get install docker docker-compose python3 python3-pip

pip install --upgrade pip

pip3 install docker-compose

sysctl -w vm.max_map_count=262144

export LOGSTASH_KEYSTORE_PASS=pwgeheim

mkdir es

git clone https://github.com/elastic/stack-docker.git es

cd es

docker-compose -f setup.yml up

docker-compose up -d


