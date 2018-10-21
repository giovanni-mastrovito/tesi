import csv
import re
import sys

in_name = sys.argv[1]
out_name = sys.argv[2]

comments = []
labels = []

in_file = in_name
out_file = out_name

print(in_file)
print(out_file)

#read a csv file 	
with open(in_file, 'rb') as csvfile:
	data = csv.reader(csvfile, delimiter=',')
	#print(sum(1 for row in data))
	for row in data:
		labels.append(''.join(row[1]))
	#print (int(labels[1]))

neg = 0
nn = 0
other = 0

with open(out_file, 'wb') as csvfile:
	writer = csv.writer(csvfile, quoting=csv.QUOTE_NONE, delimiter='\t', escapechar=' ')
	for l in labels:
		try:
			x = int(l)
		except ValueError:
			continue
		
		if (x == 0):
			label = "Not negative"
			nn = nn + 1
		elif (x == -1):
			label = "Negative"
			neg = neg + 1
		else:
			other = other + 1
			continue
		writer.writerow([l.replace(" ",""),label])
		
	writer.writerow(["Negative:",neg,"","Not negative:",nn,"","Other:",other,"","Total:",neg+nn+other])
	print ("Negative: " + str(neg) + "\nNot negative: " + str(nn) + "\nOther: " + str(other) + "\nTotal: " + str(neg+nn+other))	