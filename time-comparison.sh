#!/bin/bash

# 1759643
# 311-data/311-Public-Data-03142017-pipe-delimited-fmt.txt
# test-results/
# test-scripts/clean_311.sh
# test-scripts/clean_311.py
# test-scripts/index.js

i=100000
n=1759643
infile="311-data/311-Public-Data-03142017-pipe-delimited-fmt.txt"

while [ $i -le $n ];
do
  echo "--------- head $i ---------------"
  echo "bash-script"
  time head -n $i $infile|test-scripts/clean_311.sh test-outputs/output-timer-bash.txt
  echo "node-script"
  time head -n $i $infile|test-scripts/clean_311.js test-outputs/output-timer-node.txt 
  echo "python-script"
  time head -n $i $infile|test-scripts/clean_311.py test-outputs/output-timer-python.txt
  echo "--------------------------------"
  i=$(($i + 100000))
done
