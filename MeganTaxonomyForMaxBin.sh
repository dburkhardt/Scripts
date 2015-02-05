for a in  021 031 024 007 030 011 015 023 018
	do 
	echo processing firstRun.$a.fasta....
	blastn -db /home/software/ncbi-blast-2.2.29+/db/nt -query /home/dan/archive/10.28.14_testing_MaxBin/firstRun.$a.fasta -out firstRun.$a.blast -num_threads 4 -num_descriptions 10 -num_alignments 10 &
done

	blastn -db /home/software/ncbi-blast-2.2.29+/db/16SMicrobial -query /home/dan/archive/10.28.14_testing_MaxBin/firstRun.$a.fasta -out firstRun.$a.16S.blast -num_threads 16 -num_descriptions 10 -num_alignments 10 &
done

blastn -db /home/software/ncbi-blast-2.2.29+/db/nt -query /home/dan/archive/10.28.14_testing_MaxBin/firstRun.015.fasta -out bin015.blast -num_threads 2 -num_descriptions 10 -num_alignments 10 &

blastn -db /home/software/ncbi-blast-2.2.29+/db/nt -query /home/dan/archive/10.28.14_testing_MaxBin/firstRun.$a.fasta -out firstRun.$a.blast -num_threads 4 -num_descriptions 10 -num_alignments 10 &

for a in  021 031 024 007 030 011 015 023 018
	do 
	echo processing firstRun.$a.fasta....
	blastn -db /home/software/ncbi-blast-2.2.29+/db/nt -query /home/dan/archive/10.28.14_testing_MaxBin/firstRun.$a.fasta -evalue 1e-5 -num_threads 4 -max_target_seqs 5 -outfmt 5 -out firstRun.$a.blast.xml &
done

for a in  021 031 024 007 030 011 015 023 018
	do 
	echo processing firstRun.$a.fasta....
	MEGAN +g -x "import blastfile= firstRun.$a.blast.xml meganfile=temp.$a.rma;recompute toppercent=5;recompute minsupport=1;update;collapse rank=Species;update;select nodes=all;export what=CSV format=readname_taxonpath separator=tab file=firstRun.$a.tax.txt;update;close" &
done

MEGAN +g -x "import blastfile= firstRun.$a.blast.xml meganfile=temp.$a.rma;recompute toppercent=5;recompute minsupport=1;update;collapse rank=Species;update;select nodes=all;export what=CSV format=readname_taxonpath separator=tab file=firstRun.$a.tax.txt;update;close"
07 Proteobacteria
11 Proteobacteria
15 Mixed
18 Proteobacteria
21 Proteobacteria
23 Mixed
24 Proteobacteria
30 Mixed
31 Proteobacteri
