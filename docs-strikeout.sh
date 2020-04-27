#!/bin/bash

# This just does the key combination home -> shift+End -> shift+alt+5
# Each second for 10 seconds to mock user selection of whole line in google docs
# to strikeout or unstrikeout this line

for i in {1..10}; do
  sleep 1;
  xdotool key Home && xdotool key shift+End && xdotool key shift+alt+5
  echo "$i out of 10" 
done