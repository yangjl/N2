#$ -S /bin/bash
#$ -cwd
#$ -N hapmix
#$ -e /home/mhufford/errors
#$ -o /home/mhufford/outs
#$ -t 2-20

taxa1=maize
taxa2=mexicana
k=$SGE_TASK_ID

number=$RANDOM*$SGE_TASK_ID
let "number %= 30"
sleep $number

if [ $taxa1 = "maize" ]; then

for chr in {1..10}; do 
cp "$taxa1"_dipgeno.$chr "$taxa1"_dipgeno.$SGE_TASK_ID.$chr
cp SNP.$chr SNP.$SGE_TASK_ID.$chr
cp "$taxa2"_hap.$chr "$taxa2"_hap.$SGE_TASK_ID.$chr
cp "$taxa1"_hap.$chr "$taxa1"_hap.$SGE_TASK_ID.$chr
cp "$taxa2"_snpfile.$chr "$taxa2"_snpfile.$SGE_TASK_ID.$chr
cp "$taxa1"_snpfile.$chr "$taxa1"_snpfile.$SGE_TASK_ID.$chr
cp prelimrates.$chr prelimrates.$SGE_TASK_ID.$chr
echo "GENOTYPE:1
OUTPUT_SITES:1
SITE_POSITIONS: 1 1000000000
THETA:0.1
LAMBDA:$k
RECOMBINATION_VALS:900 900
MUTATION_VALS:0.2 0.2 0.01
MISCOPYING_VALS:0.05 0.05
REFPOP1GENOFILE:"$taxa2"_hap.$SGE_TASK_ID.$chr
REFPOP2GENOFILE:"$taxa1"_hap.$SGE_TASK_ID.$chr
REFPOP1SNPFILE:"$taxa2"_snpfile.$SGE_TASK_ID.$chr
REFPOP2SNPFILE:"$taxa1"_snpfile.$SGE_TASK_ID.$chr
ADMIXSNPFILE:SNP.$SGE_TASK_ID.$chr
ADMIXGENOFILE:"$taxa1"_dipgeno.$SGE_TASK_ID.$chr
ADMIXINDFILE:0.$k.$chr
REF1LABEL:$taxa2
REF2LABEL:$taxa1
RATESFILE:prelimrates.$SGE_TASK_ID.$chr
ADMIXPOP:Amz.$SGE_TASK_ID
CHR:$chr.$k
OUTDIR:$taxa1.$taxa2.$chr.$k.out
HAPMIX_MODE:LOCAL_ANC
OUTPUT_DETAILS:PROB
THRESHOLD:0.0
KEEPINTFILES:0
" >> $taxa1.$taxa2.$chr.$k.parameters;

mkdir $taxa1.$taxa2.$chr.$k.out

perl bin/runHapmix.pl $taxa1.$taxa2.$chr.$k.parameters
done;
fi;

if [ $taxa1 = "mexicana" ]; then

for chr in {1..10}; do 
cp "$taxa1"_dipgeno.$chr "$taxa1"_dipgeno.$SGE_TASK_ID.$chr
cp SNP.$chr SNP.$SGE_TASK_ID.$chr
cp "$taxa2"_hap.$chr "$taxa2"_hap.$SGE_TASK_ID.$chr
cp "$taxa1"_hap.$chr "$taxa1"_hap.$SGE_TASK_ID.$chr
cp "$taxa2"_snpfile.$chr "$taxa2"_snpfile.$SGE_TASK_ID.$chr
cp "$taxa1"_snpfile.$chr "$taxa1"_snpfile.$SGE_TASK_ID.$chr
cp prelimrates.$chr prelimrates.$SGE_TASK_ID.$chr
echo "GENOTYPE:1
OUTPUT_SITES:1
SITE_POSITIONS: 1 1000000000
THETA:0.2
LAMBDA:$k
RECOMBINATION_VALS:900 900
MUTATION_VALS:0.2 0.2 0.01
MISCOPYING_VALS:0.05 0.05
REFPOP1GENOFILE:"$taxa2"_hap.$SGE_TASK_ID.$chr
REFPOP2GENOFILE:"$taxa1"_hap.$SGE_TASK_ID.$chr
REFPOP1SNPFILE:"$taxa2"_snpfile.$SGE_TASK_ID.$chr
REFPOP2SNPFILE:"$taxa1"_snpfile.$SGE_TASK_ID.$chr
ADMIXSNPFILE:SNP.$SGE_TASK_ID.$chr
ADMIXGENOFILE:"$taxa1"_dipgeno.$SGE_TASK_ID.$chr
ADMIXINDFILE:0.$k.$chr
REF1LABEL:$taxa2
REF2LABEL:$taxa1
RATESFILE:prelimrates.$SGE_TASK_ID.$chr
ADMIXPOP:Amx.$SGE_TASK_ID
CHR:$chr.$k
OUTDIR:$taxa1.$taxa2.$chr.$k.out
HAPMIX_MODE:LOCAL_ANC
OUTPUT_DETAILS:PROB
THRESHOLD:0.0
KEEPINTFILES:0
" >> $taxa1.$taxa2.$chr.$k.parameters;

mkdir $taxa1.$taxa2.$chr.$k.out

perl bin/runHapmix.pl $taxa1.$taxa2.$chr.$k.parameters
done;
fi;
