#########################
# Setup GeoIP2 Database #
#########################

mkdir geoip2_db

cd geoip2_db

wget https://geolite.maxmind.com/download/geoip/database/GeoLite2-City.tar.gz

tar zxvf GeoLite2-City.tar.gz

sudo -H pip3 install geoip2

cd ..

