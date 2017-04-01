#!/bin/bash
rm $1

shortcol=0

while read rawinput;
  do
    if [ ${shortcol} -eq 0 ];
    then
      shortcol=$(echo $rawinput|grep -o "\|"|wc -l|tr -d '[:space:]')
      ncol=$(echo "$shortcol+1"|bc)
    fi
    echo $rawinput|gsed -e "s/|/;/${ncol}g" >> $1
  done


