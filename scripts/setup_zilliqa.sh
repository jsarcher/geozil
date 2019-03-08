######################
# Setup Zilliqa Node #
######################

mkdir zilliqa && cd zilliqa

wget https://mainnet-join.zilliqa.com/configuration.tar.gz

tar zxvf configuration.tar.gz

curl https://ipinfo.io/ip

./launch_docker.sh

cd ..
