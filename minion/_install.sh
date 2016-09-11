#!/bin/bash

echo "copy services to systemd"
cp *.service /etc/systemd/system/

echo "enable systemd services"
systemctl enable kubelet.service
