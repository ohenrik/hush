#!/bin/bash
echo "Hold [CTRL+C] to stop.."
while true; do
  printf "Listening...\r"
  sleep 1
  ./sox/rec -q ./test.wav trim 0 00:02
  value=`(./sox/sox -t .wav ./test.wav -n stat 2>&1 | grep -e "RMS.*amplitude" | tr -d ' ' | cut -d ':' -f 2)`
  threshold=$1
  #echo $value
  #echo $threshold
  c=$(echo "$value > $threshold " | bc)
  if [ $c = '1' ]
  then 
    pmset displaysleepnow
  fi
done