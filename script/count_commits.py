import csv
import sys

in_name = sys.argv[1]

in_file = in_name

count = 0

#read a csv file 	
with open(in_file, 'rb') as csvfile:
	data = csv.reader(csvfile, delimiter=',')

	for row in data:
		count = count +1 
	#print row number
	print (count)