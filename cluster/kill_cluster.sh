#!/bin/bash -x

NODE=mike-k53sk
yes | sudo ./kb.sh drain $NODE --delete-local-data --force --ignore-daemonsets
yes | sudo ./kb.sh kubectl delete node $NODE
yes | sudo kubeadm reset
sudo systemctl start kubelet.service