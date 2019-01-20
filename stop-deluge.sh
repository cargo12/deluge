#!/bin/bash
curl ipconfig.io
service deluged stop
sleep 1
service deluged status | grep inactive
service deluge-web stop
sleep 1
service deluge-web status | grep inactive
killall openvpn
sleep 5
curl ipconfig.io
