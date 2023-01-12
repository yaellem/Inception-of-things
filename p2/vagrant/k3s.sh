#!/bin/bash

echo "**** Begin installing k3s"
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -
echo "**** End installing k3s"