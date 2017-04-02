#!/usr/bin/env node

const fs = require('fs');
const readline = require('readline');

[nodeLocation, commandFile, outPath] = process.argv;

let outStream = fs.openSync(outPath, 'w');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

let columnCount = 0;

rl.on('line', function(line) {
  let splitRow = line.split('|');
  let writeLine = line;
  if (columnCount == 0) {
    if (splitRow.length > 1) {
      columnCount = splitRow.length - 1;
    }
  } else {
    let comments = splitRow.splice(columnCount, splitRow.length - columnCount);
    splitRow.push(comments.join('; '));
    writeLine = splitRow.join('|');
  }

  fs.write(outStream, writeLine + '\n');
});
