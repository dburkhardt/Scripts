#!/usr/bin/python

import re,sys,os,stat
from optparse import OptionParser






#create commandline options
parser = OptionParser()
parser.add_option("--bamfile", dest="bampath",
                  help="Input BAMfile", metavar="FILE.bam",default=None)
parser.add_option("-s", "--samfile", dest="sampath",
                  help="Input SAMfile", metavar="FILE.sam", default=sys.stdin)
parser.add_option("-b", "--barcodes", dest="barcodes",
                  help="a comma-separated list of barcode files", metavar="barcodes.txt")

#handle commandline options
(options, args) = parser.parse_args()

if options.bampath == None and options.sampath == None:
	print "Please provide either a SAM file for a BAM file using the '-s' or '-b' flags."
	quit()

if options.barcodes == None:
	print "Please provide a list of barcode files separated by commas."
	quit()

list_of_barcode_files = options.barcodes.split(",")


count = 0
barcodelist = list()
for f in list_of_barcode_files:
	count+=1
	fileName = os.path.basename(f)
	fileName += ".sam"
	writefile = open(fileName, 'w+')
	newlist = list()
	newlist.append(writefile)
	barcodefile = open(f,'r')
	barcodefile.readline()
	for line in barcodefile.readlines():
		print line
		newlist.append(line.rstrip())
	barcodelist.append(newlist)
print "There are " + str(count) + " barcode files."
print barcodelist
#in barcodelist["file containing lines of barcodes"]["individual barcodes as they appear on each line"]

#sets curr to first barcode in first file
#curr is ["index for file containing barcodes", current barcode]
curr = [0, 1]
currFile = barcodelist[curr[0]][0]
currCode = barcodelist[curr[0]][1]


#the method for processing each line
def processLine(line):
	linebarcode = re.search('(?<=\:)[GATC]{6}', line).group(0)
	#when reading lines matching current barcode
	if linebarcode == currCode:
		currFile.write(line)
	#when line doesn't match current barcode: 
	else:
		#start by searching through other barcodes in the file
		c = 0
		for a in barcodelist[curr[0]]:
			#skip first line (file)
			if c == 0:
				c = 1
				pass
			else:
				#if match, write to currFile (should still be same)
				if linebarcode == a:
					currFile.write(line)
					c = -1
		#what to do if the line's barcode isn't in current set of barcodes
		if c != -1:
			for barcodefile in barcodelist:
				c += 1
				for barcode in barcodefile:
					if barcode == linebarcode:
						barcodefile[0].write(line)


#how to handle reading pipe
mode = os.fstat(0).st_mode
if stat.S_ISFIFO(mode):
	while True:
		try:
			line = raw_input()
			if line == '':
				break
			print line
			#processLine(line)
		except EOFError:
			break

#handling bam input files
elif options.bampath != None:
	sam_args = ['/usr/local/bin/samtools', 'view', options.bamfile]
	samtools = subprocess.Popen(args,stdout=PIPE)
	while True:
		try:
			for line in samtools.stdout:
				processLine(line)
		
		except EOFError:
			break

#handling sam input files
else:
	samfile = open(options.sampath, 'r')
	for line in samfile:
		processLine(line)