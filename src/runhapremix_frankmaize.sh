#$ -S /bin/bash
#$ -cwd
#$ -N hapmix
#$ -e /home/mhufford/errors
#$ -o /home/mhufford/outs
#$ -t 100

taxa1=maize
taxa2=mexicana
k=$(( $SGE_TASK_ID ))

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

for chr in {1..10}; do 
cp $start/"$taxa1"_dipfrankgeno.$chr $work/"$taxa1"_dipfrankgeno.$k.$chr
cp $start/SNP.$chr $work/SNP.$k.$chr
cp $start/"$taxa2"_hap.$chr $work/"$taxa2"_hap.$k.$chr
cp $start/"$taxa1"_hap.$chr $work/"$taxa1"_hap.$k.$chr
cp $start/"$taxa2"_snpfile.$chr $work/"$taxa2"_snpfile.$k.$chr
cp $start/"$taxa1"_snpfile.$chr $work/"$taxa1"_snpfile.$k.$chr
cp $start/prelimrates.$chr $work/prelimrates.$k.$chr
cp $start/bin/* $work/bin/
echo "GENOTYPE:1
OUTPUT_SITES:1
SITE_POSITIONS: 1 1000000000
THETA:0.1
LAMBDA:$k
RECOMBINATION_VALS:900 900
MUTATION_VALS:0.2 0.2 0.01
MISCOPYING_VALS:0.05 0.05
REFPOP1GENOFILE:$work/"$taxa2"_hap.$k.$chr
REFPOP2GENOFILE:$work/"$taxa1"_hap.$k.$chr
REFPOP1SNPFILE:$work/"$taxa2"_snpfile.$k.$chr
REFPOP2SNPFILE:$work/"$taxa1"_snpfile.$k.$chr
ADMIXSNPFILE:$work/SNP.$k.$chr
ADMIXGENOFILE:$work/"$taxa1"_dipfrankgeno.$k.$chr
ADMIXINDFILE:0.$k.$chr
REF1LABEL:$taxa2
REF2LABEL:$taxa1
RATESFILE:$work/prelimrates.$k.$chr
ADMIXPOP:Amz.$k
CHR:$chr
OUTDIR:$start/$taxa1.$taxa2.$chr.$k.frankout
HAPMIX_MODE:LOCAL_ANC
OUTPUT_DETAILS:PROB
THRESHOLD:0.0
KEEPINTFILES:0
" >> $work/$taxa1.$taxa2.$chr.$k.frankparameters;

mkdir $start/$taxa1.$taxa2.$chr.$k.frankout

perl $start/bin/runHapmix.pl $work/$taxa1.$taxa2.$chr.$k.frankparameters
done;
fi;

if [ $taxa1 = "mexicana" ]; then

for chr in {1..10}; do 
cp $start/"$taxa1"_dipgeno.$chr $work/"$taxa1"_dipgeno.$k.$chr
cp $start/SNP.$chr $work/SNP.$k.$chr
cp $start/"$taxa2"_hap.$chr $work/"$taxa2"_hap.$k.$chr
cp $start/"$taxa1"_hap.$chr $work/"$taxa1"_hap.$k.$chr
cp $start/"$taxa2"_snpfile.$chr $work/"$taxa2"_snpfile.$k.$chr
cp $start/"$taxa1"_snpfile.$chr $work/"$taxa1"_snpfile.$k.$chr
cp $start/prelimrates.$chr $work/prelimrates.$k.$chr
cp $start/bin/* $work/bin/
echo "GENOTYPE:1
OUTPUT_SITES:1
SITE_POSITIONS: 1 1000000000
THETA:0.2
LAMBDA:$k
RECOMBINATION_VALS:900 900
MUTATION_VALS:0.2 0.2 0.01
MISCOPYING_VALS:0.05 0.05
REFPOP1GENOFILE:$work/"$taxa2"_hap.$k.$chr
REFPOP2GENOFILE:$work/"$taxa1"_hap.$k.$chr
REFPOP1SNPFILE:$work/"$taxa2"_snpfile.$k.$chr
REFPOP2SNPFILE:$work/"$taxa1"_snpfile.$k.$chr
ADMIXSNPFILE:$work/SNP.$k.$chr
ADMIXGENOFILE:$work/"$taxa1"_dipgeno.$k.$chr
ADMIXINDFILE:0.$k.$chr
REF1LABEL:$taxa2
REF2LABEL:$taxa1
RATESFILE:$work/prelimrates.$k.$chr
ADMIXPOP:Amx.$k
CHR:$chr
OUTDIR:$start/$taxa1.$taxa2.$chr.$k.out
HAPMIX_MODE:LOCAL_ANC
OUTPUT_DETAILS:PROB
THRESHOLD:0.0
KEEPINTFILES:0
" >> $work/$taxa1.$taxa2.$chr.$k.parameters;

mkdir $start/$taxa1.$taxa2.$chr.$k.out

perl $start/bin/runHapmix.pl $work/$taxa1.$taxa2.$chr.$k.parameters
done;
fi;
