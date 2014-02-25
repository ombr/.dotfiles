#!/bin/bash
#xrandr --output HDMI-0 --auto
#xrandr --output DisplayPort-0 --auto --right-of HDMI-0
#xrandr --output DVI-0 --auto --right-of DisplayPort-0

xrandr --output DVI-0 --auto
xrandr --output DisplayPort-0 --auto --right-of DVI-0
xrandr --output HDMI-0 --auto --right-of DisplayPort-0
