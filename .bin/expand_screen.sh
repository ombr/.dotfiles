#!/bin/bash
optirun true
xrandr --output LVDS1 --auto --output VIRTUAL --mode 1280x960 --left-of LVDS1
screenclone -d :8 -x 1 &
