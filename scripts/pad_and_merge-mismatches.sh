#!/bin/bash
cat *mismatches_summary.txt | cut -f 1 |sort -k 1,1 -n |uniq > ids
for f in *mismatches_summary.txt; do
cut -f 1 $f | sort -k1,1 -n > temp
grep -Fwv -f temp ids  | awk '{print $1"\t0"}' > temp-absent
cat $f temp-absent >> temp-new
mv temp-new  $f.1;
echo -e "before: $(cat $f |wc -l)\tafter: $(cat $f.1 |wc -l)"
done
join_files.sh *_mismatches_summary.txt.1 |sed 's/_mismatches_summary.txt.1//g' > mismatch_summary_combined.txt
rm *_mismatches_summary.txt.1 ids temp temp-absent

(head -n 1 mismatch_summary_combined.txt && tail -n +2 mismatch_summary_combined.txt | sort -k1,1 -n) > mismatch_summary_combined-sorted.txt
