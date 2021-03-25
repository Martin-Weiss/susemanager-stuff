#!/bin/bash

# this does not work because the api does not exist!

# infrastrucure
rkeadmin
infrastructure-file-system
infrastructure-server-components
enable-ip-forwarding
rsyslog-logrotate
nfs-server
trusted-certificate-authorities
patch-server

# load-balancer
rkeadmin
load-balancer-config
trusted-certificate-authorities
patch-server

# rke-node
rkeadmin
rke-cluster
enable-ip-forwarding
disable-swap
rke-node-filesystem
trusted-certificate-authorities
patch-server
