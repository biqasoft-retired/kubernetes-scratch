#!/bin/bash

# Wait until consul(with dnsmasq) is ready to resolve dns requests

# fail execution on error
set -e

while true; do

if ! getent hosts kube-master.service.consul; then
  echo "=== Try consul to resolve master"
  echo "=== Sleeping 1s before try"
  sleep 1
 else
 	break
fi
done

echo "Successed resolve host"
# break if we can resolve host
exit 0
