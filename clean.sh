#! /bin/sh

cd es

docker-compose stop

cd ..

docker stop zilliqa

docker system prune

rm -rf es/

rm -rf zilliqa/


