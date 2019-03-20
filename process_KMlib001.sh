#!/bin/bash
module use /work/GIF/software/modules
module load vmatch
file=$1
# extract the sequence
sed -n '2~4'p ${file} |\
sed 's/^GCATTGCTGTACGAATCGTACAGGGTGCTTCAGGATGTTTT\(.\{20\}\)TGCGTCAAGCTCGGACATCGTGATTGATAATGCGATGC.*/\1/g' |\
awk 'length($1)<21' |\
sed -e 's/\(.\)/\1\t/g' > ${file%.*}_extracted_cas.txt
reads=$(sed -n '2~4'p ${file}  |wc -l)
extracted=$(cat ${file%.*}_extracted_cas.txt |wc -l)
# print summary
echo "total reads in file is $reads, extracted $extracted"
# generate positional frequency matrix
# requires datamash
module load GIF/datamash
header=$(grep -v "^>" query.fa | sed -e 's/\(.\)/\1\t/g')

echo -e "${file%.*}\t${header}" > ${file%.*}_pos-summary.txt
for i in {1..20}; do
datamash -s groupby $i count $i  < ${file%.*}_extracted_cas.txt  |\
grep -v "^N" | \
cut -f 2 |\
paste - - - - ;
done |\
datamash transpose |\
paste <(echo -e "A\nC\nG\nT") - >>  ${file%.*}_pos-summary.txt
# calculate mismatch stats
awk '{print ">"NR"\n"$0}' ${file%.*}_extracted_cas.txt |sed 's/\t//g'  > ${file%.*}_extracted_cas.fa
mkvtree -allout -pl -db ${file%.*}_extracted_cas.fa  -dna -indexname ${file%.*}_extracted_cas
vmatch -v -d -p -e 10 -showdesc 0 -complete -q query.fa ${file%.*}_extracted_cas |\
grep -v "^#" |\
tr -s " " |\
sed 's/^ //g' |\
sed 's/ /\t/g' |\
sort --parallel 12 -k2,2 -k11,11nr |\
awk '! a[$2]++' |\
cut -f 8 |\
sort -k1,1 -n |\
uniq -c |\
awk '{print $2"\t"$1}' |\
sort -k1,1 -n > ${file%.*}_mismatches_stat.txt
rm *.{lcp,llv,ois,prj,sds,skp,ssp,sti1,suf,tis,al1,bck,bwt,des}
