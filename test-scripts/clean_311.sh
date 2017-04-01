export LC_CTYPE=C

read rawdata
shortcol=$(sed -e '7!d' $rawdata|grep -o "\|"|wc -l|tr -d '[:space:]')
ncol=$(echo "$shortcol+1"|bc)

gsed -e"s/[^[:print:]]//g" $rawdata|tr -d "\n" |tr "^M" "\n"|gsed "s/|/;/${ncol}g" > $1
