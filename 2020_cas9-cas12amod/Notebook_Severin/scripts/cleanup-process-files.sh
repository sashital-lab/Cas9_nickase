#!/bin/bash
mkdir -p frequency-table mismatches-table position-matrix
mv *_mismatches_summary.txt mismatches-table/
mv *_mm-stats.txt mismatches-table/
mv *freq.txt frequency-table/
mv *_pos-summary.txt position-matrix/

cd mismatches-table/
cat *_mm-stats.txt |sort -S 10G --parallel 10 |uniq > uniq-mm.txt
mv uniq-mm.txt ../frequency-table/
cd ../frequency-table/
uniqfile=uniq-mm.txt

cut -f 1 $uniqfile > list-of-unique-fragments.txt
for freq in *freq.txt; do
cut -f 1 $freq > ${freq}.temp
   grep -Fwv -f ${freq}.temp list-of-unique-fragments.txt | awk '{print $1"\t0"}' > ${freq}.constant
   cat $freq ${freq}.constant |sort -S 10G -k1,1 --parallel 10 >> ${freq}.new
   rm ${freq}.temp  ${freq}.constant
   wc -l $freq.new
done

mkdir original
mv *_freq.txt ./original/
mv list-of-unique-fragments.txt ./original/
