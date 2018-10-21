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

neg = 0
nn = 0
pos = 0
oth = 0

#read a csv file 	
with open(in_file, 'rb') as csvfile:
	data = csv.reader(csvfile, delimiter=',')
	#print(sum(1 for row in data))
	for row in data:
		if row[1] == "positive":
			pos = pos + 1
		elif row[1] == "negative":
			neg = neg + 1
		elif row[1] == "neutral":
			nn = nn + 1
		else:
			oth = oth + 1
	#print (int(labels[1]))



with open(out_file, 'wb') as csvfile:
	writer = csv.writer(csvfile, quoting=csv.QUOTE_NONE, delimiter='\t', escapechar=' ')
	writer.writerow(["Positive:",pos,"","Negative:",neg,"","Neutral:",nn,"","Total:",pos+neg+nn,"","Other:",oth])
	print ("Positive: " + str(pos) + "\nNegative: " + str(neg) + "\nNeutral: " + str(nn) + "\nTotal: " + str(pos+neg+nn) + "\nOther: " + str(oth))		