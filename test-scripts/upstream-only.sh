export LC_CTYPE=C

cat $1|gsed "s/[^[:print:]]//g"|tr -d "\n" |tr "^M" "\n"
