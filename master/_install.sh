#!/bin/bash

echo "copy services to systemd"
cp *.service /etc/systemd/system/
cp *.timer /etc/systemd/system/

echo "enable systemd services"
systemctl enable kube-apiserver.service kube-controller-manager.service kube-master-register.consul.service kube-master-register.consul.timer kube-scheduler.service etcd.service
