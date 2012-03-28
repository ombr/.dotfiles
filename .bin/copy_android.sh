#!/bin/bash
adb="/home/ombr/android/tools/adb"
str="";
k=0;
for i in $@; do
	#echo $i;
	str=$str"input text $i && input keyevent 62 &&"
	k=$(($k + 1));
	if [ "$k" -gt 5 ]; then
		echo sudo $adb shell "$str && echo;";
		sudo $adb shell "$str && echo;";
		str="";
		k=0;
	fi;
	#sudo $adb shell "input keyevent 62"
done;
sudo $adb shell "$str && echo;";
