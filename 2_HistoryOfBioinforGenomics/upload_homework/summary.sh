gzip -d canFam3.fa.gz 
module load samtools 
samtools  faidx canFam3.fa  

size=`tail -1  canFam3.fa.fai  |cut -f 3`
chr_num=`grep -v 'chrUn' canFam3.fa.fai |wc -l` 
echo "Genome Size:	$size"
echo "Chromosome number:	$chr_num"
