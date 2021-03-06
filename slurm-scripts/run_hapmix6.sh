#!/bin/bash
#SBATCH -D /home/jolyang/Documents/Github/N2
#SBATCH -o /home/jolyang/Documents/Github/N2/slurm-log/testout-%j.txt
#SBATCH -e /home/jolyang/Documents/Github/N2/slurm-log/err-%j.txt
#SBATCH -J run_hapmix6.sh
#SBATCH--mail-user=yangjl0930@gmail.com
#SBATCH--mail-type=END
#SBATCH--mail-type=FAIL #email if fails
set -e
set -u

cd largedata/hapmixrun6
perl bin/runHapmix.pl hprun_gen2510_chr1.par
perl bin/runHapmix.pl hprun_gen2510_chr2.par
perl bin/runHapmix.pl hprun_gen2510_chr3.par
perl bin/runHapmix.pl hprun_gen2510_chr4.par
perl bin/runHapmix.pl hprun_gen2510_chr5.par
perl bin/runHapmix.pl hprun_gen2510_chr6.par
perl bin/runHapmix.pl hprun_gen2510_chr7.par
perl bin/runHapmix.pl hprun_gen2510_chr8.par
perl bin/runHapmix.pl hprun_gen2510_chr9.par
perl bin/runHapmix.pl hprun_gen2510_chr10.par
perl bin/runHapmix.pl hprun_gen2520_chr1.par
perl bin/runHapmix.pl hprun_gen2520_chr2.par
perl bin/runHapmix.pl hprun_gen2520_chr3.par
perl bin/runHapmix.pl hprun_gen2520_chr4.par
perl bin/runHapmix.pl hprun_gen2520_chr5.par
perl bin/runHapmix.pl hprun_gen2520_chr6.par
perl bin/runHapmix.pl hprun_gen2520_chr7.par
perl bin/runHapmix.pl hprun_gen2520_chr8.par
perl bin/runHapmix.pl hprun_gen2520_chr9.par
perl bin/runHapmix.pl hprun_gen2520_chr10.par
perl bin/runHapmix.pl hprun_gen2530_chr1.par
perl bin/runHapmix.pl hprun_gen2530_chr2.par
perl bin/runHapmix.pl hprun_gen2530_chr3.par
perl bin/runHapmix.pl hprun_gen2530_chr4.par
perl bin/runHapmix.pl hprun_gen2530_chr5.par
perl bin/runHapmix.pl hprun_gen2530_chr6.par
perl bin/runHapmix.pl hprun_gen2530_chr7.par
perl bin/runHapmix.pl hprun_gen2530_chr8.par
perl bin/runHapmix.pl hprun_gen2530_chr9.par
perl bin/runHapmix.pl hprun_gen2530_chr10.par
perl bin/runHapmix.pl hprun_gen2540_chr1.par
perl bin/runHapmix.pl hprun_gen2540_chr2.par
perl bin/runHapmix.pl hprun_gen2540_chr3.par
perl bin/runHapmix.pl hprun_gen2540_chr4.par
perl bin/runHapmix.pl hprun_gen2540_chr5.par
perl bin/runHapmix.pl hprun_gen2540_chr6.par
perl bin/runHapmix.pl hprun_gen2540_chr7.par
perl bin/runHapmix.pl hprun_gen2540_chr8.par
perl bin/runHapmix.pl hprun_gen2540_chr9.par
perl bin/runHapmix.pl hprun_gen2540_chr10.par
perl bin/runHapmix.pl hprun_gen2550_chr1.par
perl bin/runHapmix.pl hprun_gen2550_chr2.par
perl bin/runHapmix.pl hprun_gen2550_chr3.par
perl bin/runHapmix.pl hprun_gen2550_chr4.par
perl bin/runHapmix.pl hprun_gen2550_chr5.par
perl bin/runHapmix.pl hprun_gen2550_chr6.par
perl bin/runHapmix.pl hprun_gen2550_chr7.par
perl bin/runHapmix.pl hprun_gen2550_chr8.par
perl bin/runHapmix.pl hprun_gen2550_chr9.par
perl bin/runHapmix.pl hprun_gen2550_chr10.par
perl bin/runHapmix.pl hprun_gen2560_chr1.par
perl bin/runHapmix.pl hprun_gen2560_chr2.par
perl bin/runHapmix.pl hprun_gen2560_chr3.par
perl bin/runHapmix.pl hprun_gen2560_chr4.par
perl bin/runHapmix.pl hprun_gen2560_chr5.par
perl bin/runHapmix.pl hprun_gen2560_chr6.par
perl bin/runHapmix.pl hprun_gen2560_chr7.par
perl bin/runHapmix.pl hprun_gen2560_chr8.par
perl bin/runHapmix.pl hprun_gen2560_chr9.par
perl bin/runHapmix.pl hprun_gen2560_chr10.par
perl bin/runHapmix.pl hprun_gen2570_chr1.par
perl bin/runHapmix.pl hprun_gen2570_chr2.par
perl bin/runHapmix.pl hprun_gen2570_chr3.par
perl bin/runHapmix.pl hprun_gen2570_chr4.par
perl bin/runHapmix.pl hprun_gen2570_chr5.par
perl bin/runHapmix.pl hprun_gen2570_chr6.par
perl bin/runHapmix.pl hprun_gen2570_chr7.par
perl bin/runHapmix.pl hprun_gen2570_chr8.par
perl bin/runHapmix.pl hprun_gen2570_chr9.par
perl bin/runHapmix.pl hprun_gen2570_chr10.par
perl bin/runHapmix.pl hprun_gen2580_chr1.par
perl bin/runHapmix.pl hprun_gen2580_chr2.par
perl bin/runHapmix.pl hprun_gen2580_chr3.par
perl bin/runHapmix.pl hprun_gen2580_chr4.par
perl bin/runHapmix.pl hprun_gen2580_chr5.par
perl bin/runHapmix.pl hprun_gen2580_chr6.par
perl bin/runHapmix.pl hprun_gen2580_chr7.par
perl bin/runHapmix.pl hprun_gen2580_chr8.par
perl bin/runHapmix.pl hprun_gen2580_chr9.par
perl bin/runHapmix.pl hprun_gen2580_chr10.par
perl bin/runHapmix.pl hprun_gen2590_chr1.par
perl bin/runHapmix.pl hprun_gen2590_chr2.par
perl bin/runHapmix.pl hprun_gen2590_chr3.par
perl bin/runHapmix.pl hprun_gen2590_chr4.par
perl bin/runHapmix.pl hprun_gen2590_chr5.par
perl bin/runHapmix.pl hprun_gen2590_chr6.par
perl bin/runHapmix.pl hprun_gen2590_chr7.par
perl bin/runHapmix.pl hprun_gen2590_chr8.par
perl bin/runHapmix.pl hprun_gen2590_chr9.par
perl bin/runHapmix.pl hprun_gen2590_chr10.par
perl bin/runHapmix.pl hprun_gen2600_chr1.par
perl bin/runHapmix.pl hprun_gen2600_chr2.par
perl bin/runHapmix.pl hprun_gen2600_chr3.par
perl bin/runHapmix.pl hprun_gen2600_chr4.par
perl bin/runHapmix.pl hprun_gen2600_chr5.par
perl bin/runHapmix.pl hprun_gen2600_chr6.par
perl bin/runHapmix.pl hprun_gen2600_chr7.par
perl bin/runHapmix.pl hprun_gen2600_chr8.par
perl bin/runHapmix.pl hprun_gen2600_chr9.par
perl bin/runHapmix.pl hprun_gen2600_chr10.par
perl bin/runHapmix.pl hprun_gen2610_chr1.par
perl bin/runHapmix.pl hprun_gen2610_chr2.par
perl bin/runHapmix.pl hprun_gen2610_chr3.par
perl bin/runHapmix.pl hprun_gen2610_chr4.par
perl bin/runHapmix.pl hprun_gen2610_chr5.par
perl bin/runHapmix.pl hprun_gen2610_chr6.par
perl bin/runHapmix.pl hprun_gen2610_chr7.par
perl bin/runHapmix.pl hprun_gen2610_chr8.par
perl bin/runHapmix.pl hprun_gen2610_chr9.par
perl bin/runHapmix.pl hprun_gen2610_chr10.par
perl bin/runHapmix.pl hprun_gen2620_chr1.par
perl bin/runHapmix.pl hprun_gen2620_chr2.par
perl bin/runHapmix.pl hprun_gen2620_chr3.par
perl bin/runHapmix.pl hprun_gen2620_chr4.par
perl bin/runHapmix.pl hprun_gen2620_chr5.par
perl bin/runHapmix.pl hprun_gen2620_chr6.par
perl bin/runHapmix.pl hprun_gen2620_chr7.par
perl bin/runHapmix.pl hprun_gen2620_chr8.par
perl bin/runHapmix.pl hprun_gen2620_chr9.par
perl bin/runHapmix.pl hprun_gen2620_chr10.par
perl bin/runHapmix.pl hprun_gen2630_chr1.par
perl bin/runHapmix.pl hprun_gen2630_chr2.par
perl bin/runHapmix.pl hprun_gen2630_chr3.par
perl bin/runHapmix.pl hprun_gen2630_chr4.par
perl bin/runHapmix.pl hprun_gen2630_chr5.par
perl bin/runHapmix.pl hprun_gen2630_chr6.par
perl bin/runHapmix.pl hprun_gen2630_chr7.par
perl bin/runHapmix.pl hprun_gen2630_chr8.par
perl bin/runHapmix.pl hprun_gen2630_chr9.par
perl bin/runHapmix.pl hprun_gen2630_chr10.par
perl bin/runHapmix.pl hprun_gen2640_chr1.par
perl bin/runHapmix.pl hprun_gen2640_chr2.par
perl bin/runHapmix.pl hprun_gen2640_chr3.par
perl bin/runHapmix.pl hprun_gen2640_chr4.par
perl bin/runHapmix.pl hprun_gen2640_chr5.par
perl bin/runHapmix.pl hprun_gen2640_chr6.par
perl bin/runHapmix.pl hprun_gen2640_chr7.par
perl bin/runHapmix.pl hprun_gen2640_chr8.par
perl bin/runHapmix.pl hprun_gen2640_chr9.par
perl bin/runHapmix.pl hprun_gen2640_chr10.par
perl bin/runHapmix.pl hprun_gen2650_chr1.par
perl bin/runHapmix.pl hprun_gen2650_chr2.par
perl bin/runHapmix.pl hprun_gen2650_chr3.par
perl bin/runHapmix.pl hprun_gen2650_chr4.par
perl bin/runHapmix.pl hprun_gen2650_chr5.par
perl bin/runHapmix.pl hprun_gen2650_chr6.par
perl bin/runHapmix.pl hprun_gen2650_chr7.par
perl bin/runHapmix.pl hprun_gen2650_chr8.par
perl bin/runHapmix.pl hprun_gen2650_chr9.par
perl bin/runHapmix.pl hprun_gen2650_chr10.par
perl bin/runHapmix.pl hprun_gen2660_chr1.par
perl bin/runHapmix.pl hprun_gen2660_chr2.par
perl bin/runHapmix.pl hprun_gen2660_chr3.par
perl bin/runHapmix.pl hprun_gen2660_chr4.par
perl bin/runHapmix.pl hprun_gen2660_chr5.par
perl bin/runHapmix.pl hprun_gen2660_chr6.par
perl bin/runHapmix.pl hprun_gen2660_chr7.par
perl bin/runHapmix.pl hprun_gen2660_chr8.par
perl bin/runHapmix.pl hprun_gen2660_chr9.par
perl bin/runHapmix.pl hprun_gen2660_chr10.par
perl bin/runHapmix.pl hprun_gen2670_chr1.par
perl bin/runHapmix.pl hprun_gen2670_chr2.par
perl bin/runHapmix.pl hprun_gen2670_chr3.par
perl bin/runHapmix.pl hprun_gen2670_chr4.par
perl bin/runHapmix.pl hprun_gen2670_chr5.par
perl bin/runHapmix.pl hprun_gen2670_chr6.par
perl bin/runHapmix.pl hprun_gen2670_chr7.par
perl bin/runHapmix.pl hprun_gen2670_chr8.par
perl bin/runHapmix.pl hprun_gen2670_chr9.par
perl bin/runHapmix.pl hprun_gen2670_chr10.par
perl bin/runHapmix.pl hprun_gen2680_chr1.par
perl bin/runHapmix.pl hprun_gen2680_chr2.par
perl bin/runHapmix.pl hprun_gen2680_chr3.par
perl bin/runHapmix.pl hprun_gen2680_chr4.par
perl bin/runHapmix.pl hprun_gen2680_chr5.par
perl bin/runHapmix.pl hprun_gen2680_chr6.par
perl bin/runHapmix.pl hprun_gen2680_chr7.par
perl bin/runHapmix.pl hprun_gen2680_chr8.par
perl bin/runHapmix.pl hprun_gen2680_chr9.par
perl bin/runHapmix.pl hprun_gen2680_chr10.par
perl bin/runHapmix.pl hprun_gen2690_chr1.par
perl bin/runHapmix.pl hprun_gen2690_chr2.par
perl bin/runHapmix.pl hprun_gen2690_chr3.par
perl bin/runHapmix.pl hprun_gen2690_chr4.par
perl bin/runHapmix.pl hprun_gen2690_chr5.par
perl bin/runHapmix.pl hprun_gen2690_chr6.par
perl bin/runHapmix.pl hprun_gen2690_chr7.par
perl bin/runHapmix.pl hprun_gen2690_chr8.par
perl bin/runHapmix.pl hprun_gen2690_chr9.par
perl bin/runHapmix.pl hprun_gen2690_chr10.par
perl bin/runHapmix.pl hprun_gen2700_chr1.par
perl bin/runHapmix.pl hprun_gen2700_chr2.par
perl bin/runHapmix.pl hprun_gen2700_chr3.par
perl bin/runHapmix.pl hprun_gen2700_chr4.par
perl bin/runHapmix.pl hprun_gen2700_chr5.par
perl bin/runHapmix.pl hprun_gen2700_chr6.par
perl bin/runHapmix.pl hprun_gen2700_chr7.par
perl bin/runHapmix.pl hprun_gen2700_chr8.par
perl bin/runHapmix.pl hprun_gen2700_chr9.par
perl bin/runHapmix.pl hprun_gen2700_chr10.par
perl bin/runHapmix.pl hprun_gen2710_chr1.par
perl bin/runHapmix.pl hprun_gen2710_chr2.par
perl bin/runHapmix.pl hprun_gen2710_chr3.par
perl bin/runHapmix.pl hprun_gen2710_chr4.par
perl bin/runHapmix.pl hprun_gen2710_chr5.par
perl bin/runHapmix.pl hprun_gen2710_chr6.par
perl bin/runHapmix.pl hprun_gen2710_chr7.par
perl bin/runHapmix.pl hprun_gen2710_chr8.par
perl bin/runHapmix.pl hprun_gen2710_chr9.par
perl bin/runHapmix.pl hprun_gen2710_chr10.par
perl bin/runHapmix.pl hprun_gen2720_chr1.par
perl bin/runHapmix.pl hprun_gen2720_chr2.par
perl bin/runHapmix.pl hprun_gen2720_chr3.par
perl bin/runHapmix.pl hprun_gen2720_chr4.par
perl bin/runHapmix.pl hprun_gen2720_chr5.par
perl bin/runHapmix.pl hprun_gen2720_chr6.par
perl bin/runHapmix.pl hprun_gen2720_chr7.par
perl bin/runHapmix.pl hprun_gen2720_chr8.par
perl bin/runHapmix.pl hprun_gen2720_chr9.par
perl bin/runHapmix.pl hprun_gen2720_chr10.par
perl bin/runHapmix.pl hprun_gen2730_chr1.par
perl bin/runHapmix.pl hprun_gen2730_chr2.par
perl bin/runHapmix.pl hprun_gen2730_chr3.par
perl bin/runHapmix.pl hprun_gen2730_chr4.par
perl bin/runHapmix.pl hprun_gen2730_chr5.par
perl bin/runHapmix.pl hprun_gen2730_chr6.par
perl bin/runHapmix.pl hprun_gen2730_chr7.par
perl bin/runHapmix.pl hprun_gen2730_chr8.par
perl bin/runHapmix.pl hprun_gen2730_chr9.par
perl bin/runHapmix.pl hprun_gen2730_chr10.par
perl bin/runHapmix.pl hprun_gen2740_chr1.par
perl bin/runHapmix.pl hprun_gen2740_chr2.par
perl bin/runHapmix.pl hprun_gen2740_chr3.par
perl bin/runHapmix.pl hprun_gen2740_chr4.par
perl bin/runHapmix.pl hprun_gen2740_chr5.par
perl bin/runHapmix.pl hprun_gen2740_chr6.par
perl bin/runHapmix.pl hprun_gen2740_chr7.par
perl bin/runHapmix.pl hprun_gen2740_chr8.par
perl bin/runHapmix.pl hprun_gen2740_chr9.par
perl bin/runHapmix.pl hprun_gen2740_chr10.par
perl bin/runHapmix.pl hprun_gen2750_chr1.par
perl bin/runHapmix.pl hprun_gen2750_chr2.par
perl bin/runHapmix.pl hprun_gen2750_chr3.par
perl bin/runHapmix.pl hprun_gen2750_chr4.par
perl bin/runHapmix.pl hprun_gen2750_chr5.par
perl bin/runHapmix.pl hprun_gen2750_chr6.par
perl bin/runHapmix.pl hprun_gen2750_chr7.par
perl bin/runHapmix.pl hprun_gen2750_chr8.par
perl bin/runHapmix.pl hprun_gen2750_chr9.par
perl bin/runHapmix.pl hprun_gen2750_chr10.par
perl bin/runHapmix.pl hprun_gen2760_chr1.par
perl bin/runHapmix.pl hprun_gen2760_chr2.par
perl bin/runHapmix.pl hprun_gen2760_chr3.par
perl bin/runHapmix.pl hprun_gen2760_chr4.par
perl bin/runHapmix.pl hprun_gen2760_chr5.par
perl bin/runHapmix.pl hprun_gen2760_chr6.par
perl bin/runHapmix.pl hprun_gen2760_chr7.par
perl bin/runHapmix.pl hprun_gen2760_chr8.par
perl bin/runHapmix.pl hprun_gen2760_chr9.par
perl bin/runHapmix.pl hprun_gen2760_chr10.par
perl bin/runHapmix.pl hprun_gen2770_chr1.par
perl bin/runHapmix.pl hprun_gen2770_chr2.par
perl bin/runHapmix.pl hprun_gen2770_chr3.par
perl bin/runHapmix.pl hprun_gen2770_chr4.par
perl bin/runHapmix.pl hprun_gen2770_chr5.par
perl bin/runHapmix.pl hprun_gen2770_chr6.par
perl bin/runHapmix.pl hprun_gen2770_chr7.par
perl bin/runHapmix.pl hprun_gen2770_chr8.par
perl bin/runHapmix.pl hprun_gen2770_chr9.par
perl bin/runHapmix.pl hprun_gen2770_chr10.par
perl bin/runHapmix.pl hprun_gen2780_chr1.par
perl bin/runHapmix.pl hprun_gen2780_chr2.par
perl bin/runHapmix.pl hprun_gen2780_chr3.par
perl bin/runHapmix.pl hprun_gen2780_chr4.par
perl bin/runHapmix.pl hprun_gen2780_chr5.par
perl bin/runHapmix.pl hprun_gen2780_chr6.par
perl bin/runHapmix.pl hprun_gen2780_chr7.par
perl bin/runHapmix.pl hprun_gen2780_chr8.par
perl bin/runHapmix.pl hprun_gen2780_chr9.par
perl bin/runHapmix.pl hprun_gen2780_chr10.par
perl bin/runHapmix.pl hprun_gen2790_chr1.par
perl bin/runHapmix.pl hprun_gen2790_chr2.par
perl bin/runHapmix.pl hprun_gen2790_chr3.par
perl bin/runHapmix.pl hprun_gen2790_chr4.par
perl bin/runHapmix.pl hprun_gen2790_chr5.par
perl bin/runHapmix.pl hprun_gen2790_chr6.par
perl bin/runHapmix.pl hprun_gen2790_chr7.par
perl bin/runHapmix.pl hprun_gen2790_chr8.par
perl bin/runHapmix.pl hprun_gen2790_chr9.par
perl bin/runHapmix.pl hprun_gen2790_chr10.par
perl bin/runHapmix.pl hprun_gen2800_chr1.par
perl bin/runHapmix.pl hprun_gen2800_chr2.par
perl bin/runHapmix.pl hprun_gen2800_chr3.par
perl bin/runHapmix.pl hprun_gen2800_chr4.par
perl bin/runHapmix.pl hprun_gen2800_chr5.par
perl bin/runHapmix.pl hprun_gen2800_chr6.par
perl bin/runHapmix.pl hprun_gen2800_chr7.par
perl bin/runHapmix.pl hprun_gen2800_chr8.par
perl bin/runHapmix.pl hprun_gen2800_chr9.par
perl bin/runHapmix.pl hprun_gen2800_chr10.par
perl bin/runHapmix.pl hprun_gen2810_chr1.par
perl bin/runHapmix.pl hprun_gen2810_chr2.par
perl bin/runHapmix.pl hprun_gen2810_chr3.par
perl bin/runHapmix.pl hprun_gen2810_chr4.par
perl bin/runHapmix.pl hprun_gen2810_chr5.par
perl bin/runHapmix.pl hprun_gen2810_chr6.par
perl bin/runHapmix.pl hprun_gen2810_chr7.par
perl bin/runHapmix.pl hprun_gen2810_chr8.par
perl bin/runHapmix.pl hprun_gen2810_chr9.par
perl bin/runHapmix.pl hprun_gen2810_chr10.par
perl bin/runHapmix.pl hprun_gen2820_chr1.par
perl bin/runHapmix.pl hprun_gen2820_chr2.par
perl bin/runHapmix.pl hprun_gen2820_chr3.par
perl bin/runHapmix.pl hprun_gen2820_chr4.par
perl bin/runHapmix.pl hprun_gen2820_chr5.par
perl bin/runHapmix.pl hprun_gen2820_chr6.par
perl bin/runHapmix.pl hprun_gen2820_chr7.par
perl bin/runHapmix.pl hprun_gen2820_chr8.par
perl bin/runHapmix.pl hprun_gen2820_chr9.par
perl bin/runHapmix.pl hprun_gen2820_chr10.par
perl bin/runHapmix.pl hprun_gen2830_chr1.par
perl bin/runHapmix.pl hprun_gen2830_chr2.par
perl bin/runHapmix.pl hprun_gen2830_chr3.par
perl bin/runHapmix.pl hprun_gen2830_chr4.par
perl bin/runHapmix.pl hprun_gen2830_chr5.par
perl bin/runHapmix.pl hprun_gen2830_chr6.par
perl bin/runHapmix.pl hprun_gen2830_chr7.par
perl bin/runHapmix.pl hprun_gen2830_chr8.par
perl bin/runHapmix.pl hprun_gen2830_chr9.par
perl bin/runHapmix.pl hprun_gen2830_chr10.par
perl bin/runHapmix.pl hprun_gen2840_chr1.par
perl bin/runHapmix.pl hprun_gen2840_chr2.par
perl bin/runHapmix.pl hprun_gen2840_chr3.par
perl bin/runHapmix.pl hprun_gen2840_chr4.par
perl bin/runHapmix.pl hprun_gen2840_chr5.par
perl bin/runHapmix.pl hprun_gen2840_chr6.par
perl bin/runHapmix.pl hprun_gen2840_chr7.par
perl bin/runHapmix.pl hprun_gen2840_chr8.par
perl bin/runHapmix.pl hprun_gen2840_chr9.par
perl bin/runHapmix.pl hprun_gen2840_chr10.par
perl bin/runHapmix.pl hprun_gen2850_chr1.par
perl bin/runHapmix.pl hprun_gen2850_chr2.par
perl bin/runHapmix.pl hprun_gen2850_chr3.par
perl bin/runHapmix.pl hprun_gen2850_chr4.par
perl bin/runHapmix.pl hprun_gen2850_chr5.par
perl bin/runHapmix.pl hprun_gen2850_chr6.par
perl bin/runHapmix.pl hprun_gen2850_chr7.par
perl bin/runHapmix.pl hprun_gen2850_chr8.par
perl bin/runHapmix.pl hprun_gen2850_chr9.par
perl bin/runHapmix.pl hprun_gen2850_chr10.par
perl bin/runHapmix.pl hprun_gen2860_chr1.par
perl bin/runHapmix.pl hprun_gen2860_chr2.par
perl bin/runHapmix.pl hprun_gen2860_chr3.par
perl bin/runHapmix.pl hprun_gen2860_chr4.par
perl bin/runHapmix.pl hprun_gen2860_chr5.par
perl bin/runHapmix.pl hprun_gen2860_chr6.par
perl bin/runHapmix.pl hprun_gen2860_chr7.par
perl bin/runHapmix.pl hprun_gen2860_chr8.par
perl bin/runHapmix.pl hprun_gen2860_chr9.par
perl bin/runHapmix.pl hprun_gen2860_chr10.par
perl bin/runHapmix.pl hprun_gen2870_chr1.par
perl bin/runHapmix.pl hprun_gen2870_chr2.par
perl bin/runHapmix.pl hprun_gen2870_chr3.par
perl bin/runHapmix.pl hprun_gen2870_chr4.par
perl bin/runHapmix.pl hprun_gen2870_chr5.par
perl bin/runHapmix.pl hprun_gen2870_chr6.par
perl bin/runHapmix.pl hprun_gen2870_chr7.par
perl bin/runHapmix.pl hprun_gen2870_chr8.par
perl bin/runHapmix.pl hprun_gen2870_chr9.par
perl bin/runHapmix.pl hprun_gen2870_chr10.par
perl bin/runHapmix.pl hprun_gen2880_chr1.par
perl bin/runHapmix.pl hprun_gen2880_chr2.par
perl bin/runHapmix.pl hprun_gen2880_chr3.par
perl bin/runHapmix.pl hprun_gen2880_chr4.par
perl bin/runHapmix.pl hprun_gen2880_chr5.par
perl bin/runHapmix.pl hprun_gen2880_chr6.par
perl bin/runHapmix.pl hprun_gen2880_chr7.par
perl bin/runHapmix.pl hprun_gen2880_chr8.par
perl bin/runHapmix.pl hprun_gen2880_chr9.par
perl bin/runHapmix.pl hprun_gen2880_chr10.par
perl bin/runHapmix.pl hprun_gen2890_chr1.par
perl bin/runHapmix.pl hprun_gen2890_chr2.par
perl bin/runHapmix.pl hprun_gen2890_chr3.par
perl bin/runHapmix.pl hprun_gen2890_chr4.par
perl bin/runHapmix.pl hprun_gen2890_chr5.par
perl bin/runHapmix.pl hprun_gen2890_chr6.par
perl bin/runHapmix.pl hprun_gen2890_chr7.par
perl bin/runHapmix.pl hprun_gen2890_chr8.par
perl bin/runHapmix.pl hprun_gen2890_chr9.par
perl bin/runHapmix.pl hprun_gen2890_chr10.par
perl bin/runHapmix.pl hprun_gen2900_chr1.par
perl bin/runHapmix.pl hprun_gen2900_chr2.par
perl bin/runHapmix.pl hprun_gen2900_chr3.par
perl bin/runHapmix.pl hprun_gen2900_chr4.par
perl bin/runHapmix.pl hprun_gen2900_chr5.par
perl bin/runHapmix.pl hprun_gen2900_chr6.par
perl bin/runHapmix.pl hprun_gen2900_chr7.par
perl bin/runHapmix.pl hprun_gen2900_chr8.par
perl bin/runHapmix.pl hprun_gen2900_chr9.par
perl bin/runHapmix.pl hprun_gen2900_chr10.par
perl bin/runHapmix.pl hprun_gen2910_chr1.par
perl bin/runHapmix.pl hprun_gen2910_chr2.par
perl bin/runHapmix.pl hprun_gen2910_chr3.par
perl bin/runHapmix.pl hprun_gen2910_chr4.par
perl bin/runHapmix.pl hprun_gen2910_chr5.par
perl bin/runHapmix.pl hprun_gen2910_chr6.par
perl bin/runHapmix.pl hprun_gen2910_chr7.par
perl bin/runHapmix.pl hprun_gen2910_chr8.par
perl bin/runHapmix.pl hprun_gen2910_chr9.par
perl bin/runHapmix.pl hprun_gen2910_chr10.par
perl bin/runHapmix.pl hprun_gen2920_chr1.par
perl bin/runHapmix.pl hprun_gen2920_chr2.par
perl bin/runHapmix.pl hprun_gen2920_chr3.par
perl bin/runHapmix.pl hprun_gen2920_chr4.par
perl bin/runHapmix.pl hprun_gen2920_chr5.par
perl bin/runHapmix.pl hprun_gen2920_chr6.par
perl bin/runHapmix.pl hprun_gen2920_chr7.par
perl bin/runHapmix.pl hprun_gen2920_chr8.par
perl bin/runHapmix.pl hprun_gen2920_chr9.par
perl bin/runHapmix.pl hprun_gen2920_chr10.par
perl bin/runHapmix.pl hprun_gen2930_chr1.par
perl bin/runHapmix.pl hprun_gen2930_chr2.par
perl bin/runHapmix.pl hprun_gen2930_chr3.par
perl bin/runHapmix.pl hprun_gen2930_chr4.par
perl bin/runHapmix.pl hprun_gen2930_chr5.par
perl bin/runHapmix.pl hprun_gen2930_chr6.par
perl bin/runHapmix.pl hprun_gen2930_chr7.par
perl bin/runHapmix.pl hprun_gen2930_chr8.par
perl bin/runHapmix.pl hprun_gen2930_chr9.par
perl bin/runHapmix.pl hprun_gen2930_chr10.par
perl bin/runHapmix.pl hprun_gen2940_chr1.par
perl bin/runHapmix.pl hprun_gen2940_chr2.par
perl bin/runHapmix.pl hprun_gen2940_chr3.par
perl bin/runHapmix.pl hprun_gen2940_chr4.par
perl bin/runHapmix.pl hprun_gen2940_chr5.par
perl bin/runHapmix.pl hprun_gen2940_chr6.par
perl bin/runHapmix.pl hprun_gen2940_chr7.par
perl bin/runHapmix.pl hprun_gen2940_chr8.par
perl bin/runHapmix.pl hprun_gen2940_chr9.par
perl bin/runHapmix.pl hprun_gen2940_chr10.par
perl bin/runHapmix.pl hprun_gen2950_chr1.par
perl bin/runHapmix.pl hprun_gen2950_chr2.par
perl bin/runHapmix.pl hprun_gen2950_chr3.par
perl bin/runHapmix.pl hprun_gen2950_chr4.par
perl bin/runHapmix.pl hprun_gen2950_chr5.par
perl bin/runHapmix.pl hprun_gen2950_chr6.par
perl bin/runHapmix.pl hprun_gen2950_chr7.par
perl bin/runHapmix.pl hprun_gen2950_chr8.par
perl bin/runHapmix.pl hprun_gen2950_chr9.par
perl bin/runHapmix.pl hprun_gen2950_chr10.par
perl bin/runHapmix.pl hprun_gen2960_chr1.par
perl bin/runHapmix.pl hprun_gen2960_chr2.par
perl bin/runHapmix.pl hprun_gen2960_chr3.par
perl bin/runHapmix.pl hprun_gen2960_chr4.par
perl bin/runHapmix.pl hprun_gen2960_chr5.par
perl bin/runHapmix.pl hprun_gen2960_chr6.par
perl bin/runHapmix.pl hprun_gen2960_chr7.par
perl bin/runHapmix.pl hprun_gen2960_chr8.par
perl bin/runHapmix.pl hprun_gen2960_chr9.par
perl bin/runHapmix.pl hprun_gen2960_chr10.par
perl bin/runHapmix.pl hprun_gen2970_chr1.par
perl bin/runHapmix.pl hprun_gen2970_chr2.par
perl bin/runHapmix.pl hprun_gen2970_chr3.par
perl bin/runHapmix.pl hprun_gen2970_chr4.par
perl bin/runHapmix.pl hprun_gen2970_chr5.par
perl bin/runHapmix.pl hprun_gen2970_chr6.par
perl bin/runHapmix.pl hprun_gen2970_chr7.par
perl bin/runHapmix.pl hprun_gen2970_chr8.par
perl bin/runHapmix.pl hprun_gen2970_chr9.par
perl bin/runHapmix.pl hprun_gen2970_chr10.par
perl bin/runHapmix.pl hprun_gen2980_chr1.par
perl bin/runHapmix.pl hprun_gen2980_chr2.par
perl bin/runHapmix.pl hprun_gen2980_chr3.par
perl bin/runHapmix.pl hprun_gen2980_chr4.par
perl bin/runHapmix.pl hprun_gen2980_chr5.par
perl bin/runHapmix.pl hprun_gen2980_chr6.par
perl bin/runHapmix.pl hprun_gen2980_chr7.par
perl bin/runHapmix.pl hprun_gen2980_chr8.par
perl bin/runHapmix.pl hprun_gen2980_chr9.par
perl bin/runHapmix.pl hprun_gen2980_chr10.par
perl bin/runHapmix.pl hprun_gen2990_chr1.par
perl bin/runHapmix.pl hprun_gen2990_chr2.par
perl bin/runHapmix.pl hprun_gen2990_chr3.par
perl bin/runHapmix.pl hprun_gen2990_chr4.par
perl bin/runHapmix.pl hprun_gen2990_chr5.par
perl bin/runHapmix.pl hprun_gen2990_chr6.par
perl bin/runHapmix.pl hprun_gen2990_chr7.par
perl bin/runHapmix.pl hprun_gen2990_chr8.par
perl bin/runHapmix.pl hprun_gen2990_chr9.par
perl bin/runHapmix.pl hprun_gen2990_chr10.par
perl bin/runHapmix.pl hprun_gen3000_chr1.par
perl bin/runHapmix.pl hprun_gen3000_chr2.par
perl bin/runHapmix.pl hprun_gen3000_chr3.par
perl bin/runHapmix.pl hprun_gen3000_chr4.par
perl bin/runHapmix.pl hprun_gen3000_chr5.par
perl bin/runHapmix.pl hprun_gen3000_chr6.par
perl bin/runHapmix.pl hprun_gen3000_chr7.par
perl bin/runHapmix.pl hprun_gen3000_chr8.par
perl bin/runHapmix.pl hprun_gen3000_chr9.par
perl bin/runHapmix.pl hprun_gen3000_chr10.par
