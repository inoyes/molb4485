#!/bin/bash
#SBATCH -J Trim
#SBATCH -n 1
#SBATCH --cpus-per-task=4
#SBATCH -t 30:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=inoyes@uwyo.edu


#SBATCH --account=inbre-train

echo "starting up"

module load swset gcc
module load trimmomatic

echo "modules loaded"

trimmomatic PE \
-threads 4 \
ERR013161_1.filt.fastq.gz ERR013161_2.filt.fastq.gz \
./fwd_pair.fq ./fwd_unpair.fq ./rev_pair.fq ./rev_unpair.fq \
HEADCROP:10 \
SLIDINGWINDOW:4:24 \
MINLEN:80
echo "finished"
