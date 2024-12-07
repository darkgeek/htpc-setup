#!/bin/sh

pkill -9 -f cast-receiver
export https_proxy=http://localhost:8118
export http_proxy=http://localhost:8118
cd /home/justin/Shares/poor-man-web-cast && /usr/bin/go run .
