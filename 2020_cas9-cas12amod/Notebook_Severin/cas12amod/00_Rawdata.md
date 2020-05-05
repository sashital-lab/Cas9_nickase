# Raw data for Cas12a mod

Created indexCas12a.txt file that associates the Sequencing output file name with a filename that is more representative to its contents.

| Cas| library | trial | DNA | Time Point|
|--|--|--|--|--|
|KMlib001 trial 1 | KMlib001 | trial 1  | SC| Control |
|FnCas12a | KMlib001 | trial 1 | SC | time point 1|
|FnCas12a | KMlib001 | trial 1 | N | time point 1|
|FnCas12a | KMlib001 | trial 1 | SC | time point 2|
|FnCas12a | KMlib001 | trial 1 | N | time point 2|
|FnCas12a | KMlib001 | trial 1 | SC | time point 3|
|FnCas12a | KMlib001 | trial 1 | N | time point 3|
|FnCas12a | KMlib001 | trial 1 | SC | time point 4|
|FnCas12a | KMlib001 | trial 1 | N | time point 4|
|FnCas12a | KMlib001 | trial 1 | SC | time point 5|
|FnCas12a | KMlib001 | trial 1 | N | time point 5|
|FnCas12a  S8 | KMlib001 | trial 1 | SC | time point 1|
|FnCas12a S8 | KMlib001 | trial 1 | N | time point 1|
|FnCas12a S8 | KMlib001 | trial 1 | SC | time point 2|
|FnCas12a S8 | KMlib001 | trial 1 | N | time point 2|
|FnCas12a S8 | KMlib001 | trial 1 | SC | time point 3|
|FnCas12a S8 | KMlib001 | trial 1 | N | time point 3|
|FnCas12a S8 | KMlib001 | trial 1 | SC | time point 4|
|FnCas12a S8 | KMlib001 | trial 1 | N | time point 4|
|FnCas12a S8 | KMlib001 | trial 1 | SC | time point 5|
|FnCas12a S8 | KMlib001 | trial 1 | N | time point 5|


## Copy raw data to the working folder

* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod/cas12a

```
cp /work/gif/archiveNova/DipaSashital/2020_cas9-cas12amod/ISUGIF/Cas12a_mod_FASTQ/*gz /work/gif/archiveNova/DipaSashital/2020_cas9-cas12amod/ISUGIF/

cp /work/gif/archiveNova/DipaSashital/2020_cas9-cas12amod/ISUGIF/Cas12a_mod_FASTQ/*gz .

```


## Rename and organize files

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
done<indexCas12a.txt
```


Organize them into folders
```
for f in $(ls *fastq |cut -f 2 -d "_" |sort | uniq); do
  mkdir -p $f;
  mv *_${f}_*fastq $f/;
done

```
