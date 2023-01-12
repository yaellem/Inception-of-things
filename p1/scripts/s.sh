#!/bin/bash
echo "SERVER PART"
VALIDITY=`dpkg -l | grep k3s`
if [ "$VALIDITY" == "" ]
then
	export K3S_KUBECONFIG_MODE="644";
# centos8 shits
#	cd /etc/yum.repos.d/ &&  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
#	sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' \
#							/etc/yum.repos.d/CentOS-*

	curl -sfL https://get.k3s.io | sh -s - server --node-ip 192.168.42.110
	cp /var/lib/rancher/k3s/server/node-token /vagrant/k3s_token
	echo "NETWORK INTERFACES: ip a:"
	ip a
fi
