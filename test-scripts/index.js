#!/usr/bin/env node

const fs = require('fs');
const readline = require('readline');
const stream = require('stream');

[nodeLocation, commandFile, inPath, outPath] = process.argv;

let readStream = fs.createReadStream(inPath, 'utf8', {start: 1, end: 20});
let outStream = fs.openSync(outPath, 'w');

const rl = readline.createInterface({
  input: readStream,
  output: process.stdout,
  terminal: false
});

let columnCount = 0;

function cleanLine(splitRow, numberOfColumns) {

  let comments = splitRow.splice(numberOfColumns, splitRow.length - numberOfColumns);
  splitRow.push(comments.join('; '));
  return splitRow.join('|');
}

rl.on('line', function(line) {
  let splitRow = line.trim().split('|');
  let writeLine = line;
  if (columnCount == 0) {
    if (splitRow.length > 1) {
      columnCount = splitRow.length - 1;
    }
  } else {
    writeLine = cleanLine(splitRow, columnCount);
  }

  fs.write(outStream, writeLine + '\n');
});
