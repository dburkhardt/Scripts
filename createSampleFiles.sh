#!/bin/bash
#$ -S /bin/bash
# run job in the current working directory where qsub is executed from
#$ -cwd
# Tell the SGE that this is an array job, with "tasks" to be numbered 1 to 4, task number is stored in the variable SGE_TASK_ID
#$ -t 1-10
#$ -l m_mem_free=1G

if [ $((SGE_TASK_ID%2)) -eq 1 ]
then
	PREFIX="1.rtx700"
fi

if [ $((SGE_TASK_ID%2)) -eq 0 ]
then
	PREFIX="2.sc56"
fi


#BOWTIE use '$SGE_TASK_ID.<file>'
if [ $SGE_TASK_ID -eq 1 ] || [ $SGE_TASK_ID -eq 2 ]
	then 
		samtools view -b ~/data/*/$PREFIX.bowtie2.sorted.bam 1:1-1,000,000 -o ~/data/sampleData/$PREFIX.bowtie2.sample.bam
fi


#BWA use '$(($SGE_TASK_ID - 4)).file'
if [ $SGE_TASK_ID -eq 3 ] || [ $SGE_TASK_ID -eq 4 ]
then 
	samtools view -b ~/data/*/$PREFIX.bwa.sorted.bam 1:1-1,000,000 -o ~/data/sampleData/$PREFIX.bwa.sample.bam
fi


#NOVO use '$(($SGE_TASK_ID - 8)).file'
if [ $SGE_TASK_ID -eq 5 ] || [ $SGE_TASK_ID -eq 6 ]
then 
	samtools view -b ~/data/*/$PREFIX.novo.sorted.bam 1:1-1,000,000 -o ~/data/sampleData/$PREFIX.novo.sample.bam
fi


#SOAP2PE use '$(($SGE_TASK_ID - 12)).file'
if [ $SGE_TASK_ID -eq 7 ] || [ $SGE_TASK_ID -eq 8 ]
then 
	samtools view -b ~/data/*/$PREFIX.soap.PE.sorted.bam 1:1-1,000,000 -o ~/data/sampleData/$PREFIX.soap.PE.sample.bam
fi

#STAMPY use '$(($SGE_TASK_ID - 20)).file'
if [ $SGE_TASK_ID -eq 9 ] || [ $SGE_TASK_ID -eq 10 ]
then 
	samtools view -b ~/data/*/$PREFIX.stampy.sorted.bam 1:1-1,000,000 -o ~/data/sampleData/$PREFIX.stampy.sample.bam
fi