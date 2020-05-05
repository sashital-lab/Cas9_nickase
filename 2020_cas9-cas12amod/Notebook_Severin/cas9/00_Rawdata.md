# Raw data

* /work/gif/archiveNova/DipaSashital/2020_cas9-cas12amod
* 2020/02/05

Data was `rsync`ed from sashital-lab LSS folder.

```
rsync -av /lss/research/sashital-lab/Karthik/ISUGIF /work/gif/archiveNova/DipaSashital/2020_cas9-cas12amod
```


Created the indexCas9.txt file that associates the Sequencing output file name with a filename that is more representative to its contents.

| Cas| library | trial | DNA | Time Point|
|--|--|--|--|--|
|SpCas9 | KMlib002 |trial 1 | SC | control |
|SpCas9 | KMlib002 | trial 1 | SC | time point 1|
|SpCas9  | KMlib002 | trial 1 | N | time point 1|
|SpCas9  | KMlib002 | trial 1 | SC | time point 2|
|SpCas9  | KMlib002 | trial 1 | N | time point 2|
|SpCas9  | KMlib002 | trial 1 | SC | time point 3|
|SpCas9  | KMlib002 | trial 1 | N | time point 3|
|SpCas9  | KMlib002 | trial 1 | SC | time point 4|
|SpCas9  | KMlib002 | trial 1 | N | time point 4|
|SpCas9  | KMlib002 | trial 1 | SC | time point 5|
|SpCas9  | KMlib002 | trial 1 | N | time point 5|
|SpCas9 | KMlib002 |trial 1 |  N |control |


## Copy raw data to the working folder

* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/00_rawdata/cas9

```
cp /work/gif/archiveNova/DipaSashital/2020_cas9-cas12amod/ISUGIF/Cas9_FASTQ/*gz .
ln -s /work/gif/archiveNova/DipaSashital/2020_cas9-cas12amod/ISUGIF/Cas9_FASTQ/indexCas9.txt
```

## Rename and organize files

* 2020/02/26
* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod/cas12a

Unzip all the raw data files

```
for fq in *.gz; do
gunzip $fq;
done
```

Rename them based on index file provided by Karthik

* the `_` is very important since the names have numbers so 30* would include 301 302 303 etc which would be incorrect.

```
while read a b; do
  rename ${a} ${b} ${a}_*.fastq;
done<indexCas9.txt
```

Organize them into folders
```
for f in $(ls *fastq |cut -f 2 -d "_" |sort | uniq); do
  mkdir -p $f;
  mv *_${f}_*fastq $f/;
done

```
