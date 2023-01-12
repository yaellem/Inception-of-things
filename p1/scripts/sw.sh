#!/bin/bash
echo "WORKER PART"
export K3S_KUBECONFIG_MODE="644"
export K3S_URL="https://192.168.42.110:6443"
export K3S_TOKEN=`cat /vagrant/k3s_token`
curl -sfL https://get.k3s.io | sh -s - agent --node-ip 192.168.42.111
echo "NETWORK INTERFACES: ip a"
ip a
