#!/bin/bash

# get ipv4 host address for eth0 interface, for example, 192.168.1.240
host_ip=`ifconfig eth0 | grep "inet " | awk -F'[: ]+' '{ print $4 }'`
echo "HOST_IP=$host_ip" > /home/kubernetes/env/network.env

# create dnsmasq config from template
cp /home/kubernetes/network/dnsmasq/dnsmasq.conf /etc/
sed -i -e 's/{{HOST_IP}}/'$host_ip'/g' /etc/dnsmasq.conf


# resulted file /etc/dnsmasq.conf can besimilar to this
#bind-interfaces
#
# used by docker
# listen-address=192.168.1.240
# listen-address=127.0.0.1
#
# this is kubernetes dns cluster with sky dns
# server=/cluster.local/127.0.0.1#54

# this is consul service discovery
# server=/consul/127.0.0.1#8600
