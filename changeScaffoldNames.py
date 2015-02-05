#!/usr/bin/python
#scaffold00994
f = open('/home/dan/archive/10.16.14_Starting_Binning/essential.txt','r')
lines = []
for l in f:
	lines.append(l.split(" "))
for line in lines:
	if line == lines[0]:
		pass
	else:
		a = line[0]
		if a > 99999:
			line[0] = "scaffold" + a
		elif a < 10:
			line[0] = "scaffold0000" + a
		elif a < 100:
			line[0] = "scaffold000" + a
		elif a < 1000:
			line[0] = "scaffold00" + a
		elif a < 10000:	
			line[0] = "scaffold0" + a
f.close()
for line in lines:
	print line

#scaffold33464
#2
#TIGR03594
#
#MEGAN +g -x "import blastfile= assembly.orfs.hmm.blast.xml meganfile=temp.rma;recompute toppercent=5;recompute minsupport=1;update;collapse rank=Species;update;select nodes=all;export what=CSV format=readname_taxonpath separator=tab file=SECONDTRYassembly.orfs.hmm.blast.tax.txt;update;close"
#
#sed 's/\t/;/' SECONDTRYassembly.orfs.hmm.blast.tax.txt | cut -f1,5 -d ";" | sed 's/;/\t/' | sed 's/_/\t/' > SECONDTRYassembly.orfs.hmm.blast.tax.tab
#
#Actinobacteria <phylum>
#Chloroflexi <phylum>
#Thermotogae <phylum>
#Chlamydiae/Verrucomicrobia group
#Aquificae <phylum>
#Fibrobacteres/Acidobacteria group