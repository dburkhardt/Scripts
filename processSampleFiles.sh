#import statements
import subprocess

#variables
pathToScript = "/sonas-hs/ware/hpc/home/dburkhar/archive/7.11/"
pathToFiles = "/sonas-hs/ware/hpc/home/dburkhar/data/*/"
tmpdir = "/sonas-hs/ware/hpc/home/dburkhar/tmp/"
outdir = "/sonas-hs/ware/hpc/home/dburkhar/data/mergedBedFiles"
pattern = ['1.rtx700' , '2.sc56']
#print "ls -1 %s | grep %s.*.sorted.bam$ > %s.%s.filenames.txt" % (pathToFiles, str, tmpdir, str)

#creates a list
for str in pattern:
        subprocess.call( "ls -1 %s | grep %s.*.sorted.bam$ > %s/%s.filenames.txt" % (pathToFiles, str, tmpdir, str) , shell=True )
        filenames = [line.rstrip() for line in open("%s/%s.filenames.txt" % (tmpdir, str))]
        filenames.sort()
        for a in filenames:
                print "merging %s" % (a)
                alignerForA = a.split('.')[2] #returns the third item in the file name (this should be the aligner name)
                outfile = "%s/%s.%s.sorted.bed" % (outdir,str,alignerForA)
                fileA = pathToFiles+a
                print "qsub %s/bedmerge.sh %s %s" % (pathToScript,fileA,outfile)
                #subprocess.call("qsub %sbedmerge.sh %s %s" % (pathToScript,fileA,outfile) , shell=True)