### Jinliang Yang
### April 13th, 2015
### Prepare SeeD data for fpSNP

source("lib/write_hmp_group.R")

###############
## note: whichgroup="1 1" <- toton; "2 2" <- SeeDs-toton; c("1 1", "2 2") <- SeeDs all
write_hmp_group(idinfo="data/SeeD_idinfo.csv", dist_cutoff=1, whichgroup="2 2",
                outfile="largedata/SeeDs/SeeDs-toton_unimputed_mr6_ames.txt", mr=0.6)

#Read 557311 rows and 3329 (of 3329) columns from 3.470 GB file in 00:02:35
#Groups in the header:    
#   N  '1 1'    3 
#   3 4063 3324 
###>>> output header with [ 7390 ] columns
###>>> loading SeeDs for [ chr 1 ]
# Read 113082 rows and 4850 (of 4850) columns from 2.045 GB file in 00:00:48
###>>> SeeDs: Loaded [ 112975 ] SNPs, [ 72113 ] remaining for [ 4063 ] plants
###>>> Ames: Loaded [ 86408 ] SNPs, [ 50811 ] remaining for [ 3324 ] plants
###--- output [50811] snps and [ 7390 ] columns for chr [ 1 ]

write_hmp_group(idinfo="data/SeeD_idinfo.csv", dist_cutoff=1, whichgroup=c("1 1", "2 2"),
                outfile="largedata/SeeDs/SeeDsall_unimputed_mr6_ames.txt", mr=0.6)
###>>> loading ames GBSv2.7 ...
#Read 557311 rows and 3329 (of 3329) columns from 3.470 GB file in 00:02:43
#Groups in the header:   
#    N  1 1    3 
#    3 4127 3324 
###>>> output header with [ 7454 ] columns
###>>> loading SeeDs for [ chr 1 ]
#Read 113082 rows and 4850 (of 4850) columns from 2.045 GB file in 00:00:51
###>>> SeeDs: Loaded [ 112975 ] SNPs, [ 72113 ] remaining for [ 4127 ] plants
###>>> Ames: Loaded [ 86408 ] SNPs, [ 50811 ] remaining for [ 3324 ] plants
###--- output [50811] snps and [ 7454 ] columns for chr [ 1 ]