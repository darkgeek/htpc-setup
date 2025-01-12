#!/bin/bash

pkill -9 -f mpv
pkill -9 -f macast
export https_proxy=http://localhost:8118
export http_proxy=http://localhost:8118
macast-cli
