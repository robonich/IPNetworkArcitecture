#!/bin/sh

sysctl -w net.ipv4.conf.all.forwarding=1
sysctl -w net.ipv4.conf.all.rp_filter=0
sysctl -w net.ipv4.conf.default.rp_filter=0

for eth in `ifconfig -a | grep -o -e "eth[0-9]\+" | uniq`
do
	sysctl -w net.ipv4.conf.${eth}.rp_filter=0
done
