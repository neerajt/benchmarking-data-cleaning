#!/bin/bash
export LC_CTYPE=C
ncol=30
cat|gsed -e "s/[^[:print:]]//g"|tr -d "\n" |tr "^M" "\n"|gsed "s/|/;/${ncol}g" > $1
