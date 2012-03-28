#! /bin/sh
latex $1;
dvips "$(basename $1 .tex).dvi" -o
ps2pdf -sPAPERSIZE=a4 "$(basename $1 .tex).ps"
