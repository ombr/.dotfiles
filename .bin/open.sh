#! /bin/sh
#if [ "$1" = "" ]; then
#	echo "session ombr"
#	$0 "ombr"
#	exit
#fi
#echo "Go !"
#flag=""
#for i in ./*; do
#	if [ -f "$i" ]; then
#		echo $i
#		gvim --servername "$1" --remote-silent-tab $i &
#		sleep 0.5
#	fi;
#done;
server="gvimombr"
res="";
while [ "$#" -gt "1" ]; do
	#echo $1;
	if [ "$1" = "-s" ]; then
		echo "Serveur : $1";
		shift;
		server=$1;
		shift;
	else
		res="$res $1";
		shift;
	fi;
done;
echo $res $1;
gvim -p --servername $server --remote-silent-tab $res $1 2>/dev/null &
server=$(echo $server | tr '[:lower:]' '[:upper:]' );
#Maximize windows
while [ "$(wmctrl -l | grep $server)" = "" ]; do
	echo "wait"
	sleep 0.2s;
done;
wmctrl -r "$server" -b add,maximized_vert,maximized_horz
