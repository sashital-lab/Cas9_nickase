#!/bin/bash
module load jellyfish
module load bioawk
uniqfile=$1

# create a unique list of fragments and add the missing fragments to frequency table to pad them (with values of 0)
#cat *freq.txt | cut -f 1 | awk '{print ">"NR"\n"$1}' > full.fa

#jellyfish count -m 20 -s 100M -t 10 -C full.fa -o full.jf
#jellyfish dump full.jf | bioawk -c fastx '{print $seq"\t"$name}' > full_freq.txt

cut -f 1 $uniqfile > list-of-unique-fragments.txt
for freq in *freq.txt; do
cut -f 1 $freq > ${freq}.temp
   grep -Fwv -f ${freq}.temp list-of-unique-fragments.txt | awk '{print $1"\t0"}' > ${freq}.constant
   cat $freq ${freq}.constant |sort -k1,1 --parallel 10 >> $freq.new
   rm ${freq}.temp  ${freq}.constant
   wc -l $freq.new
done

mkdir original
mv *_freq.txt ./original/
mv full* ./original/
mv list-of-unique-fragments.txt ./original/
