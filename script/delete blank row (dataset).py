import csv
import re
import sys

in_name = sys.argv[1]
out_name = sys.argv[2]

comments = []
scores = []
in_file = in_name
out_file = out_name

print(in_file)
print(out_file)

#read a csv file 	
with open(in_file, 'rb') as csvfile:
	with open(out_file, 'wb') as csvfile_o:
		data = csv.reader(csvfile, delimiter='\t')
		writer = csv.writer(csvfile_o, quoting=csv.QUOTE_NONE, delimiter='\t', escapechar='|')
		#print(sum(1 for row in data))
		for row in data:
			if row[0] != '\n':
				# get only score
				writer.writerow([row[0],row[1]])