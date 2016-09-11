This is content of folder /home/kubernetes

For bin used [git-lfs](https://git-lfs.github.com/)

```bash
$ cat /run/flannel/subnet.env
FLANNEL_NETWORK=172.16.0.0/16
FLANNEL_SUBNET=172.16.23.1/24
FLANNEL_MTU=1450
FLANNEL_IPMASQ=true
```

Manually containers create network for flannel
`etcdctl set /coreos.com/network/config '{ "Network": "172.16.0.0/16", "Backend": {"Type": "vxlan"} }'`

`network/dnsmasq.conf` template for /etc/dnsmasq.conf config

Some env vars are store in
EnvironmentFile=/home/kubernetes/env/network.env

### Other

http://kubernetes.io/docs/admin/high-availability/
kubectl proxy --port=8001 --address="0.0.0.0"

/home/kubernetes/master/bin/etcd --discovery-srv etcd.consul _etcd-server._tcp.etcd.consul

consul agent -server -bootstrap-expect 1 \
    -data-dir /tmp/consul -node=agent-one -bind=172.20.20.10 \
    -config-dir /etc/consul.d

-bootstrap-expect 1


https://www.consul.io/downloads.html
https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip

Wants=network-online.target
After=network-online.target