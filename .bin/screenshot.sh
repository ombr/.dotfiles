#!/bin/bash
cd ~/Dropbox/Webcam/;
mplayer tv:// -frames 1 -vo jpeg
mv 00000001.jpg "$(date).jpg"
