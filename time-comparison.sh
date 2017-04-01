#!/bin/bash

# 1759643
# 311-data/311-Public-Data-03142017-pipe-delimited-fmt.txt
# test-results/
# test-scripts/clean_311.sh
# test-scripts/clean_311.py
# test-scripts/index.js

i=0
n=1759643

while [$i -le $n];
do
  time head -n $i |test-scripts/index.js test-outputs/output-timer-node.txt 
  time head -n $i |test-scripts/clean_311.sh test-outputs/output-timer-bash.txt
  time head -n $i |test-scripts/clean_311.py test-outputs/output-timer-python.txt
  i = $(($i + 100000))
done
