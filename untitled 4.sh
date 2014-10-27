qsub /sonas-hs/ware/hpc/home/dburkhar/archive/7.11//bedmerge.sh 
/sonas-hs/ware/hpc/home/dburkhar/data/*/2.sc56.soap.PE.sorted.bam 
/sonas-hs/ware/hpc/home/dburkhar/data/mergedBedFiles/2.sc56.soap.sorted.bed


bedtools merge -i /sonas-hs/ware/hpc/home/dburkhar/data/*/2.sc56.soap.PE.sorted.bam -c 1,5 -o count,mean | head -n 45