#!/bin/bash

firefox &
fenetre="Gmail"
while [ "$(wmctrl -l | grep $fenetre)" = "" ]; do
	echo "wait"
	sleep 0.1s;
done;
wmctrl -r "$fenetre" -t 0
wmctrl -r "$fenetre" -e 0,0,0,1280,1024
wmctrl -r "$fenetre" -b add,maximized_vert,maximized_horz

fenetre="Deezer"
while [ "$(wmctrl -l | grep $fenetre)" = "" ]; do
	echo "wait"
	sleep 0.1s;
done;
wmctrl -r "$fenetre" -t 1
wmctrl -r "$fenetre" -e 0,0,0,1280,1024
wmctrl -r "$fenetre" -b add,maximized_vert,maximized_horz

fenetre="Calendar"
while [ "$(wmctrl -l | grep $fenetre)" = "" ]; do
	echo "wait"
	sleep 0.1s;
done;
wmctrl -r "$fenetre" -t 0
wmctrl -r "$fenetre" -e 0,1280,1024,1280,1024
wmctrl -r "$fenetre" -b add,maximized_vert,maximized_horz

#firefox &
#while [ "$(wmctrl -l | grep Firefox )" = "" ]; do
#	echo "wait"
#	sleep 1s;
#done;
#sleep 1s;
#coord=$( expr 1280 \* 1);
#wmctrl -r "Firefox" -v -e 0,$coord,0,1280,1024
#wmctrl -r "Firefox" -b add,maximized_vert,maximized_horz
