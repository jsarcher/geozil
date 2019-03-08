#! /bin/sh

cd es && sudo docker-compose stop && cd ..

sudo docker stop zilliqa

sudo docker system prune -f

sudo rm -rf es/

sudo rm -rf zilliqa/

sudo rm -rf ingest/const_pkg.py

rm -rf geoip2_db/

