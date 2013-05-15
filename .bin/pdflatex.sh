#! /bin/sh
if [ "$1" = "-w" ]i; then
    echo supervisor -w ./ -x "$0 $2"
else
    echo $@
    pwd
    latex $1;
    dvips "$(basename $1 .tex).dvi" -o
    ps2pdf -sPAPERSIZE=a4 "$(basename $1 .tex).ps"
fi
