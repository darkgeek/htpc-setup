#!/bin/sh

LOG_PATH=/home/justin/detect_tv_off.log

ddcutil detect | grep 'No displays found' > /dev/null
IS_TV_OFF=$?

CURRENT_KODI_PLAYING=$(curl -H "Content-Type: application/json" -X POST -d '{ "jsonrpc": "2.0", "method": "Player.GetItem", "params": { "playerid": 1 }, "id": "tv_off_detector"}' http://127.0.0.1:8080/jsonrpc | jq '.result.item.label')

stop_kodi_playback() {
    curl -H "Content-Type: application/json" -X POST -d '{ "jsonrpc": "2.0", "method": "Player.Stop", "params": { "playerid": 1 }, "id": "tv_off_detector"}' http://127.0.0.1:8080/jsonrpc
}

print_log() {
    echo $(date): "$1" >> $LOG_PATH
}

if test $IS_TV_OFF -eq 0 && test "$CURRENT_KODI_PLAYING" != '""'; then
    print_log "TV is off but kodi is still playing: $CURRENT_KODI_PLAYING, stop it..."
    print_log $(stop_kodi_playback) 
fi
