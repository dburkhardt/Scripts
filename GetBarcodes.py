#!/usr/bin/python

import re, sys

barcodes=["The barcodes are:"]
curr=barcodes[0]


while True:
	try:
		line = raw_input()
		if line == '':
			break
	except EOFError:
		break
	match = re.search('(?<=\:)[GATC]{6}', line).group(0)
	matched = 0
	if (match == curr):
		matched = 1
		#print "matched curr"
	else:
		for a , val in enumerate(barcodes):
			if (match == val):
				curr = barcodes[a]
				matched = 1
	if (matched == 0):
		sys.stdout.write("NEW match: " + match)
		sys.stdout.flush()
		barcodes.append(match)

for i in barcodes:
	print i 