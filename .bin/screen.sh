#!/bin/bash
if [ $(screen -list | grep Detached | wc -l) -gt 0 ]; then
    screen -RR
fi;
