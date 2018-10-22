import csv
import re
import sys

in_name = sys.argv[1]

in_file = in_name

somma = 0
count = 0

print(in_file)

#read a csv file 	
with open(in_file, 'rb') as csvfile:
	data = csv.reader(csvfile, delimiter='\t')
	#print(sum(1 for row in data))
	for row in data:
		score = row[1]
		sc = score.split()
		somma = somma + int(sc[0]) + int(sc[1])
		count = count + 2
	print("Media: " + "%.15f"%(somma/float(count)))