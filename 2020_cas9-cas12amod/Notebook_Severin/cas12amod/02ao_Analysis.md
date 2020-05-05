# Analysis of cas12amod other samples

Some samples were placed in the cas9 lane as some kind of control.  I meant to include them in the original analysis 02 but didn't so I am doing them separately and will combine the final output in the excel file.


* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod/cas12a/02_analysis/other
* 2020/03/04

Create a script to soft link all of the R2 fastq files.

```
ls /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/00_rawdata/cas9/001/*R2*fastq | perl -pe 's/\// /g' | perl -pe 's/_L001/\t/g' | awk '{print "ln -s",$0,$(NF-1)".fastq"}' | perl -pe 's/\t/_L001/g' | perl -pe 's/ /\//g' | perl -pe 's/\// /' |perl -pe 's/\// /' | perl -pe 's/fastq\//fastq /' > link.sh

chmod 755 link.sh
./link.sh
```

## Process the reads

Had to modify the extract the sequence section of each script to ensure it would match surrounding sequence.



Used the same script and regular expression `sed 's/.*TGCTGTACGAATCGTACAGGGTGCTTCAGGATGTTTT\(.\{20\}\)TGCGTCAAGCT.*/\1/g'` to extract the portion of the reads of interest.  It is located in the first 60 bases of the read.


```
# process KM01
cp ../001/process_KM01.sh .

for fq in *.fastq; do
  ./process_KM01.sh $fq;
done &>stdout.txt &

more reads_extracted.txt  | perl -pe 's/,//g' | awk '{print $4,$8/$6}'
# about 60% of the reads can be processed
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

* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod/cas12a/02_analysis/other


# cleanup files, putting them in different folders:
cp ../001/cleanup-process-files.sh .
./cleanup-process-files.sh

# process mismatch-summary table files
cd mismatches-table
cp ../001/mismatches-table/pad_and_merge-mismatches.sh .
./pad_and_merge-mismatches.sh
```

## Final file processing

Final processing of files were done as follows:


```
cd frequency-table
find ../../ -name final-process-KMall.sh
cp ../../001/frequency-table/final-process-KMall.sh .
./final-process-KMall.sh
```


## Copy files over to LSS folder

```
rsync -av /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod /lss/research/sashital-lab/Karthik/ISUGIF/2020_cas12aNickase &
```
