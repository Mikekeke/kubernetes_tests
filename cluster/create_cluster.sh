#!/bin/bash -x

# https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/
sudo systemctl start kubelet.service
sudo swapoff -a 
sudo kubeadm init --pod-network-cidr=192.168.0.0/16

# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config

yes | sudo cp -i /etc/kubernetes/admin.conf ~/dev/projects/kubernetes_tests/admin.conf

# make master avaiable to schedule pods
./kb.sh taint nodes --all node-role.kubernetes.io/master-

sudo sysctl net.bridge.bridge-nf-call-iptables=1
./kb.sh apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"