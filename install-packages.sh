#!/bin/bash

sudo apt update
yes | sudo apt install snapd
yes | sudo apt-get install jq
sudo snap install go --classic
go install github.com/sigstore/cosign/v2/cmd/cosign@latest
sudo apt update
yes | sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker
yes | sudo apt-get update && sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
sudo apt update
yes | sudo apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
yes | sudo apt install -y kubelet kubeadm kubectl