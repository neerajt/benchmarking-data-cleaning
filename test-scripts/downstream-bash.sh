#!/bin/bash

#!/bin/bash
rm $1

shortcol=0

while read -re rawinput;
  do
    if [ ${shortcol} -eq 0 ];
    then
      shortcol=$(echo $rawinput|grep -o "\|"|wc -l|tr -d '[:space:]')
      ncol=$(echo "$shortcol+1"|bc)
    fi
  done < <(cat)

echo $rawinput|gsed -e "s/|/;/30g" > $1
