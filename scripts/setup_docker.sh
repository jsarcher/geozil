
#####################
# Setup Host System #
#####################

# Note: A fresh Ubuntu Server 16.04 is considered

# Export LC_ALL for pip install
export LC_ALL=C

# Install Docker dependencies

sudo apt-get update
sudo apt-get install docker docker-compose python3 python3-pip htop emacs

sudo -H pip3 install --upgrade pip

sudo -H pip3 install docker-compose


# Set vm.max_map_count for Elasticsearch

sudo sysctl -w vm.max_map_count=262144

