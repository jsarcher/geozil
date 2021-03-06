

## Minimum Hardware Requirements

Instace Type: AWS EC2 t2.large
vCPUs: 2
Memory (GiB): 8
SSD Storage: 30 GB

## Network Environment

Typ               Protocl  Port    Source

HTTP              TCP      80      0.0.0.0/0 
HTTP              TCP      80      ::/0 
Custom TCP Rule   TCP      5602    84.132.115.160/32 
Custom TCP Rule   TCP      33133   0.0.0.0/0 
Custom TCP Rule   TCP      33133   ::/0 
SSH               TCP      22      84.132.115.160/32 
Custom UDP Rule   UDP      33133   0.0.0.0/0 
Custom UDP Rule   UDP      33133   ::/0 
Custom TCP Rule   TCP      5601    84.132.115.160/32


## Prerequisites
- Docker and Docker Compose.

  * Linux users can read the [install instructions](https://docs.docker.com/compose/install/#install-compose) or can install via pip:
```
pip install docker-compose
```

* At least 4GiB of RAM for the containers. Windows and Mac users _must_
configure their Docker virtual machine to have more than the default 2 GiB of
RAM:


* Linux Users must set the following configuration as `root`:

```
sysctl -w vm.max_map_count=262144
```


## Starting the stack

Now we can launch the stack with `docker-compose up -d` to create a demonstration Elastic Stack with
Elasticsearch, Kibana, Logstash, Auditbeat, Metricbeat, Filebeat, Packetbeat,
and Heartbeat.

Point a browser at [`http://localhost:5601`](http://localhost:5601) to see the results.
> *NOTE*: Elasticsearch is now setup with self-signed certs.

