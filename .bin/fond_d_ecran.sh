#/bin/sh
cd /tmp
rm -fr www.desktopmachine.com
image=$RANDOM
while [ 1031 -le $image ]
do
 image=$RANDOM
done
moi=`whoami`
wget http://www.desktopmachine.com/kijk_onder.php\?id=$image\&size=1024 -r --domains=www.desktopmachine.com --reject=gif
background=`ls www.desktopmachine.com/pics/*.jpg`
cp -f $background voiture"$moi".jpg
rm -fr www.desktopmachine.com
dcop --user $moi kdesktop KBackgroundIface setWallpaper /tmp/voiture"$moi".jpg 0
dcop --user $moi kdesktop KBackgroundIface setWallpaper /tmp/voiture"$moi".jpg 4
