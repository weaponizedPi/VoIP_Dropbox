#!/bin/bash
service network-manager stop
ifconfig eth0 192.168.222.50 netmask 255.255.255.0
iw wlan0 interface add mon0 type monitor; ifconfig mon0 up
ifconfig wlan0 192.168.1.1 netmask 255.255.255.0
hostapd /etc/hostapd/hostapd.conf
