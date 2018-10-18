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
#write on csv file labels 	
#id = 0	
#id_comment = 'comm_' + str(id)
with open(out_file, 'wb') as csvfile:
	writer = csv.writer(csvfile, quoting=csv.QUOTE_NONE, delimiter='\t', escapechar=' ')
	for l in labels:
		
		if (l == "Neutral (LA)") or (l == "Neutral (HA)") or (l == "Neutral"):
			label = "Neutral"
		elif (l == "Stressed") or (l == "Depressed") or (l == "Neg Valence"):
			label = "Negative"
		elif (l == "Excited") or (l == "Relaxed") or (l == "Pos Valence"):
			label = "Positive"
		else:
			label = "$$"
		writer.writerow([l,label])
		#print (word[1] + ' || ' + word[2] + '-->' + str(somma))
		#print(comments[0])
		#id = id + 1
#		id_comment = 'comm_' + str(id)