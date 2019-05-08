#!/bin/bash
join_files.sh  uniq-mm.txt N-KMlib002-control_freq.txt.new SC-KMlib002-control_freq.txt.new Sa-KMlib002-rep1-1_freq.txt.new Sa-KMlib002-rep1-2_freq.txt.new Sa-KMlib002-rep1-4_freq.txt.new Sa-KMlib002-rep1-6_freq.txt.new Sa-KMlib002-rep1-8_freq.txt.new Sa-KMlib002-rep1-10_freq.txt.new Sa-KMlib002-rep1-3_freq.txt.new Sa-KMlib002-rep1-5_freq.txt.new Sa-KMlib002-rep1-7_freq.txt.new Sa-KMlib002-rep1-9_freq.txt.new Sa-KMlib002-rep1-11_freq.txt.new Sp-KMlib002-rep1-1_freq.txt.new Sp-KMlib002-rep1-2_freq.txt.new Sp-KMlib002-rep1-4_freq.txt.new Sp-KMlib002-rep1-6_freq.txt.new Sp-KMlib002-rep1-8_freq.txt.new Sp-KMlib002-rep1-10_freq.txt.new Sp-KMlib002-rep1-3_freq.txt.new Sp-KMlib002-rep1-5_freq.txt.new Sp-KMlib002-rep1-7_freq.txt.new Sp-KMlib002-rep1-9_freq.txt.new Sp-KMlib002-rep1-11_freq.txt.new |sed 's/_freq.txt.new//g' |sed 's/^\tuniq-mm.txt/Kmer\tMisMatches/g' > combined_counts.txt
awk '{ for(i=3; i<=NF;i++) j+=$i; print j"\t"$0; j=0 }' combined_counts.txt | sed 's/0\tKmer/RowSum-down\tkmer/g' > rowsums_combined_counts.txt
head -n 1 rowsums_combined_counts.txt > header
awk 'NR>1' rowsums_combined_counts.txt > body
awk 'BEGIN{OFS=FS="\t"}{for(i=1;i<=NF;i++)$i=(a[i]+=$i)}END{print}' body > colsums
cat header colsums body >> final_counts.txt

awk '$3==1' body > sm-body
awk 'BEGIN{OFS=FS="\t"}{for(i=1;i<=NF;i++)$i=(a[i]+=$i)}END{print}' sm-body > sm-colsums
cat header sm-colsums sm-body >> final_counts-mismatch-one-only.txt

awk '$1>=10' body > ge10-body
awk 'BEGIN{OFS=FS="\t"}{for(i=1;i<=NF;i++)$i=(a[i]+=$i)}END{print}' ge10-body > ge10-body-colsums
cat header ge10-body-colsums ge10-body >> final_counts-total-counts-ge10.txt

# to make proportions:

cat sm-colsums sm-body |cut -f 4- > prop-sm-body
cut -f 1-3 sm-body > prop-names
awk '{ if (NR==1) { n = split($0, a, "\t"); } for (i=1; i<n; i++) { printf("%.15f\t", ($i/a[i])); } printf("%.15f\n", ($n/a[n])); }' prop-sm-body | awk 'NR>1' > prop-sm-body-calculated
cat header <(paste prop-names prop-sm-body-calculated) > final_proportions-mismatch-one-only.txt


cat ge10-body-colsums ge10-body |cut -f 4- > prop-ge10-body
cut -f 1-3 ge10-body > prop-names
awk '{ if (NR==1) { n = split($0, a, "\t"); } for (i=1; i<n; i++) { printf("%.15f\t", ($i/a[i])); } printf("%.15f\n", ($n/a[n])); }' prop-ge10-body | awk 'NR>1' > prop-ge10-body-calculated
cat header <(paste prop-names prop-ge10-body-calculated) > final_proportions-total-counts-ge10.txt

rm header *-body *-colsums prop-* body colsums

