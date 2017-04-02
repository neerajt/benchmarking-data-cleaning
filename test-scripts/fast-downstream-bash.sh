#!/bin/bash
ncol=30
cat|gsed -e "s/|/;/${ncol}g" > $1
