# Generating the mis-match count table and positional nucleotide frequency matrix

The input is a fastq file. The R2 reads (reverse reads) have a 20bp cas sequence that contains up to 10 mis-matches. The flanking sequence is constant and needs to be trimmed before processing this 20bp sequence. Once 20 bp sequence is extracted, the number of mis-matches, as compared to the original sequence needs to be computed and the frequency of nucleotides at each position needs to be calculated.

## Experiment

Three different libraries were prepared:

1. KMlib001
2. KMlib003
3. KMlib004

Each of these libraries were tested with three variants of Cas12a (FnCas12a, LbCas12a and AsCas12a) and were identified with the first 2 letters (Fn, Lb, and As)

Design of the oligos were as follows
![figure1](assets/fig1.png)
Fig1: Sequence features.


## Data

Data was securely `rsync`ed from the PI's LSS server to the Condo cluster. The files were organized based on library name and then Cas12a variant.

```bash
rsync --progress -rts /lss/research/sashital-lab/Karthik/DataAnalysis/Library/20190102_HTS_Cas12a/*fastq* ./
for fq in *.gz; do
gunzip $fq;
done
while read a b; do
  rename ${a} ${b} ${a}*.fastq;
done<index.txt
for f in $(ls *fq |cut -f 2 -d "_" |sort ); do
  mkdir -p $f;
  mv *${f}*fq $f/;
done
```
_`index.txt` file is in the repo_

## Quality Check

In an interactive session, `fastqc` was run on all fastq files and `multiqc` to collate them together as follows:

```bash
salloc -N 1 -n 16 -t 8:00:00
parallel "fastqc {}" ::: */*.fq
for dir in strain*; do
  cd $dir
  multiqc .
  cd ..
done
```

The html files are also available in this repo.

## Processing files

For each of three library, respective query sequence was created as separate files.


`query.fa` for `KMlib001`

```
>KMlib001
CGGTTCGCGTGGATTAAAGG
```

`query.fa` for `KMlib002`

```
>KMlib002
GGAAATTAGGTGCGCTTGGC
```

`query.fa` for `KMlib003`

```
>KMlib001
GGCGCGGGCCGCTCGCTCTA
```

`query.fa` for `KMlib004`

```
>KMlib001
ATTAAAAATGAGCTTTTCTA
```
**These methods have been modified, as there was a bug in Jellyfish that was preventing certain even number kmers in the output**
<details>
  <summary>Old methods</summary>
Also, for each library, separate processing script was prepared and was run. The scripts in the repo.

1. [KMlib001](process_KMlib001.sh)
2. [KMlib002](process_KMlib002.sh)
3. [KMlib003](process_KMlib003.sh)
4. [KMlib003](process_KMlib004.sh)


The files were then collated:

```bash
join_files.sh *mismatches_stat.txt |\
sed 's/_R2_mismatches_stat.txt//g' |\
sort -k1,1 -n > mismatch_table.txt

for f in *R2_pos-summary.txt; do
  cat $f;
done > frequency-table.txt
```
The files were then transferred to Excel and formatted for easy reading.
</details>
