#!/usr/bin/python

# preconditions: filename is a tab-delimited file where first line is a header. The rest of file needs to be in sets of 4 where the third line of each set needs to be the datafile. In each dataline there are sets of three replicates in the order a,b,c,d,a,b,c,d....

filename = "/Users/Dan/T14_and_T15_Trial3_Biolog_10.7.14.txt"

datafile = open(filename,'r')

count = 0


for line in datafile.readlines():
	count = count+1
	if count == 1:
		print "Beginning file"
	elif (count % 4) == 0:
		c = 0
		for datapoint in line.split('\t'):
			c += 1
			if (%):
				
			print datapoint
			
			
			
for each line in inputfile
	throw out first line
	take 4 line and then every 4th from there
		group 1,5,9
		group 2,6,10
		group 3,7,11
		group 4,8,12
		return a list of 4 sets, one for each group
	return a list of each list
