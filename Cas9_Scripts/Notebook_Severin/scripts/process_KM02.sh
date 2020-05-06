#!/bin/bash
module load jellyfish
module load bioawk
module load parallel
export PATH=$PATH:/work/gif/severin/isugif/software/datamash-1.3/bin/

mkdir /scratch/severin

string="GGAAATTAGGTGCGCTTGGC"
file=$1

# extract the sequence
sed -n '2~4'p ${file} |\
sed 's/.*TTGCTGTACGAATCGTACAGGGTGCTTCAGGAT\(.\{20\}\)GGGGGTTGGTCAAGCTCGGA.*/\1/g' |\
awk 'length($1)<21' |\
sed -e 's/\(.\)/\1\t/g' > ${file%.*}_extracted_cas.txt
reads=$(sed -n '2~4'p ${file}  |wc -l)
extracted=$(cat ${file%.*}_extracted_cas.txt |wc -l)

# print summary
echo "total reads in $file is $reads, extracted $extracted" >> reads_extracted.txt

# generate positional frequency matrix
# requires datamash
header=$(echo $string | sed -e 's/\(.\)/\1\t/g')
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
sed 's/\t//g' ${file%.*}_extracted_cas.txt |\
awk -v x=${string} '{print x"\t"$0}' > ${file%.*}_mmfile.txt
/home/severin/isugif/common_scripts/mismatch-counter.sh ${file%.*}_mmfile.txt > ${file%.*}_mm-stats.txt
cut -f 2 ${file%.*}_mm-stats.txt |\
sort -k1,1 -rn |\
uniq -c |\
awk '{print $2"\t"$1}' |\
sort -k1,1 -n > ${file%.*}_mismatches_summary.txt

#sed 's/\t//g' ${file%.*}_extracted_cas.txt | awk '{print ">"NR"\n"$1}' > ${file%.*}_extracted_cas.fa
#jellyfish count -m 20 -s 100M -t 12 -C  ${file%.*}_extracted_cas.fa -o  ${file%.*}_extracted_cas.jf
#jellyfish dump  ${file%.*}_extracted_cas.jf > ${file%.*}_counts_dumps.fa
#bioawk -c fastx '{print $seq"\t"$name}' ${file%.*}_counts_dumps.fa | sort --parallel 10 -k2,2 -rn > ${file%.*}_freq.txt
#rm  ${file%.*}_extracted_cas.txt ${file%.*}_mmfile.txt ${file%.*}_extracted_cas.jf ${file%.*}_counts_dumps.fa

sed 's/\t//g' ${file%.*}_extracted_cas.txt | sort --parallel 10 | uniq -c | awk '{print $2"\t"$1}' > ${file%.*}_freq.txt
rm  ${file%.*}_extracted_cas.txt ${file%.*}_mmfile.txt
