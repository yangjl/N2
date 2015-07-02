#!/bin/bash
#SBATCH -D /home/jolyang/Documents/Github/N2
#SBATCH -o /home/jolyang/Documents/Github/N2/slurm-log/testout-%j.txt
#SBATCH -e /home/jolyang/Documents/Github/N2/slurm-log/err-%j.txt
#SBATCH -J run_hapmix2.sh
#SBATCH--mail-user=yangjl0930@gmail.com
#SBATCH--mail-type=END
#SBATCH--mail-type=FAIL #email if fails
set -e
set -u

cd largedata/hapmixrun2
perl bin/runHapmix.pl hprun_gen510_chr1.par
perl bin/runHapmix.pl hprun_gen510_chr2.par
perl bin/runHapmix.pl hprun_gen510_chr3.par
perl bin/runHapmix.pl hprun_gen510_chr4.par
perl bin/runHapmix.pl hprun_gen510_chr5.par
perl bin/runHapmix.pl hprun_gen510_chr6.par
perl bin/runHapmix.pl hprun_gen510_chr7.par
perl bin/runHapmix.pl hprun_gen510_chr8.par
perl bin/runHapmix.pl hprun_gen510_chr9.par
perl bin/runHapmix.pl hprun_gen510_chr10.par
perl bin/runHapmix.pl hprun_gen520_chr1.par
perl bin/runHapmix.pl hprun_gen520_chr2.par
perl bin/runHapmix.pl hprun_gen520_chr3.par
perl bin/runHapmix.pl hprun_gen520_chr4.par
perl bin/runHapmix.pl hprun_gen520_chr5.par
perl bin/runHapmix.pl hprun_gen520_chr6.par
perl bin/runHapmix.pl hprun_gen520_chr7.par
perl bin/runHapmix.pl hprun_gen520_chr8.par
perl bin/runHapmix.pl hprun_gen520_chr9.par
perl bin/runHapmix.pl hprun_gen520_chr10.par
perl bin/runHapmix.pl hprun_gen530_chr1.par
perl bin/runHapmix.pl hprun_gen530_chr2.par
perl bin/runHapmix.pl hprun_gen530_chr3.par
perl bin/runHapmix.pl hprun_gen530_chr4.par
perl bin/runHapmix.pl hprun_gen530_chr5.par
perl bin/runHapmix.pl hprun_gen530_chr6.par
perl bin/runHapmix.pl hprun_gen530_chr7.par
perl bin/runHapmix.pl hprun_gen530_chr8.par
perl bin/runHapmix.pl hprun_gen530_chr9.par
perl bin/runHapmix.pl hprun_gen530_chr10.par
perl bin/runHapmix.pl hprun_gen540_chr1.par
perl bin/runHapmix.pl hprun_gen540_chr2.par
perl bin/runHapmix.pl hprun_gen540_chr3.par
perl bin/runHapmix.pl hprun_gen540_chr4.par
perl bin/runHapmix.pl hprun_gen540_chr5.par
perl bin/runHapmix.pl hprun_gen540_chr6.par
perl bin/runHapmix.pl hprun_gen540_chr7.par
perl bin/runHapmix.pl hprun_gen540_chr8.par
perl bin/runHapmix.pl hprun_gen540_chr9.par
perl bin/runHapmix.pl hprun_gen540_chr10.par
perl bin/runHapmix.pl hprun_gen550_chr1.par
perl bin/runHapmix.pl hprun_gen550_chr2.par
perl bin/runHapmix.pl hprun_gen550_chr3.par
perl bin/runHapmix.pl hprun_gen550_chr4.par
perl bin/runHapmix.pl hprun_gen550_chr5.par
perl bin/runHapmix.pl hprun_gen550_chr6.par
perl bin/runHapmix.pl hprun_gen550_chr7.par
perl bin/runHapmix.pl hprun_gen550_chr8.par
perl bin/runHapmix.pl hprun_gen550_chr9.par
perl bin/runHapmix.pl hprun_gen550_chr10.par
perl bin/runHapmix.pl hprun_gen560_chr1.par
perl bin/runHapmix.pl hprun_gen560_chr2.par
perl bin/runHapmix.pl hprun_gen560_chr3.par
perl bin/runHapmix.pl hprun_gen560_chr4.par
perl bin/runHapmix.pl hprun_gen560_chr5.par
perl bin/runHapmix.pl hprun_gen560_chr6.par
perl bin/runHapmix.pl hprun_gen560_chr7.par
perl bin/runHapmix.pl hprun_gen560_chr8.par
perl bin/runHapmix.pl hprun_gen560_chr9.par
perl bin/runHapmix.pl hprun_gen560_chr10.par
perl bin/runHapmix.pl hprun_gen570_chr1.par
perl bin/runHapmix.pl hprun_gen570_chr2.par
perl bin/runHapmix.pl hprun_gen570_chr3.par
perl bin/runHapmix.pl hprun_gen570_chr4.par
perl bin/runHapmix.pl hprun_gen570_chr5.par
perl bin/runHapmix.pl hprun_gen570_chr6.par
perl bin/runHapmix.pl hprun_gen570_chr7.par
perl bin/runHapmix.pl hprun_gen570_chr8.par
perl bin/runHapmix.pl hprun_gen570_chr9.par
perl bin/runHapmix.pl hprun_gen570_chr10.par
perl bin/runHapmix.pl hprun_gen580_chr1.par
perl bin/runHapmix.pl hprun_gen580_chr2.par
perl bin/runHapmix.pl hprun_gen580_chr3.par
perl bin/runHapmix.pl hprun_gen580_chr4.par
perl bin/runHapmix.pl hprun_gen580_chr5.par
perl bin/runHapmix.pl hprun_gen580_chr6.par
perl bin/runHapmix.pl hprun_gen580_chr7.par
perl bin/runHapmix.pl hprun_gen580_chr8.par
perl bin/runHapmix.pl hprun_gen580_chr9.par
perl bin/runHapmix.pl hprun_gen580_chr10.par
perl bin/runHapmix.pl hprun_gen590_chr1.par
perl bin/runHapmix.pl hprun_gen590_chr2.par
perl bin/runHapmix.pl hprun_gen590_chr3.par
perl bin/runHapmix.pl hprun_gen590_chr4.par
perl bin/runHapmix.pl hprun_gen590_chr5.par
perl bin/runHapmix.pl hprun_gen590_chr6.par
perl bin/runHapmix.pl hprun_gen590_chr7.par
perl bin/runHapmix.pl hprun_gen590_chr8.par
perl bin/runHapmix.pl hprun_gen590_chr9.par
perl bin/runHapmix.pl hprun_gen590_chr10.par
perl bin/runHapmix.pl hprun_gen600_chr1.par
perl bin/runHapmix.pl hprun_gen600_chr2.par
perl bin/runHapmix.pl hprun_gen600_chr3.par
perl bin/runHapmix.pl hprun_gen600_chr4.par
perl bin/runHapmix.pl hprun_gen600_chr5.par
perl bin/runHapmix.pl hprun_gen600_chr6.par
perl bin/runHapmix.pl hprun_gen600_chr7.par
perl bin/runHapmix.pl hprun_gen600_chr8.par
perl bin/runHapmix.pl hprun_gen600_chr9.par
perl bin/runHapmix.pl hprun_gen600_chr10.par
perl bin/runHapmix.pl hprun_gen610_chr1.par
perl bin/runHapmix.pl hprun_gen610_chr2.par
perl bin/runHapmix.pl hprun_gen610_chr3.par
perl bin/runHapmix.pl hprun_gen610_chr4.par
perl bin/runHapmix.pl hprun_gen610_chr5.par
perl bin/runHapmix.pl hprun_gen610_chr6.par
perl bin/runHapmix.pl hprun_gen610_chr7.par
perl bin/runHapmix.pl hprun_gen610_chr8.par
perl bin/runHapmix.pl hprun_gen610_chr9.par
perl bin/runHapmix.pl hprun_gen610_chr10.par
perl bin/runHapmix.pl hprun_gen620_chr1.par
perl bin/runHapmix.pl hprun_gen620_chr2.par
perl bin/runHapmix.pl hprun_gen620_chr3.par
perl bin/runHapmix.pl hprun_gen620_chr4.par
perl bin/runHapmix.pl hprun_gen620_chr5.par
perl bin/runHapmix.pl hprun_gen620_chr6.par
perl bin/runHapmix.pl hprun_gen620_chr7.par
perl bin/runHapmix.pl hprun_gen620_chr8.par
perl bin/runHapmix.pl hprun_gen620_chr9.par
perl bin/runHapmix.pl hprun_gen620_chr10.par
perl bin/runHapmix.pl hprun_gen630_chr1.par
perl bin/runHapmix.pl hprun_gen630_chr2.par
perl bin/runHapmix.pl hprun_gen630_chr3.par
perl bin/runHapmix.pl hprun_gen630_chr4.par
perl bin/runHapmix.pl hprun_gen630_chr5.par
perl bin/runHapmix.pl hprun_gen630_chr6.par
perl bin/runHapmix.pl hprun_gen630_chr7.par
perl bin/runHapmix.pl hprun_gen630_chr8.par
perl bin/runHapmix.pl hprun_gen630_chr9.par
perl bin/runHapmix.pl hprun_gen630_chr10.par
perl bin/runHapmix.pl hprun_gen640_chr1.par
perl bin/runHapmix.pl hprun_gen640_chr2.par
perl bin/runHapmix.pl hprun_gen640_chr3.par
perl bin/runHapmix.pl hprun_gen640_chr4.par
perl bin/runHapmix.pl hprun_gen640_chr5.par
perl bin/runHapmix.pl hprun_gen640_chr6.par
perl bin/runHapmix.pl hprun_gen640_chr7.par
perl bin/runHapmix.pl hprun_gen640_chr8.par
perl bin/runHapmix.pl hprun_gen640_chr9.par
perl bin/runHapmix.pl hprun_gen640_chr10.par
perl bin/runHapmix.pl hprun_gen650_chr1.par
perl bin/runHapmix.pl hprun_gen650_chr2.par
perl bin/runHapmix.pl hprun_gen650_chr3.par
perl bin/runHapmix.pl hprun_gen650_chr4.par
perl bin/runHapmix.pl hprun_gen650_chr5.par
perl bin/runHapmix.pl hprun_gen650_chr6.par
perl bin/runHapmix.pl hprun_gen650_chr7.par
perl bin/runHapmix.pl hprun_gen650_chr8.par
perl bin/runHapmix.pl hprun_gen650_chr9.par
perl bin/runHapmix.pl hprun_gen650_chr10.par
perl bin/runHapmix.pl hprun_gen660_chr1.par
perl bin/runHapmix.pl hprun_gen660_chr2.par
perl bin/runHapmix.pl hprun_gen660_chr3.par
perl bin/runHapmix.pl hprun_gen660_chr4.par
perl bin/runHapmix.pl hprun_gen660_chr5.par
perl bin/runHapmix.pl hprun_gen660_chr6.par
perl bin/runHapmix.pl hprun_gen660_chr7.par
perl bin/runHapmix.pl hprun_gen660_chr8.par
perl bin/runHapmix.pl hprun_gen660_chr9.par
perl bin/runHapmix.pl hprun_gen660_chr10.par
perl bin/runHapmix.pl hprun_gen670_chr1.par
perl bin/runHapmix.pl hprun_gen670_chr2.par
perl bin/runHapmix.pl hprun_gen670_chr3.par
perl bin/runHapmix.pl hprun_gen670_chr4.par
perl bin/runHapmix.pl hprun_gen670_chr5.par
perl bin/runHapmix.pl hprun_gen670_chr6.par
perl bin/runHapmix.pl hprun_gen670_chr7.par
perl bin/runHapmix.pl hprun_gen670_chr8.par
perl bin/runHapmix.pl hprun_gen670_chr9.par
perl bin/runHapmix.pl hprun_gen670_chr10.par
perl bin/runHapmix.pl hprun_gen680_chr1.par
perl bin/runHapmix.pl hprun_gen680_chr2.par
perl bin/runHapmix.pl hprun_gen680_chr3.par
perl bin/runHapmix.pl hprun_gen680_chr4.par
perl bin/runHapmix.pl hprun_gen680_chr5.par
perl bin/runHapmix.pl hprun_gen680_chr6.par
perl bin/runHapmix.pl hprun_gen680_chr7.par
perl bin/runHapmix.pl hprun_gen680_chr8.par
perl bin/runHapmix.pl hprun_gen680_chr9.par
perl bin/runHapmix.pl hprun_gen680_chr10.par
perl bin/runHapmix.pl hprun_gen690_chr1.par
perl bin/runHapmix.pl hprun_gen690_chr2.par
perl bin/runHapmix.pl hprun_gen690_chr3.par
perl bin/runHapmix.pl hprun_gen690_chr4.par
perl bin/runHapmix.pl hprun_gen690_chr5.par
perl bin/runHapmix.pl hprun_gen690_chr6.par
perl bin/runHapmix.pl hprun_gen690_chr7.par
perl bin/runHapmix.pl hprun_gen690_chr8.par
perl bin/runHapmix.pl hprun_gen690_chr9.par
perl bin/runHapmix.pl hprun_gen690_chr10.par
perl bin/runHapmix.pl hprun_gen700_chr1.par
perl bin/runHapmix.pl hprun_gen700_chr2.par
perl bin/runHapmix.pl hprun_gen700_chr3.par
perl bin/runHapmix.pl hprun_gen700_chr4.par
perl bin/runHapmix.pl hprun_gen700_chr5.par
perl bin/runHapmix.pl hprun_gen700_chr6.par
perl bin/runHapmix.pl hprun_gen700_chr7.par
perl bin/runHapmix.pl hprun_gen700_chr8.par
perl bin/runHapmix.pl hprun_gen700_chr9.par
perl bin/runHapmix.pl hprun_gen700_chr10.par
perl bin/runHapmix.pl hprun_gen710_chr1.par
perl bin/runHapmix.pl hprun_gen710_chr2.par
perl bin/runHapmix.pl hprun_gen710_chr3.par
perl bin/runHapmix.pl hprun_gen710_chr4.par
perl bin/runHapmix.pl hprun_gen710_chr5.par
perl bin/runHapmix.pl hprun_gen710_chr6.par
perl bin/runHapmix.pl hprun_gen710_chr7.par
perl bin/runHapmix.pl hprun_gen710_chr8.par
perl bin/runHapmix.pl hprun_gen710_chr9.par
perl bin/runHapmix.pl hprun_gen710_chr10.par
perl bin/runHapmix.pl hprun_gen720_chr1.par
perl bin/runHapmix.pl hprun_gen720_chr2.par
perl bin/runHapmix.pl hprun_gen720_chr3.par
perl bin/runHapmix.pl hprun_gen720_chr4.par
perl bin/runHapmix.pl hprun_gen720_chr5.par
perl bin/runHapmix.pl hprun_gen720_chr6.par
perl bin/runHapmix.pl hprun_gen720_chr7.par
perl bin/runHapmix.pl hprun_gen720_chr8.par
perl bin/runHapmix.pl hprun_gen720_chr9.par
perl bin/runHapmix.pl hprun_gen720_chr10.par
perl bin/runHapmix.pl hprun_gen730_chr1.par
perl bin/runHapmix.pl hprun_gen730_chr2.par
perl bin/runHapmix.pl hprun_gen730_chr3.par
perl bin/runHapmix.pl hprun_gen730_chr4.par
perl bin/runHapmix.pl hprun_gen730_chr5.par
perl bin/runHapmix.pl hprun_gen730_chr6.par
perl bin/runHapmix.pl hprun_gen730_chr7.par
perl bin/runHapmix.pl hprun_gen730_chr8.par
perl bin/runHapmix.pl hprun_gen730_chr9.par
perl bin/runHapmix.pl hprun_gen730_chr10.par
perl bin/runHapmix.pl hprun_gen740_chr1.par
perl bin/runHapmix.pl hprun_gen740_chr2.par
perl bin/runHapmix.pl hprun_gen740_chr3.par
perl bin/runHapmix.pl hprun_gen740_chr4.par
perl bin/runHapmix.pl hprun_gen740_chr5.par
perl bin/runHapmix.pl hprun_gen740_chr6.par
perl bin/runHapmix.pl hprun_gen740_chr7.par
perl bin/runHapmix.pl hprun_gen740_chr8.par
perl bin/runHapmix.pl hprun_gen740_chr9.par
perl bin/runHapmix.pl hprun_gen740_chr10.par
perl bin/runHapmix.pl hprun_gen750_chr1.par
perl bin/runHapmix.pl hprun_gen750_chr2.par
perl bin/runHapmix.pl hprun_gen750_chr3.par
perl bin/runHapmix.pl hprun_gen750_chr4.par
perl bin/runHapmix.pl hprun_gen750_chr5.par
perl bin/runHapmix.pl hprun_gen750_chr6.par
perl bin/runHapmix.pl hprun_gen750_chr7.par
perl bin/runHapmix.pl hprun_gen750_chr8.par
perl bin/runHapmix.pl hprun_gen750_chr9.par
perl bin/runHapmix.pl hprun_gen750_chr10.par
perl bin/runHapmix.pl hprun_gen760_chr1.par
perl bin/runHapmix.pl hprun_gen760_chr2.par
perl bin/runHapmix.pl hprun_gen760_chr3.par
perl bin/runHapmix.pl hprun_gen760_chr4.par
perl bin/runHapmix.pl hprun_gen760_chr5.par
perl bin/runHapmix.pl hprun_gen760_chr6.par
perl bin/runHapmix.pl hprun_gen760_chr7.par
perl bin/runHapmix.pl hprun_gen760_chr8.par
perl bin/runHapmix.pl hprun_gen760_chr9.par
perl bin/runHapmix.pl hprun_gen760_chr10.par
perl bin/runHapmix.pl hprun_gen770_chr1.par
perl bin/runHapmix.pl hprun_gen770_chr2.par
perl bin/runHapmix.pl hprun_gen770_chr3.par
perl bin/runHapmix.pl hprun_gen770_chr4.par
perl bin/runHapmix.pl hprun_gen770_chr5.par
perl bin/runHapmix.pl hprun_gen770_chr6.par
perl bin/runHapmix.pl hprun_gen770_chr7.par
perl bin/runHapmix.pl hprun_gen770_chr8.par
perl bin/runHapmix.pl hprun_gen770_chr9.par
perl bin/runHapmix.pl hprun_gen770_chr10.par
perl bin/runHapmix.pl hprun_gen780_chr1.par
perl bin/runHapmix.pl hprun_gen780_chr2.par
perl bin/runHapmix.pl hprun_gen780_chr3.par
perl bin/runHapmix.pl hprun_gen780_chr4.par
perl bin/runHapmix.pl hprun_gen780_chr5.par
perl bin/runHapmix.pl hprun_gen780_chr6.par
perl bin/runHapmix.pl hprun_gen780_chr7.par
perl bin/runHapmix.pl hprun_gen780_chr8.par
perl bin/runHapmix.pl hprun_gen780_chr9.par
perl bin/runHapmix.pl hprun_gen780_chr10.par
perl bin/runHapmix.pl hprun_gen790_chr1.par
perl bin/runHapmix.pl hprun_gen790_chr2.par
perl bin/runHapmix.pl hprun_gen790_chr3.par
perl bin/runHapmix.pl hprun_gen790_chr4.par
perl bin/runHapmix.pl hprun_gen790_chr5.par
perl bin/runHapmix.pl hprun_gen790_chr6.par
perl bin/runHapmix.pl hprun_gen790_chr7.par
perl bin/runHapmix.pl hprun_gen790_chr8.par
perl bin/runHapmix.pl hprun_gen790_chr9.par
perl bin/runHapmix.pl hprun_gen790_chr10.par
perl bin/runHapmix.pl hprun_gen800_chr1.par
perl bin/runHapmix.pl hprun_gen800_chr2.par
perl bin/runHapmix.pl hprun_gen800_chr3.par
perl bin/runHapmix.pl hprun_gen800_chr4.par
perl bin/runHapmix.pl hprun_gen800_chr5.par
perl bin/runHapmix.pl hprun_gen800_chr6.par
perl bin/runHapmix.pl hprun_gen800_chr7.par
perl bin/runHapmix.pl hprun_gen800_chr8.par
perl bin/runHapmix.pl hprun_gen800_chr9.par
perl bin/runHapmix.pl hprun_gen800_chr10.par
perl bin/runHapmix.pl hprun_gen810_chr1.par
perl bin/runHapmix.pl hprun_gen810_chr2.par
perl bin/runHapmix.pl hprun_gen810_chr3.par
perl bin/runHapmix.pl hprun_gen810_chr4.par
perl bin/runHapmix.pl hprun_gen810_chr5.par
perl bin/runHapmix.pl hprun_gen810_chr6.par
perl bin/runHapmix.pl hprun_gen810_chr7.par
perl bin/runHapmix.pl hprun_gen810_chr8.par
perl bin/runHapmix.pl hprun_gen810_chr9.par
perl bin/runHapmix.pl hprun_gen810_chr10.par
perl bin/runHapmix.pl hprun_gen820_chr1.par
perl bin/runHapmix.pl hprun_gen820_chr2.par
perl bin/runHapmix.pl hprun_gen820_chr3.par
perl bin/runHapmix.pl hprun_gen820_chr4.par
perl bin/runHapmix.pl hprun_gen820_chr5.par
perl bin/runHapmix.pl hprun_gen820_chr6.par
perl bin/runHapmix.pl hprun_gen820_chr7.par
perl bin/runHapmix.pl hprun_gen820_chr8.par
perl bin/runHapmix.pl hprun_gen820_chr9.par
perl bin/runHapmix.pl hprun_gen820_chr10.par
perl bin/runHapmix.pl hprun_gen830_chr1.par
perl bin/runHapmix.pl hprun_gen830_chr2.par
perl bin/runHapmix.pl hprun_gen830_chr3.par
perl bin/runHapmix.pl hprun_gen830_chr4.par
perl bin/runHapmix.pl hprun_gen830_chr5.par
perl bin/runHapmix.pl hprun_gen830_chr6.par
perl bin/runHapmix.pl hprun_gen830_chr7.par
perl bin/runHapmix.pl hprun_gen830_chr8.par
perl bin/runHapmix.pl hprun_gen830_chr9.par
perl bin/runHapmix.pl hprun_gen830_chr10.par
perl bin/runHapmix.pl hprun_gen840_chr1.par
perl bin/runHapmix.pl hprun_gen840_chr2.par
perl bin/runHapmix.pl hprun_gen840_chr3.par
perl bin/runHapmix.pl hprun_gen840_chr4.par
perl bin/runHapmix.pl hprun_gen840_chr5.par
perl bin/runHapmix.pl hprun_gen840_chr6.par
perl bin/runHapmix.pl hprun_gen840_chr7.par
perl bin/runHapmix.pl hprun_gen840_chr8.par
perl bin/runHapmix.pl hprun_gen840_chr9.par
perl bin/runHapmix.pl hprun_gen840_chr10.par
perl bin/runHapmix.pl hprun_gen850_chr1.par
perl bin/runHapmix.pl hprun_gen850_chr2.par
perl bin/runHapmix.pl hprun_gen850_chr3.par
perl bin/runHapmix.pl hprun_gen850_chr4.par
perl bin/runHapmix.pl hprun_gen850_chr5.par
perl bin/runHapmix.pl hprun_gen850_chr6.par
perl bin/runHapmix.pl hprun_gen850_chr7.par
perl bin/runHapmix.pl hprun_gen850_chr8.par
perl bin/runHapmix.pl hprun_gen850_chr9.par
perl bin/runHapmix.pl hprun_gen850_chr10.par
perl bin/runHapmix.pl hprun_gen860_chr1.par
perl bin/runHapmix.pl hprun_gen860_chr2.par
perl bin/runHapmix.pl hprun_gen860_chr3.par
perl bin/runHapmix.pl hprun_gen860_chr4.par
perl bin/runHapmix.pl hprun_gen860_chr5.par
perl bin/runHapmix.pl hprun_gen860_chr6.par
perl bin/runHapmix.pl hprun_gen860_chr7.par
perl bin/runHapmix.pl hprun_gen860_chr8.par
perl bin/runHapmix.pl hprun_gen860_chr9.par
perl bin/runHapmix.pl hprun_gen860_chr10.par
perl bin/runHapmix.pl hprun_gen870_chr1.par
perl bin/runHapmix.pl hprun_gen870_chr2.par
perl bin/runHapmix.pl hprun_gen870_chr3.par
perl bin/runHapmix.pl hprun_gen870_chr4.par
perl bin/runHapmix.pl hprun_gen870_chr5.par
perl bin/runHapmix.pl hprun_gen870_chr6.par
perl bin/runHapmix.pl hprun_gen870_chr7.par
perl bin/runHapmix.pl hprun_gen870_chr8.par
perl bin/runHapmix.pl hprun_gen870_chr9.par
perl bin/runHapmix.pl hprun_gen870_chr10.par
perl bin/runHapmix.pl hprun_gen880_chr1.par
perl bin/runHapmix.pl hprun_gen880_chr2.par
perl bin/runHapmix.pl hprun_gen880_chr3.par
perl bin/runHapmix.pl hprun_gen880_chr4.par
perl bin/runHapmix.pl hprun_gen880_chr5.par
perl bin/runHapmix.pl hprun_gen880_chr6.par
perl bin/runHapmix.pl hprun_gen880_chr7.par
perl bin/runHapmix.pl hprun_gen880_chr8.par
perl bin/runHapmix.pl hprun_gen880_chr9.par
perl bin/runHapmix.pl hprun_gen880_chr10.par
perl bin/runHapmix.pl hprun_gen890_chr1.par
perl bin/runHapmix.pl hprun_gen890_chr2.par
perl bin/runHapmix.pl hprun_gen890_chr3.par
perl bin/runHapmix.pl hprun_gen890_chr4.par
perl bin/runHapmix.pl hprun_gen890_chr5.par
perl bin/runHapmix.pl hprun_gen890_chr6.par
perl bin/runHapmix.pl hprun_gen890_chr7.par
perl bin/runHapmix.pl hprun_gen890_chr8.par
perl bin/runHapmix.pl hprun_gen890_chr9.par
perl bin/runHapmix.pl hprun_gen890_chr10.par
perl bin/runHapmix.pl hprun_gen900_chr1.par
perl bin/runHapmix.pl hprun_gen900_chr2.par
perl bin/runHapmix.pl hprun_gen900_chr3.par
perl bin/runHapmix.pl hprun_gen900_chr4.par
perl bin/runHapmix.pl hprun_gen900_chr5.par
perl bin/runHapmix.pl hprun_gen900_chr6.par
perl bin/runHapmix.pl hprun_gen900_chr7.par
perl bin/runHapmix.pl hprun_gen900_chr8.par
perl bin/runHapmix.pl hprun_gen900_chr9.par
perl bin/runHapmix.pl hprun_gen900_chr10.par
perl bin/runHapmix.pl hprun_gen910_chr1.par
perl bin/runHapmix.pl hprun_gen910_chr2.par
perl bin/runHapmix.pl hprun_gen910_chr3.par
perl bin/runHapmix.pl hprun_gen910_chr4.par
perl bin/runHapmix.pl hprun_gen910_chr5.par
perl bin/runHapmix.pl hprun_gen910_chr6.par
perl bin/runHapmix.pl hprun_gen910_chr7.par
perl bin/runHapmix.pl hprun_gen910_chr8.par
perl bin/runHapmix.pl hprun_gen910_chr9.par
perl bin/runHapmix.pl hprun_gen910_chr10.par
perl bin/runHapmix.pl hprun_gen920_chr1.par
perl bin/runHapmix.pl hprun_gen920_chr2.par
perl bin/runHapmix.pl hprun_gen920_chr3.par
perl bin/runHapmix.pl hprun_gen920_chr4.par
perl bin/runHapmix.pl hprun_gen920_chr5.par
perl bin/runHapmix.pl hprun_gen920_chr6.par
perl bin/runHapmix.pl hprun_gen920_chr7.par
perl bin/runHapmix.pl hprun_gen920_chr8.par
perl bin/runHapmix.pl hprun_gen920_chr9.par
perl bin/runHapmix.pl hprun_gen920_chr10.par
perl bin/runHapmix.pl hprun_gen930_chr1.par
perl bin/runHapmix.pl hprun_gen930_chr2.par
perl bin/runHapmix.pl hprun_gen930_chr3.par
perl bin/runHapmix.pl hprun_gen930_chr4.par
perl bin/runHapmix.pl hprun_gen930_chr5.par
perl bin/runHapmix.pl hprun_gen930_chr6.par
perl bin/runHapmix.pl hprun_gen930_chr7.par
perl bin/runHapmix.pl hprun_gen930_chr8.par
perl bin/runHapmix.pl hprun_gen930_chr9.par
perl bin/runHapmix.pl hprun_gen930_chr10.par
perl bin/runHapmix.pl hprun_gen940_chr1.par
perl bin/runHapmix.pl hprun_gen940_chr2.par
perl bin/runHapmix.pl hprun_gen940_chr3.par
perl bin/runHapmix.pl hprun_gen940_chr4.par
perl bin/runHapmix.pl hprun_gen940_chr5.par
perl bin/runHapmix.pl hprun_gen940_chr6.par
perl bin/runHapmix.pl hprun_gen940_chr7.par
perl bin/runHapmix.pl hprun_gen940_chr8.par
perl bin/runHapmix.pl hprun_gen940_chr9.par
perl bin/runHapmix.pl hprun_gen940_chr10.par
perl bin/runHapmix.pl hprun_gen950_chr1.par
perl bin/runHapmix.pl hprun_gen950_chr2.par
perl bin/runHapmix.pl hprun_gen950_chr3.par
perl bin/runHapmix.pl hprun_gen950_chr4.par
perl bin/runHapmix.pl hprun_gen950_chr5.par
perl bin/runHapmix.pl hprun_gen950_chr6.par
perl bin/runHapmix.pl hprun_gen950_chr7.par
perl bin/runHapmix.pl hprun_gen950_chr8.par
perl bin/runHapmix.pl hprun_gen950_chr9.par
perl bin/runHapmix.pl hprun_gen950_chr10.par
perl bin/runHapmix.pl hprun_gen960_chr1.par
perl bin/runHapmix.pl hprun_gen960_chr2.par
perl bin/runHapmix.pl hprun_gen960_chr3.par
perl bin/runHapmix.pl hprun_gen960_chr4.par
perl bin/runHapmix.pl hprun_gen960_chr5.par
perl bin/runHapmix.pl hprun_gen960_chr6.par
perl bin/runHapmix.pl hprun_gen960_chr7.par
perl bin/runHapmix.pl hprun_gen960_chr8.par
perl bin/runHapmix.pl hprun_gen960_chr9.par
perl bin/runHapmix.pl hprun_gen960_chr10.par
perl bin/runHapmix.pl hprun_gen970_chr1.par
perl bin/runHapmix.pl hprun_gen970_chr2.par
perl bin/runHapmix.pl hprun_gen970_chr3.par
perl bin/runHapmix.pl hprun_gen970_chr4.par
perl bin/runHapmix.pl hprun_gen970_chr5.par
perl bin/runHapmix.pl hprun_gen970_chr6.par
perl bin/runHapmix.pl hprun_gen970_chr7.par
perl bin/runHapmix.pl hprun_gen970_chr8.par
perl bin/runHapmix.pl hprun_gen970_chr9.par
perl bin/runHapmix.pl hprun_gen970_chr10.par
perl bin/runHapmix.pl hprun_gen980_chr1.par
perl bin/runHapmix.pl hprun_gen980_chr2.par
perl bin/runHapmix.pl hprun_gen980_chr3.par
perl bin/runHapmix.pl hprun_gen980_chr4.par
perl bin/runHapmix.pl hprun_gen980_chr5.par
perl bin/runHapmix.pl hprun_gen980_chr6.par
perl bin/runHapmix.pl hprun_gen980_chr7.par
perl bin/runHapmix.pl hprun_gen980_chr8.par
perl bin/runHapmix.pl hprun_gen980_chr9.par
perl bin/runHapmix.pl hprun_gen980_chr10.par
perl bin/runHapmix.pl hprun_gen990_chr1.par
perl bin/runHapmix.pl hprun_gen990_chr2.par
perl bin/runHapmix.pl hprun_gen990_chr3.par
perl bin/runHapmix.pl hprun_gen990_chr4.par
perl bin/runHapmix.pl hprun_gen990_chr5.par
perl bin/runHapmix.pl hprun_gen990_chr6.par
perl bin/runHapmix.pl hprun_gen990_chr7.par
perl bin/runHapmix.pl hprun_gen990_chr8.par
perl bin/runHapmix.pl hprun_gen990_chr9.par
perl bin/runHapmix.pl hprun_gen990_chr10.par
perl bin/runHapmix.pl hprun_gen1000_chr1.par
perl bin/runHapmix.pl hprun_gen1000_chr2.par
perl bin/runHapmix.pl hprun_gen1000_chr3.par
perl bin/runHapmix.pl hprun_gen1000_chr4.par
perl bin/runHapmix.pl hprun_gen1000_chr5.par
perl bin/runHapmix.pl hprun_gen1000_chr6.par
perl bin/runHapmix.pl hprun_gen1000_chr7.par
perl bin/runHapmix.pl hprun_gen1000_chr8.par
perl bin/runHapmix.pl hprun_gen1000_chr9.par
perl bin/runHapmix.pl hprun_gen1000_chr10.par
