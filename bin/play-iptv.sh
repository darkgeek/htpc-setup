#!/bin/bash

IPTV_DB_UPDATE_SCRIPT=$HOME/Shares/iptv/iptv-update
IPTV_M3U_PLAYLIST=$HOME/.config/iptv/iptvplaylist.m3u

echo Checking update...
notify-send "正在获取最新的IPTV频道列表，请稍等..."
https_proxy=http://localhost:8118 $IPTV_DB_UPDATE_SCRIPT
notify-send "已获取到最新的IPTV频道列表"
echo Done.

mpv --script-opts=iptv=1 "$IPTV_M3U_PLAYLIST"
