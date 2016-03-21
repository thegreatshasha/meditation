#!/bin/bash

duration=6
volume=10
volume_reduction=10
med_duration=$((15*60))
cycle_length=$((4*$duration))
cycles=$(($med_duration/$cycle_length))
now=$(($cycles/$volume_reduction))
echo $med_duration
echo $cycle_length
echo $cycles

# Start meditation, maximum volume
osascript -e "set Volume $volume"

for i in $(seq 0 $cycles);
do 
say "inhale"; sleep $duration;
say "hold"; sleep $duration;
say "exhale"; sleep $duration;
say "hold"; sleep $duration;
rem=$(($i%$now))
if [ $rem -eq 0 ]; then echo $rem;
echo $volume
volume=$(($volume-1))
fi;
osascript -e "set Volume $volume"
done
