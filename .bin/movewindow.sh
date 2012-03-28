#!/bin/bash
echo "Usage : movewindows window desktop screen"
while [ "$(wmctrl -l | grep "$1" )" = "" ]; do
	sleep 1s;
	echo "Wait for $1";
done;
echo $1 $2 $3;
coord=$(expr 2 \* $2 + $3);
coord=$( expr 1280 \* $coord);
wmctrl -r "$1" -b add,maximized_vert,maximized_horz
wmctrl -r "$1" -e "0,$coord,0,1280,1024"
wmctrl -r "$1" -b toggle,fullscreen
wmctrl -r "$1" -e "0,$coord,0,1280,1024"
wmctrl -r "$1" -b toggle,fullscreen
wmctrl -r "$1" -b remove,skip_pager
