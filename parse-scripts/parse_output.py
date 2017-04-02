import sys
import json
with open(sys.argv[1]) as f:
	lines = [i.strip().strip('\n').replace('\t', ' ') for i in f.readlines() if i != '\n']

data_arr = []
for line in lines:
    if 'head' in line:
        count = int(line.split()[2])
    elif '-script' in line:
        lang = line.split('-')[0]
    else:
        try:
            line_dict = {'input_lines': count,\
                    'lang': lang,\
                    'time_type': line.split()[0],\
                    'time': line.split()[1]}
            data_arr.append(line_dict)
        except:
            pass

with open(sys.argv[2], 'w') as f:
	f.write(json.dumps(data_arr))
        
        
