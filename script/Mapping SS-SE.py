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

#write on csv file scores 	
#id = 0	
#id_comment = 'comm_' + str(id)
with open(out_file, 'wb') as csvfile:
	writer = csv.writer(csvfile, quoting=csv.QUOTE_NONE, delimiter='\t', escapechar=' ')
	for s in scores:
		#split text token
		word = s.split(' ')

		somma = int(word[0]) + int(word[1])
		
		if somma > 0:
			label = "Positive"
		elif somma < 0:
			label = "Negative"
		else:
			if int(word[0]) < 4:
				label = "Neutral"
			else:
				continue
		writer.writerow([word[0],word[1],label])

		#print (word[1] + ' || ' + word[2] + '-->' + str(somma))
		#print(comments[0])
		#id = id + 1
#		id_comment = 'comm_' + str(id)