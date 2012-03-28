#!/bin/bash
echo -n "Chargement"
while true; do
	echo -ne ".";
	if ping -c 1 -W 1 "309.ombr.fr" 2&>1 > /dev/null; then
		break;
	fi;
	wget -O "/tmp/$$_wake" "http://luc.boissaye.fr/wake.php" 2&>1 > /dev/null;
done;
echo "";
