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
	data = csv.reader(csvfile, delimiter='\t')
	#print(sum(1 for row in data))
	for row in data:
		if len(row) > 1:
			# get only score
			#words = row.split('\t')
			#print (row[3])
			labels.append(''.join(row[3]))

pos = 0
neg = 0
nn = 0
other = 0
with open(out_file, 'wb') as csvfile:
	writer = csv.writer(csvfile, quoting=csv.QUOTE_NONE, delimiter='\t', escapechar=' ')
	for l in labels:
		
		if (l == "Neutral (LA)") or (l == "Neutral (HA)") or (l == "Neutral"):
			label = "Neutral"
			nn = nn + 1
		elif (l == "Stressed") or (l == "Depressed") or (l == "Neg Valence"):
			label = "Negative"
			neg = neg + 1
		elif (l == "Excited") or (l == "Relaxed") or (l == "Pos Valence"):
			label = "Positive"
			pos = pos + 1
		else:
			label = "$$"
			other = other + 1
		writer.writerow([l,label])
		
	writer.writerow(["Positive:",pos,"","Negative:",neg,"","Neutral:",nn,"","Other:",other,"","Total:",pos+neg+nn+other])
	print ("Positive: " + str(pos) + "\nNegative: " + str(neg) + "\nNeutral: " + str(nn) + "\nOther: " + str(other) + "\nTotal: " + str(pos+neg+nn+other))	