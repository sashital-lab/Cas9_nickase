# Analysis Cas12amod

* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod/cas12a/02_analysis
* 2020/02/26

Create a script to soft link all of the R2 fastq files.

```
ls /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod/cas12a/00_rawdata//*/*_R2_*fastq | perl -pe 's/\// /g' | perl -pe 's/_L001/\t/g' | awk '{print "ln -s",$0,$(NF-1)".fastq"}' | perl -pe 's/\t/_L001/g' | perl -pe 's/ /\//g' | perl -pe 's/\// /' |perl -pe 's/\// /' | perl -pe 's/fastq\//fastq /' > link.sh

chmod 755 link.sh
./link.sh
```

## Sort the files by library

```
for f in $(ls *fastq |cut -f 2 -d "_" |sort | uniq); do
  mkdir -p $f;
  mv *_${f}_*fastq $f/;
done
rmdir S8 S8S9 S9

```


## Process the reads

Had to modify the extract the sequence section of each script to ensure it would match surrounding sequence.



Used the same script and regular expression `sed 's/.*TGCTGTACGAATCGTACAGGGTGCTTCAGGATGTTTT\(.\{20\}\)TGCGTCAAGCT.*/\1/g'` to extract the portion of the reads of interest.  It is located in the first 60 bases of the read.


```
# process KM01
cp ../../../../cas9/02_analysis/001/process_KM01.sh .

for fq in *.fastq; do
  ./process_KM01.sh $fq;
done &>stdout.txt &

more reads_extracted.txt  | perl -pe 's/,//g' | awk '{print $4,$8/$6}'
# about 80% of the reads can be processed


# process KM02
#cp ../../../../cas9/02_analysis/002/process_KM02.sh .
#for fq in *.fastq; do
#  ./process_KM02.sh $fq;
#done &>stdout.txt &

```
I believe that the index file I was given falsely claimed that these files `As_002_2_S0.fastq  As_002_3_S0.fastq  As_002_4_S0.fastq  As_002_5_S0.fastq  As_002_6_S0.fastq  As_002_7_S0.fastq  As_002_8_S0.fastq  As_002_9_S0.fastq  As_002_10_S0.fastq  As_002_11_S0.fastq` had the second libary type when in fact they should be 001 as that is what extracts a similar level of sequence section.



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

* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod/cas12a/02_analysis/001


# cleanup files, putting them in different folders:
cp ../../../../cas9/02_analysis/cleanup-process-files.sh .
./cleanup-process-files.sh










# process mismatch-summary table files
cd mismatches-table
find ../../../../ -name pad_and_merge-mismatches.sh
cp ../../../../cas9/02_analysis/pad_and_merge-mismatches.sh .
./pad_and_merge-mismatches.sh

```

## Final file processing

Final processing of files were done as follows:


```
cd frequency-table
find ../../../../../ -name final-process-KMall.sh
cp ../../../../../cas9/02_analysis/final-process-KMall.sh .
./final-process-KMall.sh
```


## Copy files over to LSS folder

```
rsync -av /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod /lss/research/sashital-lab/Karthik/ISUGIF/2020_cas12aNickase &
```
