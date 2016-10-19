#!/bin/bash

add-apt-repository -y ppa:vbernat/haproxy-1.6 && apt-get update

# Getting haproxy
apt-get -y install haproxy curl

# start haproxy 
/etc/init.d/haproxy start
 
# getting confd
curl -L https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 -o /usr/local/bin/confd

# making confd executeble
chmod +x /usr/local/bin/confd

# creating directories for confd
mkdir -p /etc/confd/templates
mkdir -p /etc/confd/conf.d

# coping resources
cp /resources/haproxy/confd/haproxy.cfg.tmpl /etc/confd/templates/haproxy.cfg.tmpl
cp /resources/haproxy/confd/haproxy.toml /etc/confd/conf.d/haproxy.toml
cp /resources/haproxy/confd/confd.toml /etc/confd/confd.toml
cp /resources/haproxy/confd/confd-deamon /usr/local/bin/confd-deamon && chmod +x /usr/local/bin/confd-deamon

# starting confd-deamon haproxy 
## Closed on purpose - since we don't have and service defined in no need to provision.
# confd-deamon start -node 'http://172.17.4.101:4001'