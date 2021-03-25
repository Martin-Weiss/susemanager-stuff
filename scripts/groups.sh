#!/bin/bash
for GROUP in infrastructure load-balancer rke-rancher rke-test rke-int rke-prod; do /usr/bin/spacecmd -y -- group_create $GROUP $GROUP; done
