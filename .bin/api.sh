#!/bin/bash
while true; do 
	wakeonlan -i api.ombr.fr 00:13:21:f3:d9:4a; 
	wakeonlan 00:13:21:f3:d9:4a 
	ssh api.ombr.fr
done;
echo "Connection OK !";
