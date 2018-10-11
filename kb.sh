#!/bin/bash -x

KUBECONFIG=./admin.conf kubectl --insecure-skip-tls-verify $@