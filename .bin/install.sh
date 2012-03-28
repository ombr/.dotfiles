#/bin/bash
for i in $(cat ./install); do
	echo $i;
	yes | apt-get install $i;
done;
