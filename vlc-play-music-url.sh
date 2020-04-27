#!/bin/bash

# This script starts vlc on background, and plays or stops the RADIO_URL from enviroment variables

# Error handling
set -eu -o pipefail
function print_error {
    read line file <<<$(caller)
    echo "An error occurred in line $line of file $file:" >&2
    sed "${line}q;d" "$file" >&2
}
trap print_error ERR

# Enable aliases
shopt -s expand_aliases

VLC_INSTANCE=$(ps -e | awk '{print $4}' | grep -wxm1 "vlc" || true)

if ([[ -z $VLC_INSTANCE ]])
then
  echo "VLC is not running - Starting"
  (vlc --qt-start-minimized --play-and-exit $RADIO_URL 1>/dev/null 2>&1) & disown;
else
  echo "VLC is running - Stopping"
  pkill "vlc"
fi
