#!/Users/neeraj/.miniconda3/envs/py35/bin/python
import sys

g = open(sys.argv[1], 'w')
numcol = 0
while True:
    line = sys.stdin.buffer.readline().decode('utf-8', errors = 'ignore')
    if not line: break
    if numcol == 0 and line.count("|") > 0:
        numcol = line.count("|")
        g.write(line)
    elif numcol ==0:
        g.write(line)
    else:
        g.write("|".join(line.split("|")[:numcol+1]) + ";".join(line.split("|")[numcol+1:]))
g.close()
