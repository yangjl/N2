#!/bin/bash
#SBATCH -D /Users/yangjl/Documents/Github/Introgression
#SBATCH -o /home/jolyang/Documents/Github/Introgression/slurm-log/testout-%j.txt
#SBATCH -e /home/jolyang/Documents/Github/Introgression/slurm-log/error-%j.txt
#SBATCH -J jobid
set -e
set -u

fastPHASE -oMex -S1234 mex_120.fp

python /home/jolyang/bin/send_email.py -s profiling/1.Introgression/1.A.3_slurm.sh
