import csv
import re
import sys

in_name = sys.argv[1]
out_name = sys.argv[2]

comments = []

in_file = in_name
out_file = out_name

print(in_file)
print(out_file)

#read a csv file 	
with open(in_file, 'rb') as csvfile:
	data = csv.reader(csvfile, delimiter=',')
	#print(sum(1 for row in data))
	for row in data:
		# get only text
		comments.append(''.join(row[1]))

with open(out_file, 'wb') as csvfile:
	#writer = csv.writer(csvfile, delimiter=' ', quoting=csv.QUOTE_NONE, escapechar=' ')
	for comm in comments:
		if comm != "\n":
			csvfile.write(comm)
			csvfile.write("\n")
			#writer.writerow([comm])
		
	#print (comments[160])