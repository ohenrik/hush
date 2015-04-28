#!/bin/bash
echo "Hold [CTRL+C] to stop.."
while true; do
  threshold=$1
  if [ -z "$threshold" ]
  then
     threshold=0.02
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
    afplay scream.mp3
    pmset displaysleepnow
  fi
done
