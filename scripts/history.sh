for f in *.fq; do ../process_KM01.sh $f; done &> stdout.txt
../cleanup-process-files.sh 
less stdout.txt 
cd mismatches-table/
less N-KMlib001-control_mm-stats.txt
for f in *.fq; do ../process_KM04.sh $f; done &>stdout.txt
../cleanup-process-files.sh 
cat stdout.txt 
cd mismatches-table/
cd ../mismatches-table/
cat *_mm-stats.txt |sort |uniq > uniq-mm.txt
cat *_mm-stats.txt |sort |uniq > uniq-mm.txt
less uniq-mm.txt
wc -l uniq-mm.txt
less uniq-mm.txt 
cat *_mm-stats.txt |sort |uniq > uniq-mm.txt
awk '$2==0' uniq-mm.txt
awk '$2==1' uniq-mm.txt
awk '$2==1' uniq-mm.txt |wc -l
cd ..
cd frequency-table/
cd ../
cd frequency-table/
cd ../frequency-table/
cd -
wc -l uniq-mm.txt 
cd ../
cd frequency-table/
wc -l list-of-unique-fragments.txt
wc -l mismathces.txt
awk '$2==1' mismathces.txt |wc -l
rm mismathces.txt paired.list 
cd ../../
cd KM0
cd KM01/
for f in *.fq; do ../process_KM03.sh $f; done &>stdout.txt
cd mismatches-table/
../cleanup-process-files.sh 
cd mismatches-table/
cd ../
cd frequency-table/
cd ../KM02
cd ../../KM02/
cd frequency-table/
cat *_mm-stats.txt |sort |uniq > uniq-mm.txt
awk '$2==1' uniq-mm.txt |wc -l
cd ../
cd frequency-table/
ls
cd ../mismatches-table/
nano ../../cleanup-process-files.sh 
mv uniq-mm.txt ../frequency-table/
cd ../
cd frequency-table/
cat ../../cleanup-full-table.sh 
nano ../../cleanup-process-files.sh 
cat ../../cleanup-full-table.sh 
qsa
nano ../../process_KM0
nano ../../cleanup-process-files.sh 
nano ../../makefull.sh 
mkdir original
mv *_freq.txt ./original/
mv full* ././original/
wc -l *
head list-of-unique-fragments.txt 
nano ../../makefull.sh 
mv list-of-unique-fragments.txt ./original/
head uniq-mm.txt
 salloc -p debug  -n 16 -t 1:00:00 -N 1
../../makefull.sh 
cd frequency-table/
rm (.new
rm *.new
rm full*
rm list-of-unique-fragments.txt *temp Fn-KMlib001-rep1-7_freq.txt.constant
cd /ptmp/GIF/arnstrm/dipa/01-analysis/KM01/frequency-table
ls
cp ../mismatches-table/uniq-mm.txt ./
wc -l *
less SC-KMlib004-control_freq.txt.new
nano ../../makefull.sh 
cut -f 1 uniq-mm.txt |head
nano ../../makefull.sh 
../../makefull.sh 
../../makefull.sh 
rm *.new
cd original/
mv *_freq.txt ../
cd ..
cd original/
cd ..
rm -rf original full_freq.txt
../../makefull.sh uniq-mm.txt 
wc -l list-of-unique-fragments.txt
wc -l As_KMlib004-rep0_10_freq.txt.new
less list-of-unique-fragments.txt
head Lb-KMlib004-rep3-11_freq.txt
wc -l Lb-KMlib004-rep3-11_freq.txt
cat ../../makefull.sh 
#cut -f 1 $freq > ${freq}.temp
freq=Lb-KMlib004-rep3-9_freq.txt
cut -f 1 $freq > ${freq}.temp
grep -Fwv -f ${freq}.temp list-of-unique-fragments.txt | awk '{print $1"\t0"}' > ${freq}.constant
wc -l ${freq}.constant
wc -l ${freq}.temp
calc wc -l list-of-unique-fragments.txt 
wc -l list-of-unique-fragments.txt
head As_KMlib004-rep0_10_freq.txt.new
cut -f 1 As_KMlib004-rep0_10_freq.txt.new |sort |uniq |wc -l
less uniq-mm.txt 
wc -l uniq-mm.txt
cd ../
cd mismatches-table/
rm uniq-mm.txt 
cat *_mm-stats.txt > temp.txt
wc -l temp.txt 
sort --parallel 12 temp.txt > temp-sorted.txt
uniq temp-sorted.txt > temp-sorted-uniq.txt 
wc -l temp-sorted-uniq.txt
rm temp.txt temp-sorted.txt
cd ../
cd frequency-table/
rm *.new
rm *.temp
rm *.constant
#rm list-of-unique-fragments.txt 
wc -l list-of-unique-fragments.txt 
wc -l ../mismatches-table/temp-sorted-uniq.txt 
wc -l Lb-KMlib004-rep2-6_freq.txt
wc -l ../mismatches-table/Lb-KMlib004-rep2-6_mm-stats.txt 
cut -f ../mismatches-table/Lb-KMlib004-rep2-6_mm-stats.txt |head
cut -f 1 ../mismatches-table/Lb-KMlib004-rep2-6_mm-stats.txt |head
cut -f 1 ../mismatches-table/Lb-KMlib004-rep2-6_mm-stats.txt |sort |uniq |wc -l
less Lb-KMlib004-rep3-8_freq.txt
cat ../mismatches-table/Lb-KMlib004-rep2-6_mm-stats.txt |sort |uniq |wc -l
wc -l Lb-KMlib004-rep3-8_freq.txt
wc -l Lb-KMlib004-rep3-6_freq.txt
wc -l Lb-KMlib004-rep2-6_freq.txt
cut -f 1 Lb-KMlib004-rep2-6_freq.txt > 1
wc -l 1
head 1
head list-of-unique-fragments.txt
grep -Fwv 1 list-of-unique-fragments.txt |wc -l
wc -l list-of-unique-fragments.txt 
head 1
grep "GTTAAAAATGAGCTTTTCTA" list-of-unique-fragments.txt
grep -v "GTTAAAAATGAGCTTTTCTA" list-of-unique-fragments.txt
grep -v "GTTAAAAATGAGCTTTTCTA" list-of-unique-fragments.txt |wc -l
grep -Fwv -f 1 list-of-unique-fragments.txt |wc -l
wc -l 1
rm 1 
cut -f 1 Lb-KMlib004-rep3-8_freq.txt > Lb-KMlib004-rep3-8_freq.temp
grep -Fvw -f Lb-KMlib004-rep3-8_freq.temp list-of-unique-fragments.txt |wc -l
wc -l Lb-KMlib004-rep3-8_freq.temp
wc -l list-of-unique-fragments.txt
grep -Fvw -f Lb-KMlib004-rep3-8_freq.temp list-of-unique-fragments.txt > sub
wc -l sub Lb-KMlib004-rep3-8_freq.temp
cat sub Lb-KMlib004-rep3-8_freq.temp |sort |uniq |wc -l
less Lb-KMlib004-rep3-8_freq.temp
od -c Lb-KMlib004-rep3-8_freq.temp
od -c list-of-unique-fragments.txt 
rm sub Lb-KMlib004-rep3-8_freq.temp list-of-unique-fragments.txt
cat *_freq.txt |head
cat *_freq.txt |cut -f 1 |head
cat *_freq.txt |cut -f 1 |sort |uniq > temp
wc -l temp 
wc -l uniq-mm.txt 
grep -Fwv temp uniq-mm.txt 
head temp 
head uniq-mm.txt 
grep -Fwv temp <(cut -f 1 uniq-mm.txt) |head
grep -Fwv temp <(cut -f 1 uniq-mm.txt) |wc -l
grep -Fwv -f temp <(cut -f 1 uniq-mm.txt) |wc -l
rm temp uniq-mm.txt 
qsa
exot
exit
 salloc -p freemedium -n 12 -t 8:00:00 -N 1
exit
 salloc -p freemedium -n 12 -t 8:00:00 -N 1
rm *new
rm *.constatn
rm *.constant
rm *.temo
rm *.temp
rm full.fa full.jf list-of-unique-fragments.txt full_freq.txt
less As_KMlib001-rep0_10_freq.txt
cut -f 1 As_KMlib001-rep0_10_freq.txt |sort |uniq |wc -l
wc -l As_KMlib001-rep0_10_freq.txt
cut -f 1 ../mismatches-table/As_KMlib001-rep0_10_mm-stats.txt |sort |uniq |wc -l
ls *.txt
ls *.txt |wc -l
cd ../mismatches-table/
ls *_mm-stats.txt |wc -l
cd ../
cd frequency-table/
cat *.txt |cut -f 1 > temp
wc -l temp 
sort --parallel 12 temp > temp-sorted
uniq temp-sorted > temp-sorted-uniq
wc -l temp-sorted-uniq 
head temp-sorted-uniq
cd ../mismatches-table/
wc -l uniq-mm.txt 
cd ../frequency-table/
wc -l temp-sorted-uniq 
ls
rm temp*
cd ../../
cd KM02/
cd mismatches-table/
cat *_mm-stats.txt |cut -f 1 |sort |uniq > mm
wc -l mm
mv mm ../fre*/
cd ../frequency-table/
ls
wc -l mm uniq-mm.txt 
head Sa-KMlib002-rep1-5_freq.txt.new
cut -f 1 *_freq.txt.new |sort |uniq > fr
wc -l fr
wc -l N-KMlib002-control_freq.txt.new
cd ../
cd ../KM03/
cd mismatches-table/
rm uniq-mm.txt 
cat *_mm-stats.txt |cut -f 1 |sort |uniq > mm
wc -l mm 
cd ../
cd frequency-table/
wc -l Fn-KMlib003-rep2-10_freq.txt.new
wc -l ../mismatches-table/mm
rm *.new
less full_freq.txt
wc -l full_freq.txt
wc -l ../mismatches-table/mm
rm full.fa full.jf full_freq.txt list-of-unique-fragments.txt Lb_KMlib003-rep0_10_freq.txt.temp Lb_KMlib003-rep0_10_freq.txt.constant
head Lb_KMlib003-rep0_5_freq.txt
cat *_freq.txt > fr
rm fr
cat *_freq.txt |cut -f 1 > fr
sort --parallel 12 fr > fr-sorted
uniq fr-sorted > fr-sorted-uniq
wc -l fr-sorted-uniq
wc -l ../mismatches-table/mm
cp ../mismatches-table/mm ./
rm fr fr-sorted 
wc -l mm fr-sorted-uniq 
rep -Fvxf fr-sorted-uniq mm 
grep -Fvxf fr-sorted-uniq mm 
join -v 1 fr-sorted-uniq mm
join -v 1 fr-sorted-uniq mm |wc -l
rm fr-sorted-uniq 
rm mm 
cd ../../
less process_KM03.sh 
unset -v LESSOPEN
less process_KM03.sh 
nano process_KM03.sh
cd KM03/
../process_KM03.sh As_KMlib003-rep0_10.fq
wc -l As_KMlib003-rep0_10_freq.txt
grep -c ">" As_KMlib003-rep0_10_counts_dumps.fa
wc -l As_KMlib003-rep0_10_extracted_cas.fa
wc -l As_KMlib003-rep0_10_mm-stats.txt
sort As_KMlib003-rep0_10_mm-stats.txt |uniq |wc -l
wc -l As_KMlib003-rep0_10_extracted_cas.txt
wc -l As_KMlib003-rep0_10_freq.txt
head As_KMlib003-rep0_10_extracted_cas.txt
sed 's/\t//g' As_KMlib003-rep0_10_extracted_cas.txt |head
sed 's/\t//g' As_KMlib003-rep0_10_extracted_cas.txt |sort --parallel 10 > temp1
uniq temp1 > temp2
rm temp2 
uniq -c temp1 |awk '{print $2"\t"$1}' > temp2
less temp2 
wc -l temp2 
cd ..
nano process_KM03.sh 
cd KM0
cd KM03/
rm -rf extracted-seq position-matrix mismatches-table frequency-table As_KMlib003-rep0_10_extracted_cas.txt *.txt
rm temp* As_KMlib003-rep0_10_extracted_cas.fa As_KMlib003-rep0_10_extracted_cas.jf As_KMlib003-rep0_10_counts_dumps.fa
cd /ptmp/GIF/arnstrm/dipa/01-analysis/KM03
cat As_KMlib003-rep0_10_pos-summary.txt
less As_KMlib003-rep0_10_mmfile.txt
for f in *.fq; do ../process_KM03.sh $f; done &>stdout.txt
less stdout.txt 
ls
../cleanup-process-files.sh 
cd mismatches-table/
ls
cd ../
cd frequency-table/
ls
less uniq-mm.txt 
wc -l uniq-mm.txt 
awk '$2==1' uniq-mm.txt |wc -l
less Fn-KMlib003-rep3-7_freq.txt
cat *_freq.txt > fr
head fr 
cut -f 1 fr |sort --parallel 10 |uniq > fr-sorted-uniq
wc -l fr-sorted-uniq uniq-mm.txt 
grep -Fvxf fr-sorted-uniq uniq-mm.txt 
grep -Fvxf fr-sorted-uniq <(cut -f 1 uniq-mm.txt)
rm fr uniq-mm.txt 
rm fr-sorted-uniq 
cat ../../makefull.sh 
rmdir original/
cd ../
cd mismatches-table/
cat *_mm-stats.txt |sort --parallel 10 |uniq > uniq-mm.txt
mv uniq-mm.txt ../frequency-table/
cd ../frequency-table/
../../makefull.sh uniq-mm.txt 
ls
less Fn-KMlib003-rep3-3_freq.txt.new
cd ../
cd ../
cd KM04/
cd ../
cd KM03/
ls
rm *_extracted_cas.txt *_mmfile.txt
rm stdout.txt 
rm 0rf position-matrix extracted-seq mismatches-table frequency-table
rm -rf position-matrix extracted-seq mismatches-table frequency-table
cd ../
cd KM02/
rm -rf position-matrix extracted-seq mismatches-table frequency-table stdout.txt 
cd ../
cd KM04/
rm -rf position-matrix extracted-seq mismatches-table frequency-table stdout.txt 
cd ..
cd KM01/
rm -rf position-matrix extracted-seq mismatches-table frequency-table stdout.txt 
cd ..
nano process_KM03.sh 
nnao process_KM03.sh 
nano process_KM03.sh
cat process_KM03.sh 
nano process_KM0*sh
qsa
 salloc -p freemedium -n 12 -t 8:00:00 -N 1
cd ../
cd ../
cd /ptmp/GIF/arnstrm/dipa/01-analysis
cd /ptmp/GIF/arnstrm/dipa/01-analysis
cd /ptmp/GIF/arnstrm/dipa/01-analysis
cd KM01/
cd KM02
cd KM03
cd KM04
ls
for f in *.fq; do ../process_KM02.sh $f; done &>stdout.txt
nano ../cleanup-process-files.sh 
cat ../makefull.sh 
nano ../cleanup-process-files.sh 
../cleanup-process-files.sh 
for f in *.fq; do ../process_KM04.sh $f; done &>stdout.txt
for f in *.fq; do ../process_KM03.sh $f; done &>stdout.txt
cd frequency-table/
wc -l uniq-mm.txt 
cd ../
exit
 salloc -p freemedium -n 12 -t 8:00:00 -N 1
cd fre
cd frequency-table/
less uniq-mm.txt
awk '$2==1' uniq-mm.txt |wc -l
awk '$2==0' uniq-mm.txt |wc -l
awk '$2==3' uniq-mm.txt |wc -l
awk '$2==4' uniq-mm.txt |wc -l
awk '$2==5' uniq-mm.txt |wc -l
for f in *.fq; do ../process_KM01.sh $f; done &>stdout.txt
join_files.sh  uniq-mm.txt N-KMlib002-control_freq.txt.new SC-KMlib002-control_freq.txt.new Sa-KMlib002-rep1-1_freq.txt.new Sa-KMlib002-rep1-2_freq.txt.new Sa-KMlib002-rep1-4_freq.txt.new Sa-KMlib002-rep1-6_freq.txt.new Sa-KMlib002-rep1-8_freq.txt.new Sa-KMlib002-rep1-10_freq.txt.new Sa-KMlib002-rep1-3_freq.txt.new Sa-KMlib002-rep1-5_freq.txt.new Sa-KMlib002-rep1-7_freq.txt.new Sa-KMlib002-rep1-9_freq.txt.new Sa-KMlib002-rep1-11_freq.txt.new Sp-KMlib002-rep1-1_freq.txt.new Sp-KMlib002-rep1-2_freq.txt.new Sp-KMlib002-rep1-4_freq.txt.new Sp-KMlib002-rep1-6_freq.txt.new Sp-KMlib002-rep1-8_freq.txt.new Sp-KMlib002-rep1-10_freq.txt.new Sp-KMlib002-rep1-3_freq.txt.new Sp-KMlib002-rep1-5_freq.txt.new Sp-KMlib002-rep1-7_freq.txt.new Sp-KMlib002-rep1-9_freq.txt.new Sp-KMlib002-rep1-11_freq.txt.new |sed 's/_freq.txt.new//g' |sed 's/^\tuniq-mm.txt/Kmer\tMisMatches/g' > combined_counts.txt
less -S combined_counts.txt
awk '{ for(i=3; i<=NF;i++) j+=$i; print j"\t"$0; j=0 }' combined_counts.txt > rowsums_combined_counts.txt
less -S rowsums_combined_counts.txt
awk '{ for(i=3; i<=NF;i++) j+=$i; print j"\t"$0; j=0 }' combined_counts.txt |sed 's/0\tKmer/RowSum-down\tkmer/g' > rowsums_combined_counts.txt
less -S rowsums_combined_counts.txt
head -n 1 rowsums_combined_counts.txt > header
awk 'NR>1' rowsums_combined_counts.txt > body
head body 
ls
awk '{for(i=1;i<=NF;i++)$i=(a[i]+=$i)}END{print}' body |less -S
awk '{for(i=1;i<=NF;i++)$i=(a[i]+=$i)}END{print}' body > body-colsum.txt
less -S body-colsum.txt
cat body-colsum.txt 
awk 'BEGIN{OFS=FS="\t"}{for(i=3; i<=NF;i++) j+=$i; print j; j=0 }' body > test
less test 
wc -l test 
rm test 
../cleanup-process-files.sh 
awk 'BEGIN{OFS=FS="\t"}{for(i=1;i<=NF;i++)$i=(a[i]+=$i)}END{print}' body 
awk 'BEGIN{OFS=FS="\t"}{for(i=1;i<=NF;i++)$i=(a[i]+=$i)}END{print}' body > colsums
cat co
cat colsums 
wc -l colsums 
less -S colsums 
rm colsums 
rm body-colsum.txt 
awk 'BEGIN{OFS=FS="\t"}{for(i=1;i<=NF;i++)$i=(a[i]+=$i)}END{print}' body > colsums
nano colsums 
cat header colsums body >> final_counts.txt
less final_counts.txt 
less -S final_counts.txt 
../cleanup-process-files.sh 
awk '$3==1' body |wc -l
awk '$3==1' body |less -S
awk '$3==1' body > sm-body
awk 'BEGIN{OFS=FS="\t"}{for(i=1;i<=NF;i++)$i=(a[i]+=$i)}END{print}' sm-body > sm-colsums
cat header sm-colsums sm-body >> final_counts-mismatch-one-only.txt
less final_counts-mismatch-one-only.txt
less -S final_counts-mismatch-one-only.txt
nano final_counts-mismatch-one-only.txt
wc -l frequency-table/uniq-mm.txt 
exit
 wc -l frequency-table/uniq-mm.txt
exit
 salloc -p freemedium -n 12 -t 8:00:00 -N 1
less body 
less -S body 
awk '$1>=10' body > ge10-body
awk 'BEGIN{OFS=FS="\t"}{for(i=1;i<=NF;i++)$i=(a[i]+=$i)}END{print}' ge10-body > ge10-body-colsums
cat header ge10-body-colsums ge10-body >> final_counts-total-counts-ge10.txt
less -S final_counts-total-counts-ge10.txt 
nano final_counts-total-counts-ge10.txt
less final_counts-total-counts-ge10.txt
less -S body 
less -S final_counts-mismatch-one-only.txt
awk '$2>1' final_counts-mismatch-one-only.txt > test
awk 'NR>1 {m=$2; for(i=3;i<=NF;i++) if($3>m) m=$3; for(i=2;i<=NF;i++) $i/=m}1' test
less test 
awk 'NR>1' final_counts-mismatch-one-only.txt > test
less test 
awk 'NR>1 {m=$2; for(i=3;i<=NF;i++) if($3>m) m=$3; for(i=2;i<=NF;i++) $i/=m}1' test
awk 'NR>1 {m=$3; for(i=3;i<=NF;i++) if($3>m) m=$3; for(i=2;i<=NF;i++) $i/=m}1' test
awk '{$3/=a}1' test 
head test 
../cleanup-process-files.sh 
 wc -l frequency-table/uniq-mm.txt
exit
 salloc -p freemedium -n 12 -t 8:00:00 -N 1
awk '{if(NR%5==1)a=$1;else lt$1/=a}1' input.txt
ll
@awk 'NR==FNR{sum+= $1; next}{printf("%4.2f\n", $1/sum)}' body body 
less body 
less -S body 
awk 'NR==FNR{sum+= $4; next}{printf("%4.2f\n", $4/sum)}' body body 
awk '$3==1' body
awk '$3==1' body > temp
awk 'NR==FNR{sum+= $4; next}{printf("%4.2f\n", $4/sum)}' temp temp 
awk 'NR==FNR{sum+= $4; next}{printf("%4.4f\n", $4/sum)}' temp temp 
awk 'NR==FNR{sum+= $4; next}{printf("%4.5f\n", $4/sum)}' temp temp 
awk '{ if (NR==1) { n = split($0, a, "\t"); } for (i=1; i<n; i++) { printf("%.15f\t", ($i/a[i])); } printf("%.15f\n", ($n/a[n])); }' temp
awk '{ if (NR==1) { n = split($0, a, "\t"); } for (i=1; i<n; i++) { printf("%.15f\t", ($i/a[i])); } printf("%.15f\n", ($n/a[n])); }' temp 
awk '{ if (NR==1) { n = split($0, a, "\t"); } for (i=4; i<n; i++) { printf("%.15f\t", ($i/a[i])); } printf("%.15f\n", ($n/a[n])); }' temp 
awk '{ if (NR==1) { n = split($0, a, "\t"); } for (i=4; i<n; i++) { printf("%.15f\t", ($i/a[i])); } printf("%.15f\n", ($n/a[n])); }' temp |less -S
awk '{ if (NR==1) { n = split($0, a, "\t"); } for (i=4; i<n; i++) { printf("%.15f\t", ($i/a[i])); } printf("%.15f\n", ($n/a[n])); }' temp |wc -l
awk '{ if (NR==1) { n = split($0, a, "\t"); } for (i=4; i<n; i++) { printf("%.15f\t", ($i/a[i])); } printf("%.15f\n", ($n/a[n])); }' temp |awk '{print NF}'
head -n header 
cat header 
cut -f 1-3 body
kt
rm te
rm temp 
cat sm-colsums sm-body |cut -f 4- > prop-sm-body
cut -f 1-3 > prop-names
rm test prop-sm-body prop-names
cat sm-colsums sm-body |cut -f 4- > prop-sm-body
less -S prop-sm-body
cut -f 1-3 > prop-names
cut -f 1-3 sm-body > prop-names
awk '{ if (NR==1) { n = split($0, a, "\t"); } for (i=1; i<n; i++) { printf("%.15f\t", ($i/a[i])); } printf("%.15f\n", ($n/a[n])); }' prop-sm-body > prop-sm-body-calculated
less -S prop-sm-body-calculated
cat header <(paste prop-names prop-sm-body-calculated) > final_proportions-mismatch-one-only.txt
less -S final_proportions-mismatch-one-only.txt
awk '{ if (NR==1) { n = split($0, a, "\t"); } for (i=1; i<n; i++) { printf("%.15f\t", ($i/a[i])); } printf("%.15f\n", ($n/a[n])); }' prop-sm-body |awk 'NR>1' > prop-sm-body-calculated
cat header <(paste prop-names prop-sm-body-calculated) > final_proportions-mismatch-one-only.txt
less -S final_proportions-mismatch-one-only.txt
cat ge10-body-colsums ge10-body |cut -f 4- > prop-ge10-body
cut -f 1-3 ge10-body > prop-names
awk '{ if (NR==1) { n = split($0, a, "\t"); } for (i=1; i<n; i++) { printf("%.15f\t", ($i/a[i])); } printf("%.15f\n", ($n/a[n])); }' prop-ge10-body > prop-ge10-body-calculated
cat header <(paste prop-names prop-ge10-body-calculated) > final_proportions-total-counts-ge10.txt
less -S final_proportions-total-counts-ge10.txt
awk '{ if (NR==1) { n = split($0, a, "\t"); } for (i=1; i<n; i++) { printf("%.15f\t", ($i/a[i])); } printf("%.15f\n", ($n/a[n])); }' prop-ge10-body |awk 'NR>1' > prop-ge10-body-calculated
cat header <(paste prop-names prop-ge10-body-calculated) > final_proportions-total-counts-ge10.txt
less -S final_proportions-total-counts-ge10.txt
rm header *-body *-colsums prop-*  
less -S final_counts-mismatch-one-only.txt
less -S final_proportions-mismatch-one-only.txt
rm body colsums 
rename final- libKM002- *.txt
rename final libKM002 *.txt
rename libKM002 KMlib004 *.txt
less -S KMlib004_counts.txt 
cd ../../KM01/
less stdout.txt 
cd frequency-table/
ls
ls -1 *.new
nano final-process.sh
chmod +x final-process.sh 
./final-process.sh 
rm combined_counts.txt rowsums_combined_counts.txt header body sm-colsums sm-body final_counts* ge10-body prop-*
rm ge10-body-colsums 
nano final-process.sh 
nano colsums
nano final-process.sh 
qsa
cd /ptmp/GIF/arnstrm/dipa/01-analysis/KM01/frequency-table
cat final-process.sh 
./final-process.sh 
less -S final_counts.txt
nano final_counts.txt
head final_counts.txt
nano final_counts.txt
less -S final_counts-mismatch-one-only.txt
nano final_counts-mismatch-one-only.txt
head final_counts.txt
nano final_counts-mismatch-one-only.txt
less -S ColSum-side
less -S final_counts-mismatch-one-only.txt
nano final_counts-total-counts-ge10.txt
nano final_proportions-mismatch-one-only.txt
nano final_proportions-total-counts-ge10.txt
nano final-process.sh 
less -S combined_counts.txt 
less rowsums_combined_counts.txt 
less -S rowsums_combined_counts.txt
rm body colsums 
rm final_*
rm rowsums_combined_counts.txt 
rm combined_counts.txt 
cat final-process.sh 
./final-process.sh 
less -S final_counts.txt
sed -i 's/27014232\t0\t11423843/ColSum-side\tNA\t11423843/1' final_counts.txt
less -S final_counts.txt
less -S final_counts-mismatch-one-only.txt
grep -e "1003040\t0\t60\t13571" final_counts-mismatch-one-only.txt
grep -E "1003040\t0\t60\t13571" final_counts-mismatch-one-only.txt
grep -P "1003040\t0\t60\t13571" final_counts-mismatch-one-only.txt
sed -i 's/^1003040\t0\t60\t13571/ColSum-side\tNA\t60\t13571/g' final_counts-mismatch-one-only.txt
less -S final_counts-mismatch-one-only.txt
less -S final_proportions-mismatch-one-only.txt
less -S final_proportions-total-counts-ge10.txt
less -S final_counts-total-counts-ge10.txt
sed -i 's/23365687\t0\t2372561/ColSum-side\tNA\t2372561/g' final_counts-total-counts-ge10.txt
less -S 23365687        0       2372561
less -S final_counts-total-counts-ge10.txt
rename final_ KMlib001_ *.txt
less -S KMlib001
cd ../../
cd KM03/
cd frequency-table/
ls -1 lt
ls -1
cp ../../KM01/frequency-table/final-process.sh ./
nano final-process.sh 
./final-process.sh 
less -S final_counts.txt
head -n 2 *.txt
cd ../../KM04/
cd frequency-table/
cp ../../KM03/frequency-table/final-process.sh ./
nano final-process.sh 
ls -1 *.newfinal_counts-mismatch-one-only.txt
ls -1 *.new
nano final-process.sh 
./final-process.sh 
 salloc -p freemedium -n 12 -t 8:00:00 -N 1
less -S combined_counts.txt
less -S rowsums_combined_counts.txt
less -S KMlib001_proportions-mismatch-one-only.txt
less -S KMlib001_proportions-total-counts-ge10.txt
less -S KMlib001_counts.txt
less -S KMlib001_counts-mismatch-one-only.txt
less -S KMlib001_counts-total-counts-ge10.txt
cd ../../KM02/frequency-table/
less -S combined_counts.txt
rename KMlib004_ KMlib002_*.txt
rename KMlib004_ KMlib002_ *.txt
less -S combined_counts.txt
less -S rowsums_combined_counts.txt
less -S KMlib002_counts.txt
less -S KMlib002_counts-mismatch-one-only.txt
less -S KMlib002_proportions-mismatch-one-only.txt
less -S KMlib002_proportions-total-counts-ge10.txt
cd ../../KM03/frequency-table/
rename final_ KMlib003_ *.txt
less -S combined_counts.txt
less -S rowsums_combined_counts.txt
less -S KMlib003_counts.txt
sed -i 's/^20461478\t0/ColSum-side\tNA/g' KMlib003_counts.txt
less -S 20461478        0
less -S KMlib003_counts.txt
less -S KMlib003_counts-mismatch-one-only.txt
sed -i 's/^731080\t0/ColSum-side\tNA/g' KMlib003_counts-mismatch-one-only.txt
less -S KMlib003_counts-mismatch-one-only.txt
less -S KMlib003_proportions-mismatch-one-only.txt
less -S KMlib003_counts-total-counts-ge10.txt
sed -i 's/^19119348\t0/ColSum-side\tNA/g' KMlib003_counts-total-counts-ge10.txt
less -S KMlib003_counts-total-counts-ge10.txt
less -S KMlib003_proportions-total-counts-ge10.txt
rename counts.txt counts_KM03.txt *.txt
cd ../
cd ../KM04/frequency-table/
rename counts.txt counts_KM04.txt *.txt
rename final_ KMlib004_ *.txt
less -S KMlib004_counts_KM04.txt
sed -i 's/^13612298\t0/ColSum-side\tNA/g' KMlib004_counts_KM04.txt
less -S KMlib004_counts_KM04.txt
less -S KMlib004_counts-mismatch-one-only.txt
sed -i 's/^479558\t0/ColSum-side\tNA/g' KMlib004_counts-mismatch-one-only.txt
less -S KMlib004_counts-mismatch-one-only.txt
less -S KMlib004_proportions-mismatch-one-only.txt
less -S KMlib004_counts-total-counts-ge10.txt
sed -i 's/^12677953\t0/ColSum-side\tNA/g' KMlib004_counts-total-counts-ge10.txt
less -S KMlib004_counts-total-counts-ge10.txt
cd ../
cd ../KM01/
cd frequency-table/
rename counts.txt counts_KM01.txt *.txt
cd ../../KM02/frequency-table/
rename counts.txt counts_KM02.txt *.txt
kinit
cd /lss/research/sashital-lab/Karthik/ISUGIF/
ls KMlib004/
ll
cd KMlib004/
cd ..
mkdir old-results
mv KMlib004 ./old-results/
mkdir 20190403_results
cd 20190403_results/
mkdir KMlib001 KMlib002 KMlib003 KMlib004
cp /ptmp/GIF/arnstrm/dipa/01-analysis/KM02/frequency-table/*.txt ./KMlib002/
cp /ptmp/GIF/arnstrm/dipa/01-analysis/KM03/frequency-table/*.txt ./KMlib003/
cp /ptmp/GIF/arnstrm/dipa/01-analysis/KM04/frequency-table/*.txt ./KMlib004/
cp /ptmp/GIF/arnstrm/dipa/01-analysis/KM01/frequency-table/*.txt ./KMlib001/
ls *
cd KMlib001/
ls -1
cd ..
nano README.txt
cd KMlib001/
less -S combined_counts_KM01.txt
less -S KMlib001_counts_KM01.txt
less uniq-mm.txt 
cd ../
nano README.txt 
less N-KMlib001-control_mm-stats.txt
cat Lb-KMlib001-rep3-9_mismatches_summary.txt
ls
join_files.sh _mismatches_summary.txt
join_files.sh *_mismatches_summary.txt
join_files.sh *_mismatches_summary.txt |sed 's/_mismatches_summary.txt//g'
join_files.sh *_mismatches_summary.txt |sed 's/_mismatches_summary.txt//g' > mismatch_summary_combined.txt
cd ../../KM02/mismatches-table/
join_files.sh *_mismatches_summary.txt |sed 's/_mismatches_summary.txt//g' > mismatch_summary_combined.txt
cd ../../KM03/mismatches-table/
join_files.sh *_mismatches_summary.txt |sed 's/_mismatches_summary.txt//g' > mismatch_summary_combined.txt
cd ../../KM04/mismatches-table/
join_files.sh *_mismatches_summary.txt |sed 's/_mismatches_summary.txt//g' > mismatch_summary_combined.txt
rename mismatch_summary_combined mismatch_summary_combined-KM04 *.txt
cd -
rename mismatch_summary_combined mismatch_summary_combined-KM03 *.txt
cd ../../KM02/mismatches-table/
rename mismatch_summary_combined mismatch_summary_combined-KM02 *.txt
cd ../../KM01/mismatches-table/
rename mismatch_summary_combined mismatch_summary_combined-KM01 *.txt
nano mismatch_summary_combined-KM01.txt 
nano pad_and_merge-mismatches.sh
wc -l Lb-KMlib001-rep3-5_mismatches_summary.txt
cut -f 1 Lb-KMlib001-rep3-5_mismatches_summary.txt
nano pad_and_merge-mismatches.sh 
chmod +x pad_and_merge-mismatches.sh
./pad_and_merge-mismatches.sh 
nano pad_and_merge-mismatches.sh 
./pad_and_merge-mismatches.sh 
cat ids 
rm ids 
rm *.1
cat pad_and_merge-mismatches.sh 
cat *mismatches_summary.txt | cut -f 1 |sort |uniq -n > ids
cat *mismatches_summary.txt | cut -f 1 |sort -k 1,1 n |uniq > ids
cat *mismatches_summary.txt | cut -f 1 |sort -k 1,1 -n |uniq > ids
cat ids 
nano pad_and_merge-mismatches.sh 
./pad_and_merge-mismatches.sh 
cat ids 
cat Lb_KMlib001-rep0_4_mismatches_summary.txt.1Lb_KMlib001-rep0_4_mismatches_summary.txt.1
cat Lb_KMlib001-rep0_4_mismatches_summary.txt.1
rm *.1
nano pad_and_merge-mismatches.sh 
cat Lb-KMlib001-rep3-3_mm-stats.txt
nano pad_and_merge-mismatches.sh 
./pad_and_merge-mismatches.sh 
cat SC-KMlib001-control_mismatches_summary.txt.1
nano pad_and_merge-mismatches.sh 
rm *.1
./pad_and_merge-mismatches.sh 
less -S mismatch_summary_combined.txt
nano pad_and_merge-mismatches.sh 
rm *.1
nano pad_and_merge-mismatches.sh 
rm ids  temp*
rm mismatch_summary_combined-KM01.txt
nano pad_and_merge-mismatches.sh 
cat pad_and_merge-mismatches.sh 
rm mismatch_summary_combined.txt
./pad_and_merge-mismatches.sh 
cat mismatch_summary_combined-sorted.txt
less -S mismatch_summary_combined-sorted.txt
nano pad_and_merge-mismatches.sh 
rm mismatch_summary_combined.txt mismatch_summary_combined-sorted.txt
./pad_and_merge-mismatches.sh 
cat mismatch_summary_combined-sorted.txt
less -S mismatch_summary_combined-sorted.txt
less -S mismatch_summary_combined-sorted.txt
rename mismatch_summary_combined-sorted mismatch_summary_combined-KM01 *.txt
cd ../../KM02/mismatches-table/
less -S mismatch_summary_combined-KM02.txt
rm mismatch_summary_combined-KM02.txt
cp /ptmp/GIF/arnstrm/dipa/01-analysis/KM01/mismatches-table/pad_and_merge-mismatches.sh ./
./pad_and_merge-mismatches.sh 
rename mismatch_summary_combined-sorted mismatch_summary_combined-KM02 *.txt
cd ../../KM03/mismatches-table/
cp /ptmp/GIF/arnstrm/dipa/01-analysis/KM01/mismatches-table/pad_and_merge-mismatches.sh ./
./pad_and_merge-mismatches.sh 
rename mismatch_summary_combined-sorted mismatch_summary_combined-KM03 *.txt
less -S mismatch_summary_combined-KM03.txt
cd ../../KM04/mismatches-table/
cp /ptmp/GIF/arnstrm/dipa/01-analysis/KM01/mismatches-table/pad_and_merge-mismatches.sh ./
./pad_and_merge-mismatches.sh 
rename mismatch_summary_combined-sorted mismatch_summary_combined-KM04 *.txt
cd ../../
cp KM0?/mismatches-table/mismatch_summary_combined-KM0* /lss/research/sashital-lab/Karthik/ISUGIF/20190403_results/
cd /lss/research/sashital-lab/Karthik/ISUGIF/20190403_results/
cat mismatch_summary_combined-KM01.txt
less -S mismatch_summary_combined-KM01.txt
cd arnstrm/
