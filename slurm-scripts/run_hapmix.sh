#!/bin/bash
#SBATCH -D /home/jolyang/Documents/Github/N2
#SBATCH -o /home/jolyang/Documents/Github/N2/slurm-log/testout-%j.txt
#SBATCH -e /home/jolyang/Documents/Github/N2/slurm-log/err-%j.txt
#SBATCH -J run_hapmix.sh
#SBATCH--mail-user=yangjl0930@gmail.com
#SBATCH--mail-type=END
#SBATCH--mail-type=FAIL #email if fails
set -e
set -u

cd largedata/hapmixrun
perl bin/runHapmix.pl hprun_gen1610_chr1.par
perl bin/runHapmix.pl hprun_gen1610_chr2.par
perl bin/runHapmix.pl hprun_gen1610_chr3.par
perl bin/runHapmix.pl hprun_gen1610_chr4.par
perl bin/runHapmix.pl hprun_gen1610_chr5.par
perl bin/runHapmix.pl hprun_gen1610_chr6.par
perl bin/runHapmix.pl hprun_gen1610_chr7.par
perl bin/runHapmix.pl hprun_gen1610_chr8.par
perl bin/runHapmix.pl hprun_gen1610_chr9.par
perl bin/runHapmix.pl hprun_gen1610_chr10.par
