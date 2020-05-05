# other requests


## 1) Generate position matrix summation files for 1 to 6 mismatches

* 2020/03/04
* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod/cas12a/04_otherRequests

#### Grab all the mm-stats.txt files



```
ls /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod/cas12a/02_analysis/*/mismatches-table/*mm-stats.txt | xargs -I xx ln -s xx
```

This will create the input files that will need to be used to run the position summary part of the KM01.sh script

```
#this first for loop separates out the reads by number of snps
for i in 1 2 3 4 5 6
do
#this second for loop grabs the reads and generates the input file
  for file in *_mm-stats.txt
  do
  echo ${file}_${i}
  awk '$2=="'$i'" {print $1}' $file | sed -e 's/\(.\)/\1\t/g' > ${file}_${i}
  done
done

```


* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod/cas12a/02_analysis/001


Will want to create separate folders for each number of SNPs ie (position-matrix_1 position-matrix_2 ... position-matrix_6)

```
mkdir position-matrix_1 position-matrix_2 position-matrix_3 position-matrix_4 position-matrix_5 position-matrix_6
mv *_1 position-matrix_1
mv *_2 position-matrix_2
mv *_3 position-matrix_3
mv *_4 position-matrix_4
mv *_5 position-matrix_5
mv *_6 position-matrix_6
```




This will create the position summaries

```
#run this in each of the folders to create new position summary.txt files

# generate positional frequency matrix
# requires datamash
# module load datamash

export PATH=$PATH:/work/gif/severin/isugif/software/datamash-1.3/bin/
string="CGGTTCGCGTGGATTAAAGG"

for i in 1 2 3 4 5 6
do
  echo "position-matrix_${i}"
  cd position-matrix_${i}
    for file in *_${i}
    do
      header=$(echo $string | sed -e 's/\(.\)/\1\t/g')
      echo -e "${file%.*}\t${header}" > ${file%.*}_pos-summary.txt
        for i in {1..20}; do
          datamash -s groupby $i count $i  < ${file}  |\
          grep -v "^N" | \
          cut -f 2 |\
          paste - - - - ;
        done |\
      datamash transpose |\
      paste <(echo -e "A\nC\nG\nT") - >>  ${file%.*}_pos-summary.txt
    done
 cd ..
done

```

These files have been generated, now just need to combine them

## 2) Combining files

Once all the position summary files are created then I can run a cat on each of the folders to reduce the number of files for the supplementary tables.  

* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod/cas12a/02_analysis/001/position-matrix

```
cat As*S8_*001* | more
As*_S9_*001*
As*_S8S9_*001*

001

As Fn Lb SC
_S8_ _S9_ _S8S9_
```


```

for i in 1 2 3 4 5 6
do
  echo "position-matrix_${i}"
  cd position-matrix_${i}

      for library in As Fn Lb SC
      do
        for ID in _S8_ _S9_ _S8S9_
        do
        cat *${library}*${ID}*_pos-summary.txt  > full_${library}_${ID}.txt
        cat *${library}_00*_pos-summary.txt  > full_${library}.txt
        done
      done
  cd ..
done
```


#for cas9 need 002 003 004 folders



## 3)tab separate sequences --DONE

* /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod/cas12a/02_analysis/001/frequency-table/final_counts.txt

Gave this to Karthik for whatever he needs it for.  He wanted to expand the sequences into individual cells rather than a single cell. ie 1 base per cell(per column)

* assumes the first 2 lines are header and should be ignored.  Start on the 3rd line and then expand any sequence it finds.

```
sed -e '3,$s/\([AGTCN]\)/\1\t/g'
```




## Copy files over to LSS folder

```
rsync -av /work/gif/severin/sashital-lab/2020_cas9-cas12amod/cas12amod /lss/research/sashital-lab/Karthik/ISUGIF/2020_cas12aNickase &
```
