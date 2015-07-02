#!/bin/bash
#SBATCH -D /home/jolyang/Documents/Github/N2
#SBATCH -o /home/jolyang/Documents/Github/N2/slurm-log/testout-%j.txt
#SBATCH -e /home/jolyang/Documents/Github/N2/slurm-log/err-%j.txt
#SBATCH -J run_jacknife.sh
#SBATCH--mail-user=yangjl0930@gmail.com
#SBATCH--mail-type=END
#SBATCH--mail-type=FAIL #email if fails
set -e
set -u

cd largedata/hapmixjack
perl bin/runHapmix.pl jnrun_gen1610_l2_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l2_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l2_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l2_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l2_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l2_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l2_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l2_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l2_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l2_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l3_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l3_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l3_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l3_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l3_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l3_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l3_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l3_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l3_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l3_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l4_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l4_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l4_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l4_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l4_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l4_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l4_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l4_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l4_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l4_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l5_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l5_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l5_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l5_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l5_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l5_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l5_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l5_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l5_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l5_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l6_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l6_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l6_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l6_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l6_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l6_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l6_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l6_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l6_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l6_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l7_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l7_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l7_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l7_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l7_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l7_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l7_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l7_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l7_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l7_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l8_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l8_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l8_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l8_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l8_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l8_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l8_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l8_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l8_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l8_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l9_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l9_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l9_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l9_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l9_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l9_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l9_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l9_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l9_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l9_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l10_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l10_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l10_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l10_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l10_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l10_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l10_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l10_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l10_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l10_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l11_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l11_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l11_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l11_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l11_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l11_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l11_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l11_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l11_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l11_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l12_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l12_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l12_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l12_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l12_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l12_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l12_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l12_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l12_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l12_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l13_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l13_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l13_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l13_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l13_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l13_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l13_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l13_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l13_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l13_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l14_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l14_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l14_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l14_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l14_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l14_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l14_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l14_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l14_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l14_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l15_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l15_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l15_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l15_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l15_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l15_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l15_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l15_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l15_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l15_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l16_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l16_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l16_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l16_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l16_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l16_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l16_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l16_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l16_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l16_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l17_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l17_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l17_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l17_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l17_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l17_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l17_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l17_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l17_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l17_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l18_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l18_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l18_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l18_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l18_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l18_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l18_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l18_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l18_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l18_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l19_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l19_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l19_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l19_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l19_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l19_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l19_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l19_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l19_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l19_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l20_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l20_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l20_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l20_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l20_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l20_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l20_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l20_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l20_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l20_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l21_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l21_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l21_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l21_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l21_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l21_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l21_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l21_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l21_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l21_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l22_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l22_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l22_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l22_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l22_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l22_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l22_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l22_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l22_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l22_chr10.par
perl bin/runHapmix.pl jnrun_gen1610_l23_chr1.par
perl bin/runHapmix.pl jnrun_gen1610_l23_chr2.par
perl bin/runHapmix.pl jnrun_gen1610_l23_chr3.par
perl bin/runHapmix.pl jnrun_gen1610_l23_chr4.par
perl bin/runHapmix.pl jnrun_gen1610_l23_chr5.par
perl bin/runHapmix.pl jnrun_gen1610_l23_chr6.par
perl bin/runHapmix.pl jnrun_gen1610_l23_chr7.par
perl bin/runHapmix.pl jnrun_gen1610_l23_chr8.par
perl bin/runHapmix.pl jnrun_gen1610_l23_chr9.par
perl bin/runHapmix.pl jnrun_gen1610_l23_chr10.par
