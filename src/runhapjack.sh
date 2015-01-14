#$ -S /bin/bash
#$ -cwd
#$ -N hapmix
#$ -e /home/mhufford/errors
#$ -o /home/mhufford/outs
#$ -t 100

taxa1=maize
taxa2=mex
k=$(( $SGE_TASK_ID ))
chr=10

mkdir /scratch/mhufford/$JOB_ID/
mkdir /scratch/mhufford/$JOB_ID/$k/
mkdir /scratch/mhufford/$JOB_ID/$k/bin

work=/scratch/mhufford/$JOB_ID/$k
start=$( pwd )

cd $work



#number=$RANDOM*$k
#let "number %= 30"
#sleep $number

if [ $taxa1 = "maize" ]; then

for ind in {1..27}; do 
cp $start/sum_ind"$ind"_chr"$chr"_"$taxa1"hap_tab.txt $work/"$taxa1"_dipjackgeno.$k.$chr.$ind
cp $start/SNP.$chr $work/SNP.$k.$chr.$ind
cp $start/"$taxa2"icana_hap.$chr $work/"$taxa2"icana_hap.$k.$chr
cp $start/notab_ref"$ind"_chr"$chr"_"$taxa1"hap_tab.txt $work/"$taxa1"_hap.$k.$chr.$ind
cp $start/"$taxa2"icana_snpfile.$chr $work/"$taxa2"icana_snpfile.$k.$chr
cp $start/"$taxa1"_snpfile.$chr $work/"$taxa1"_snpfile.$k.$chr.$ind
cp $start/prelimrates.$chr $work/prelimrates.$k.$chr.$ind
cp $start/bin/* $work/bin/
cp $start/Amz.ind $work/Amz.ind
echo "GENOTYPE:1
OUTPUT_SITES:1
SITE_POSITIONS: 1 1000000000
THETA:0.2
LAMBDA:$k
RECOMBINATION_VALS:900 900
MUTATION_VALS:0.2 0.2 0.01
MISCOPYING_VALS:0.05 0.05
REFPOP1GENOFILE:$work/"$taxa2"icana_hap.$k.$chr
REFPOP2GENOFILE:$work/"$taxa1"_hap.$k.$chr.$ind
REFPOP1SNPFILE:$work/"$taxa2"icana_snpfile.$k.$chr
REFPOP2SNPFILE:$work/"$taxa1"_snpfile.$k.$chr.$ind
ADMIXSNPFILE:$work/SNP.$k.$chr.$ind
ADMIXGENOFILE:$work/"$taxa1"_dipjackgeno.$k.$chr.$ind
ADMIXINDFILE:Amz.ind
REF1LABEL:"$taxa2"icana
REF2LABEL:$taxa1
RATESFILE:$work/prelimrates.$k.$chr.$ind
ADMIXPOP:Amz.$k.$ind
CHR:$chr
OUTDIR:$start/$taxa1.$taxa2.$chr.$k.$ind.jackout
HAPMIX_MODE:LOCAL_ANC
OUTPUT_DETAILS:PROB
THRESHOLD:0.0
KEEPINTFILES:0
" >> $work/$taxa1.$taxa2.$chr.$k.$ind.jackparameters;

mkdir $start/$taxa1.$taxa2.$chr.$k.$ind.jackout

perl $start/bin/runHapmix.pl $work/$taxa1.$taxa2.$chr.$k.$ind.jackparameters
done;
fi;
