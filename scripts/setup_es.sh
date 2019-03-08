#######################
# Setup Elastic Stack #
#######################


git clone https://github.com/elastic/stack-docker.git es

cd es

# Add PWD variable to .env file
printf "PWD=%s\n" $PWD >> .env
printf "LOGSTASH_KEYSTORE_PASS=pwgeheim\n" >> .env

# Export generated Elasticsearch password to Python script acquire_ips.py
printf 'printf "ELASTIC_PASSWORD = \\"$ELASTIC_PASSWORD\\"" > const_pkg.py\n' >> ./scripts/setup.sh

sudo -H docker-compose -f setup.yml up

mv const_pkg.py ../ingest/

sudo docker-compose up -d

sudo docker-compose -f docker-compose.yml -f docker-compose.setup.yml down --remove-orphans

sudo docker-compose up -d

cd ..
