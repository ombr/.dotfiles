#!/bin/bash
vmware -x /media/Data2/Virtual/Windows\ 7/Windows\ 7.vmx &
while [ "$(wmctrl -l | grep VMware)" = "" ]; do
	echo "wait"
	sleep 1s;
done;
#~/cmd/movewindow.sh Windows 0 5
#wmctrl -r windows -t 3
sleep 5s;
coord=$( expr 1280 \* 5);
wmctrl -r "Vmware" -v -e 0,$coord,0,1280,1024
sleep 1s;
wmctrl -r "Vmware" -b remove,skip_pager
sleep 1s;
wmctrl -r "Vmware" -b add,fullscreen
#sleep 1s
#wmctrl -a windows && wmctrl -s 0
#echo "OK"
