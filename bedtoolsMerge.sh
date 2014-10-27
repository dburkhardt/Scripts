#!/bin/bash
#$ -S /bin/bash
# run job in the current working directory where qsub is executed from
#$ -cwd
# Tell the SGE that this is an array job, with "tasks" to be numbered 1 to 4, task number is stored in the variable SGE_TASK_ID
#$ -l m_mem_free=1G

dir=$(dirname $2)

mkdir -p $dir

samtools view -bq 1 $1 | bedtools bamtobed -i stdin | bedtools merge -c 1,5 -o count,mean -i stdin | head > $2
