#!/bin/bash

# This script starts spotify (if isn't running already), and play/pause its music
# (and its music only, not other media)

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

alias play_pause="dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause";

SPOTIFY_INSTANCE=$(ps -e | awk '{print $4}' | grep -wxm1 "spotify" || true)

if ([[ -z $SPOTIFY_INSTANCE ]])
then
  echo "Spotify is not running."
  (spotify 1>/dev/null 2>&1 &) && sleep 4;
else
  echo "Spotify is running."
fi

# Now we can get the party started! spotify is running now!
play_pause