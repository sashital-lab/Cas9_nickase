# Analysis

* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis
* 2020/02/06

Create a script to soft link all of the R2 fastq files.

```
ls /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/00_rawdata/cas9/*/*_R2_*fastq | perl -pe 's/\// /g' | perl -pe 's/_L001/\t/g' | awk '{print "ln -s",$0,$(NF-1)".fastq"}' | perl -pe 's/\t/_L001/g' | perl -pe 's/ /\//g' | perl -pe 's/\// /' |perl -pe 's/\// /' | perl -pe 's/fastq\//fastq /' > link.sh

chmod 755 link.sh
./link.sh
```
Sort the files by library

```
for f in $(ls *fastq |cut -f 2 -d "_" |sort | uniq); do
  mkdir -p $f;
  mv *_${f}_*fastq $f/;
done

#manually move the controls
mv N/002_N_rep* 002/
mv N/003_N_rep* 003/


mv SC/002_SC_rep* 002/
mv SC/003_SC_rep* 003/
mv SC/004_SC_rep* 004/

rmdir N SC
```

## Process the reads

Had to modify the extract the sequence section of each script to ensure it would match surrounding sequence.

```
# process KM01
for fq in *.fastq; do
  ./process_KM01.sh $fq;
done &>stdout.txt &

# process KM02
for fq in *.fastq; doq
  ./process_KM02.sh $fq;
done &>stdout.txt &

# process KM03
for fq in *.fastq; do
  ./process_KM03.sh $fq;
done &>stdout.txt &

## files that were incorrectly assigned and I needed to rerun
for fq in Sa_002_rep1_10_S82* Sa_002_rep1_11_S83* Sa_002_rep1_1_S73* Sa_002_rep1_2_S74* Sa_002_rep1_3_S75* Sa_002_rep1_4_S76* Sa_002_rep1_5_S77* Sa_002_rep1_6_S78* Sa_002_rep1_7_S79* Sa_002_rep1_8_S80* Sa_002_rep1_9_S81* Sa_002_rep1_N_S84*; do
  ./process_KM03.sh $fq;
done &>stdout.txt &


# process KM04
for fq in *.fastq; do
  ./process_KM04.sh $fq;
done &>stdout.txt &
```

These scripts generates 4 sets of files for every fastq file.

| File                          | Contents                                                                             |
|:------------------------------|:-------------------------------------------------------------------------------------|
| PREFIX_pos-summary.txt        | frequency of nucleotides at each position                                            |
| PREFIX_mm-stats.txt           | 2-column table listing all kmer and its mis-matches to the correct sequence          |
| PREFIX_mismatches_summary.txt | condensed PREFIX_mm-stats.txt table, summarizing total kmers found for each mis-match |
| PREFIX_freq.txt               | 2-column table with kmer and number of times it is seen in the file                  |


## Combine Files

The next task is to combine these files and make unified file for each of the above file. This was done for each library, as follows:

```bash
# cleanup files, putting them in different folders:
for KM in 001 002 003 004; do
  cd $KM
  ../cleanup-process-files.sh
  cd ..
done

# process frequency table files
# for KM in 001 002 003 004; do
#   cd $KM/frequency-table
#   ../../makefull.sh uniq-mm.txt
#   cd ..
# done

# process mismatch-summary table files
for KM in 001 002 003 004; do
  cd $KM/mismatches-table
  ../../pad_and_merge-mismatches.sh
  cd ..
done
# makes mismatch_summary_combined.txt file
```


## Final file processing

Final processing of files were done as follows:

```
cd 001/frequency-table
../../final-process-KMall.sh
```

```
cd 002/frequency-table
../../final-process-KMall.sh
```

```
cd 003/frequency-table
../../final-process-KMall.sh
```

```
cd 004/frequency-table
../../final-process-KMall.sh
```


All files appear to have been generated as expected. makefull.sh appears to be a duplicate of cleanup-process-files.sh and so was not run as its output was already generated.  R2 reads provided sufficient extraction of the target sequences.


## Copy files over to LSS folder

```
rsync -av /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9 /lss/research/sashital-lab/Karthik/ISUGIF/2020_cas12aNickase/cas9
```



# Identified some samples that were mis labeled as 002 and need to rerun as 003

* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/002
* 2020/03/05

```
/work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/002$ wc -l  mismatches-table/*mm-stats.txt  | awk '$1<10000'
       32 mismatches-table/Sa_002_rep1_10_S82_mm-stats.txt
       40 mismatches-table/Sa_002_rep1_11_S83_mm-stats.txt
      404 mismatches-table/Sa_002_rep1_1_S73_mm-stats.txt
       35 mismatches-table/Sa_002_rep1_2_S74_mm-stats.txt
      173 mismatches-table/Sa_002_rep1_3_S75_mm-stats.txt
       47 mismatches-table/Sa_002_rep1_4_S76_mm-stats.txt
      161 mismatches-table/Sa_002_rep1_5_S77_mm-stats.txt
       45 mismatches-table/Sa_002_rep1_6_S78_mm-stats.txt
      111 mismatches-table/Sa_002_rep1_7_S79_mm-stats.txt
       76 mismatches-table/Sa_002_rep1_8_S80_mm-stats.txt
       99 mismatches-table/Sa_002_rep1_9_S81_mm-stats.txt
       52 mismatches-table/Sa_002_rep1_N_S84_mm-stats.txt
```
The extraction of mismatched reads is extremely low for these samples.  I wanted to verify the correct library was being reported.



This for loop set generates the counts for the highest represented sequence
```


  for file in Sa_002_rep1_10_S82.fastq Sa_002_rep1_11_S83.fastq Sa_002_rep1_1_S73.fastq Sa_002_rep1_2_S74.fastq Sa_002_rep1_3_S75.fastq Sa_002_rep1_4_S76.fastq Sa_002_rep1_5_S77.fastq Sa_002_rep1_6_S78.fastq Sa_002_rep1_7_S79.fastq Sa_002_rep1_8_S80.fastq Sa_002_rep1_9_S81.fastq Sa_002_rep1_N_S84.fastq

    for file in *fastq
    do
    echo $file >> outSeq 2>error
    sed -n '2~4'p ${file} |sed 's/.*TGCTGTACGAATCGTACAGGGTGCTTCAGGATGTTTT\(.\{20\}\)TGCGTCAAGCT.*/\1/g'  | awk 'length($0)<21' | sort | uniq -c | sort -rn | head -n 1 >> outSeq 2>error    
    sed -n '2~4'p ${file} |sed 's/.*TTGCTGTACGAATCGTACAGGGTGCTTCAGGAT\(.\{20\}\)GGGGGTTGGTCAAGCTCGGA.*/\1/g'   | awk 'length($0)<21' |  sort | uniq -c | sort -rn | head -n 1 >> outSeq 2>error
    sed -n '2~4'p ${file} | sed 's/.*TTGCTGTACGAATCGTACAGGGTGCTTCAGGTTTA\(.\{20\}\)GGGGGTGTCAAGCTCGGA.*/\1/g'  | awk 'length($0)<21' |  sort | uniq -c | sort -rn | head -n 1 >> outSeq 2>error
    sed -n '2~4'p ${file} | sed 's/.*TTGCTGTACGAATCGTACAGGGTGCTTCAGGTTTA\(.\{20\}\)GGGGGTGTCAAGCTCGGA.*/\1/g'  | awk 'length($0)<21' |  sort | uniq -c | sort -rn | head -n 1 >> outSeq 2>error
    done &


this for loop gives the total counts given each extraction for libraries 001 002 003 004

  for file in *fastq
  do
  echo $file >> out 2>error &
  sed -n '2~4'p ${file} | sed 's/.*TGCTGTACGAATCGTACAGGGTGCTTCAGGATGTTTT\(.\{20\}\)TGCGTCAAGCT.*/\1/g'       | awk 'length($0)<21' |wc -l  | awk '{print "t1 " $0}' >> out 2>error
  sed -n '2~4'p ${file} | sed 's/.*TTGCTGTACGAATCGTACAGGGTGCTTCAGGAT\(.\{20\}\)GGGGGTTGGTCAAGCTCGGA.*/\1/g'  | awk 'length($0)<21' |wc -l | awk '{print "t2 " $0}' >> out 2>error
  sed -n '2~4'p ${file} | sed 's/.*TTGCTGTACGAATCGTACAGGGTGCTTCAGGTTTA\(.\{20\}\)GGGGGTGTCAAGCTCGGA.*/\1/g'  | awk 'length($0)<21' |wc -l | awk '{print "t3 " $0}' >> out 2>error
  sed -n '2~4'p ${file} | sed 's/.*TTGCTGTACGAATCGTACAGGGTGCTTCAGGTTTA\(.\{20\}\)GGGGGTGTCAAGCTCGGA.*/\1/g'  | awk 'length($0)<21' |wc -l | awk '{print "t4 " $0}' >> out 2>error
  done &
```

This analysis confirms that the files identified above were in fact mis categoriezed as library 002 when in fact they are library 003. I am going to clean up those files and move them accordingly.



```
#remove the mismatch output
wc -l  mismatches-table/*mm-stats.txt  | awk '$1<10000 {print $NF}' | xargs -I xx rm xx

#in position-matrix frequencey-table and mismatches-table
rm Sa_002_rep1_10_S82* Sa_002_rep1_11_S83* Sa_002_rep1_1_S73* Sa_002_rep1_2_S74* Sa_002_rep1_3_S75* Sa_002_rep1_4_S76* Sa_002_rep1_5_S77* Sa_002_rep1_6_S78* Sa_002_rep1_7_S79* Sa_002_rep1_8_S80* Sa_002_rep1_9_S81* Sa_002_rep1_N_S84*

# in mismatch-table
mkdir delete
mv mismatch_summary_combined* delete/

# in frequency table I reset the folder by moving all files *_freq.txt back to the main folder and everything else into delete

#move the raw files to 003
wc -l  mismatches-table/*mm-stats.txt  | awk '$1<10000' | tr '/' ' ' | awk '{print $NF}' | perl -pe 's/_mm-stats.txt/.fastq/g'  | xargs -I xx mv xx ../003/
```
