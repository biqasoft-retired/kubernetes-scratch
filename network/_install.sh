#!/bin/bash

echo "copy services to systemd"
cp *.service /etc/systemd/system/
cp dnsmasq/dnsmasq.service /lib/systemd/system/
cp consul/consul.service /etc/systemd/system/

mkdir /home/kubernetes/env

echo "enable systemd services"
systemctl enable consul.service flannel.service wait_consul_ready.service
