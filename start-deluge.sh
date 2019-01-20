#!/bin/bash
curl ipconfig.io
openvpn --daemon --config /home/roger/porcia.ovpn
sleep 3
service deluged start
sleep 1
service deluge-web start
sleep 1
service deluged status | grep active
service deluge-web status | grep active
curl ipconfig.io
