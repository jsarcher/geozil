#! /usr/bin/python3

# Usage: tail -F -n +0 zilliqa/zilliqa-00001-log.txt | ./acquire_ips.py

import sys
import select
import re
import hashlib

# Import Maxmind's GeoIP2 Database
import geoip2.database

# Import requests library 
import requests 

headers = {
    'Content-Type': 'application/json',
}

DS_KEYS = ['[LogReceivedDSBlockDe] [  ', '[ProcessSetDSInfoFrom] [']
EPOCH_KEYS = ['[ProcessSetDSInfoFrom] [Epoch ']

geoip_reader = geoip2.database.Reader('./geoip2_db/GeoLite2-City_20190305/GeoLite2-City.mmdb')


line = sys.stdin.readline()
while line:
    if any(epoch_key in line for epoch_key in EPOCH_KEYS):
        try:
            epoch_str = re.search(r'Epoch \d{1,10}', line).group()
            epoch_num = re.search(r'\d{1,10}', epoch_str).group()
        except:
            epoch_str = 'Epoch 0'
            epoch_num = '0'
    if any(key_word in line for key_word in DS_KEYS):
        try:
            IP = re.search(r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}', line).group()
            log_time = "20"+re.search(r'\d{2}\-\d{2}\-\d{2}T\d{2}\:\d{2}\:\d{2}', line).group()
            geo_point = geoip_reader.city(IP)
            node_type = "DS Node"
            
            data = '\n{\n' \
                '  "text": "geo_point",\n' \
                '  "ip": "' + IP + '",\n' \
                '  "epoch": ' + epoch_num + ',\n' \
                '  "node_type": "' + node_type + '",\n' \
                '  "log_time": "' + log_time + '",\n' \
                '  "location": { \n' \
                '    "lat": ' + str(geo_point.location.latitude) + ',\n' \
                '    "lon": ' + str(geo_point.location.longitude) + '\n' \
                '}\n}'
            print(data)
            response = requests.put('https://localhost:9200/my_index/_doc/' + \
                                    hashlib.new('md5', data.encode('utf-8')).hexdigest(), \
                                    headers=headers, \
                                    data=data, \
                                    auth=('elastic', '+MfYtx7sYpCrQqXKdOyvGw=='), \
                                    verify='./es/config/ssl/ca/ca.crt')
            print(response)
        except:
            print(line)
            print(response)
            
    line = sys.stdin.readline()

    
