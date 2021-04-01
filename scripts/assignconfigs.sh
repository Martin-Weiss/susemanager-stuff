#!/bin/bash

# this does not work because the api does not exist!

# all:
rkeadmin
patch-server

# load-balancer
load-balancer-config

# rke-node
rke-cluster
enable-ip-forwarding
disable-swap

# rke-test / rke-int / rpk-prod
