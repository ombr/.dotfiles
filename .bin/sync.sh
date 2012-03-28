#!/bin/bash
cd "$(dirname $0)/../"
for i in $(cat ./cmd/sync); do
 	echo "===>>"$i;
	git add $i;
done;
git commit -a -m "$(date)"
git pull origin master
git push origin master
