# Analysis on cas9_repeat

* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/02/analysis
* 2020/03/30


Create a script to soft link all of the R2 fastq files.

```
ls /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/00_rawdata/*/*_R2_*fastq | perl -pe 's/\// /g' | perl -pe 's/_L001/\t/g' | awk '{print "ln -s",$0,$(NF-1)".fastq"}' | perl -pe 's/\t/_L001/g' | perl -pe 's/ /\//g' | perl -pe 's/\// /' |perl -pe 's/\// /' | perl -pe 's/fastq\//fastq /' > link.sh

chmod 755 link.sh
./link.sh
```

Sort the files by library

```
for f in $(ls *fastq |cut -f 2 -d "-" |sort | uniq); do
  mkdir -p $f;
  mv *-${f}-*fastq $f/;
done

```

## Process the reads

Had to modify the extract the sequence section of each script to ensure it would match surrounding sequence.

```
# process KM02
cd 002
for fq in *.fastq; do
  ./process_KM02.sh $fq;
done &>stdout.txt &

# process KM03
for fq in *.fastq; do
  ./process_KM03.sh $fq;
done &>stdout.txt &
```
move all to R2 folder

```
mkdir R2
mv *.txt *.fastq R2
```

R2 was averaging between 40-65% which is a little lower than the other samples and one sample had really low extracted reads.

```
Sp-002-rep4R-11_S10.fastq 0.27258
```

## R1 fastq files were used instead

Better extraction was achieved using the R1 files.  this required modifying the process_KM0(2/3).sh scripts (see scripts folder) to create the reverse complement of each read prior to extraction

Create a script to soft link all of the R1 fastq files.

```
ls /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/00_rawdata/*/*_R1_*fastq | perl -pe 's/\// /g' | perl -pe 's/_L001/\t/g' | awk '{print "ln -s",$0,$(NF-1)".fastq"}' | perl -pe 's/\t/_L001/g' | perl -pe 's/ /\//g' | perl -pe 's/\// /' |perl -pe 's/\// /' | perl -pe 's/fastq\//fastq /' > link.sh

chmod 755 link.sh
./link.sh
```

Sort the files by library

```
for f in $(ls *fastq |cut -f 2 -d "-" |sort | uniq); do
  mkdir -p $f;
  mv *-${f}-*fastq $f/;
done

```

## Process the reads

Had to modify the extract the sequence section of each script to ensure it would match surrounding sequence.

```
# process KM02
cd 002
for fq in *.fastq; do
  ./process_KM02.sh $fq;
done &>stdout.txt &

# process KM03
for fq in *.fastq; do
  ./process_KM03.sh $fq;
done &>stdout.txt &
```


### 002
Read extraction was still low for this sample in 002 but will proceed and let Dipa and Karthik know

```
cat reads_extracted.txt  | perl -pe 's/,//g' | awk '{print $4, $NF/$(NF-2)}'
Sa-002-rep3-10_S39.fastq 0.738757
Sa-002-rep3-11_S40.fastq 0.789801
Sa-002-rep3-2_S31.fastq 0.586673
Sa-002-rep3-3_S32.fastq 0.815639
Sa-002-rep3-4_S33.fastq 0.776807
Sa-002-rep3-5_S34.fastq 0.802199
Sa-002-rep3-6_S35.fastq 0.710751
Sa-002-rep3-7_S36.fastq 0.790868
Sa-002-rep3-8_S37.fastq 0.553362
Sa-002-rep3-9_S38.fastq 0.756843
Sa-002-rep4R-10_S29.fastq 0.649234
Sa-002-rep4R-11_S30.fastq 0.739165
Sa-002-rep4R-2_S21.fastq 0.73627
Sa-002-rep4R-3_S22.fastq 0.596481
Sa-002-rep4R-4_S23.fastq 0.761308
Sa-002-rep4R-5_S24.fastq 0.720791
Sa-002-rep4R-6_S25.fastq 0.721551
Sa-002-rep4R-7_S26.fastq 0.692848
Sa-002-rep4R-8_S27.fastq 0.729892
Sa-002-rep4R-9_S28.fastq 0.613174
Sp-002-rep3-10_S19.fastq 0.788341
Sp-002-rep3-11_S20.fastq 0.794474
Sp-002-rep3-2_S11.fastq 0.714407
Sp-002-rep3-3_S12.fastq 0.804365
Sp-002-rep3-4_S13.fastq 0.798431
Sp-002-rep3-5_S14.fastq 0.798631
Sp-002-rep3-6_S15.fastq 0.805311
Sp-002-rep3-7_S16.fastq 0.793198
Sp-002-rep3-8_S17.fastq 0.80867
Sp-002-rep3-9_S18.fastq 0.772855
Sp-002-rep4R-10_S9.fastq 0.680785
Sp-002-rep4R-11_S10.fastq 0.325851
Sp-002-rep4R-2_S1.fastq 0.506311
Sp-002-rep4R-3_S2.fastq 0.534706
Sp-002-rep4R-4_S3.fastq 0.698548
Sp-002-rep4R-5_S4.fastq 0.496542
Sp-002-rep4R-6_S5.fastq 0.659745
Sp-002-rep4R-7_S6.fastq 0.581791
Sp-002-rep4R-8_S7.fastq 0.691427
Sp-002-rep4R-9_S8.fastq 0.613644
```

### 003

```
cat reads_extracted.txt  | perl -pe 's/,//g' | awk '{print $4, $NF/$(NF-2)}'
Sa-003-rep1R-10_S49.fastq 0.699369
Sa-003-rep1R-11_S50.fastq 0.691751
Sa-003-rep1R-2_S41.fastq 0.596824
Sa-003-rep1R-3_S42.fastq 0.70702
Sa-003-rep1R-4_S43.fastq 0.732358
Sa-003-rep1R-5_S44.fastq 0.736937
Sa-003-rep1R-6_S45.fastq 0.717822
Sa-003-rep1R-7_S46.fastq 0.717633
Sa-003-rep1R-8_S47.fastq 0.740612
Sa-003-rep1R-9_S48.fastq 0.687448
Sa-003-rep2R-10_S59.fastq 0.599948
Sa-003-rep2R-11_S60.fastq 0.729564
Sa-003-rep2R-2_S51.fastq 0.589518
Sa-003-rep2R-3_S52.fastq 0.726273
Sa-003-rep2R-4_S53.fastq 0.730182
Sa-003-rep2R-5_S54.fastq 0.730597
Sa-003-rep2R-6_S55.fastq 0.7453
Sa-003-rep2R-7_S56.fastq 0.707255
Sa-003-rep2R-8_S57.fastq 0.725253
Sa-003-rep2R-9_S58.fastq 0.655322
```

* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/02/analysis/003
* 2020/03/31

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
for KM in 002 003; do
  cd $KM
  ../cleanup-process-files.sh
  cd ..
done


# process mismatch-summary table files
for KM in 002 003; do
  cd $KM/mismatches-table
  ../../pad_and_merge-mismatches.sh
  cd ..
done
```


## Final file processing


* start here

```
cd 002/frequency-table
../../final-process-KMall.sh
cd ../..
```

```
cd 003/frequency-table
../../final-process-KMall.sh
cd ../..
```

All files appear to have been generated as expected.


## Copy files over to LSS folder

```
rsync -av /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat /lss/research/sashital-lab/Karthik/ISUGIF/2020_cas12aNickase/cas9_repeat
```


## Merging final file processing

see cas9_merge
