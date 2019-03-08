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
