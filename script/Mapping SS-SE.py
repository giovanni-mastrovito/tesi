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
	data = csv.reader(csvfile, delimiter='\t')
	#print(sum(1 for row in data))
	for row in data:
		if len(row) > 1:
			# get only score
			#words = row.split('\t')
			scores.append(''.join(row[1]))

pos = 0
neg = 0
nn = 0
dlt = 0

with open(out_file, 'wb') as csvfile:
	writer = csv.writer(csvfile, quoting=csv.QUOTE_NONE, delimiter='\t', escapechar=' ')
	for s in scores:
		#split text token
		word = s.split(' ')

		somma = int(word[0]) + int(word[1])
		
		if somma > 0:
			label = "Positive"
			pos = pos + 1
		elif somma < 0:
			label = "Negative"
			neg = neg + 1
		else:
			if int(word[0]) < 4:
				label = "Neutral"
				nn = nn + 1
			else:
				dlt = dlt + 1
				continue
		writer.writerow([word[0],word[1],label])
	writer.writerow(["Positive:",pos,"","Negative:",neg,"","Neutral:",nn,"","Deleted:",dlt,"","Total:",pos+neg+nn+dlt])
	print ("Positive: " + str(pos) + "\nNegative: " + str(neg) + "\nNeutral: " + str(nn) + "\nDeleted: " + str(dlt) + "\nTotal: " + str(pos+neg+nn+dlt))
