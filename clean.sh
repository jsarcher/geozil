#! /bin/sh

cd es

sudo docker-compose stop

cd ..

sudo docker stop zilliqa

sudo docker system prune

sudo rm -rf es/

rm -rf zilliqa/

rm -rf geoip2_db/

