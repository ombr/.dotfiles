#!/bin/bash
cd ~/images/webcam;
mplayer tv:// -frames 1 -vo jpeg
mv 00000001.jpg "$(date).jpg"
