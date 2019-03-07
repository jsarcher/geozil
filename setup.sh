#! /bin/sh


sudo apt-get install python3-pip

sudo su -

pip install --upgrade pip
pip install docker-compose


sysctl -w vm.max_map_count=262144

exit

sudo docker pull elasticsearch:6.6.1
sudo docker pull kibana:6.6.1
sudo docker pull zilliqa/zilliqa
sudo docker pull nginx
sudo docker pull httpd
