# Analysis on merging of cas9 and cas9_repeat data

* 2020/04/01/
* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_merge


## create the folders we need to merge

### 002
```
mkdir -p /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_merge/02_analysis/002

```

softlink the cas9_repeat files that were generated using the process_KM02
```
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/02_analysis/002/ -name "*_pos-summary.txt" | xargs -I xx ln -s xx
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/02_analysis/002/ -name "*_mm-stats.txt" | xargs -I xx ln -s xx
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/02_analysis/002/ -name "*_mismatches_summary.txt" | xargs -I xx ln -s xx
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/02_analysis/002/ -name "*_freq.txt" | xargs -I xx ln -s xx
```

softlink the cas9_repeat files that were generated using the process_KM02

```
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/002/ -name "*_pos-summary.txt" | xargs -I xx ln -s xx
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/002/ -name "*_mm-stats.txt" | xargs -I xx ln -s xx
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/002/ -name "*_mismatches_summary.txt" | xargs -I xx ln -s xx
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/002/ -name "*_freq.txt" | xargs -I xx ln -s xx
```

```
 find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/02_analysis/002/mis* -name "*mm-*"  | wc
    40
 find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/002/mis* -name "*mm-*"  | wc
    114

ls *mm-* | wc
    166     166    5335

```
There is a 12 sample difference from what I was expecting. Looks like I grab the samples that we don't want as well.

```
ls Sa_002_rep1_*mm-* | wc
     12      12     374
mv Sa_002_rep1_* ../003
ls *mm-* | wc
    154     154    4961

```

###  003

```
mkdir -p /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_merge/02_analysis/003

```

softlink the cas9_repeat files that were generated using the process_KM02
```
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/02_analysis/003/ -name "*_pos-summary.txt" | xargs -I xx ln -s xx
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/02_analysis/003/ -name "*_mm-stats.txt" | xargs -I xx ln -s xx
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/02_analysis/003/ -name "*_mismatches_summary.txt" | xargs -I xx ln -s xx
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/02_analysis/003/ -name "*_freq.txt" | xargs -I xx ln -s xx
```

softlink the cas9_repeat files that were generated using the process_KM02

```
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/003/ -name "*_pos-summary.txt" | xargs -I xx ln -s xx
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/003/ -name "*_mm-stats.txt" | xargs -I xx ln -s xx
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/003/ -name "*_mismatches_summary.txt" | xargs -I xx ln -s xx
find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/003/ -name "*_freq.txt" | xargs -I xx ln -s xx
```

```
 find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_repeat/02_analysis/003/mis* -name "*mm-*"  | wc
    20
 find /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/003/mis* -name "*mm-*"  | wc
    138

ls *mm-* | wc
    158

```
That checks out.


## Combine Files

copy over scripts
```
cp /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9/02_analysis/*.sh .
```

### 002

```
##Combine Files
cd /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_merge/02_analysis/002
../cleanup-process-files.sh
cd mismatches-table
../../pad_and_merge-mismatches.sh
cd ../frequency-table
##Final file processing
../../final-process-KMall.sh

```

### 003

```
##Combine Files
cd /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_merge/02_analysis/003
../cleanup-process-files.sh
cd mismatches-table
../../pad_and_merge-mismatches.sh
cd ../frequency-table
##Final file processing
../../final-process-KMall.sh

```

All files appear to have been generated as expected.

## Copy files over to LSS folder

```
rsync -av /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas9_merge /lss/research/sashital-lab/Karthik/ISUGIF/2020_cas12aNickase/cas9_merge
```
