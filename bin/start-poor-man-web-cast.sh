#!/bin/sh

pkill -9 -f cast-receiver
cd /home/justin/Shares/poor-man-web-cast && /usr/bin/go run .
