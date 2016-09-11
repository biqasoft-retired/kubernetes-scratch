#!/bin/bash

echo "Installing master to current node..."
base_dir=`pwd`

# fail on error
set -e

echo "copy modified docker systemd service"
cp docker.service /lib/systemd/system/

mkdir -p /home/kubernetes
mkdir -p /home/kubernetes/etcd

echo "install network..."
cp -r network /home/kubernetes
cd ./network && ./_install.sh
ln -s /home/kubernetes/network/consul/consul /bin/consul
cd $base_dir

echo "install kube common..."
cp -r common /home/kubernetes
cd $base_dir

echo "install kube master..."
cp -r master /home/kubernetes
cd ./master && ./_install.sh
cd $base_dir

echo "add kubernetes cli to PATH"
rm /bin/kube /bin/kubectl
ln -s /home/kubernetes/master/bin/kubectl /bin/kube
ln -s /home/kubernetes/master/bin/kubectl /bin/kubectl

echo "All completed!"
