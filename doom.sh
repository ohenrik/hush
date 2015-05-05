#!/bin/bash
echo "Hold [CTRL+C] to stop.."
while true; do
  threshold=$1
  if [ -z "$threshold" ]
  then
     threshold=0.02
  fi

  sleep_bool=$2
  if [ -z "$sleep_bool" ]
    sleep_bool=1
  then
     sleep_bool=0
  fi


  printf "Listening...\r"
  sleep 1
  ./sox/rec -q ./test.wav trim 0 00:02
  value=`(./sox/sox -t .wav ./test.wav -n stat 2>&1 | grep -e "RMS.*amplitude" | tr -d ' ' | cut -d ':' -f 2)`
  #echo $value
  #echo $threshold
  c=$(echo "$value > $threshold " | bc)
  if [ $c = '1' ]
  then
    osascript -e "set Volume 8"
    afplay scream.mp3
    open -a Preview private-wilhelm.jpg
    /usr/bin/osascript -e 'tell application "Preview"' -e "activate" -e 'tell application "System Events"' -e 'keystroke "f" using {control down, command down}' -e "end tell" -e "end tell"
  fi

done
