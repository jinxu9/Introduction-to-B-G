## PBS configure 
#PBS -N homework2_xijf
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=1
#PBS -l mem=3000m

# This is necessary to find  the module commands
source /etc/profile.d/modules.sh

# Download the humangenome
wget -c http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz

#use samtolls
gzip -d hg38.fa.gz
module load samtools
samtools faidx hg38.fa

#caculate the size and the number of chromosomes
 #caculate the total number of character  
size_total=`tail -1 hg38.fa.fai |cut -f 3`
 #caculate tht length of chromosomes
a=`cut -f 1 hg38.fa.fai | wc -m`
b=`cut -f 1 hg38.fa.fai | wc -l`
name_length=`expr $a - $b`


size=`expr $size_total - $name_length`
chr_num=`grep -v 'chrun' hg38.fa.fai |wc -l`

#print the genome infomation
echo "genome name: Human genomes" >human_genome_info.txt
echo "Version:GRCh38.p12/hg38" >>human_genome_info.txt 
echo "Finish: Dec. 2013 initial release; Dec. 2017 patch release 12" >>human_genome_info.txt
echo "genome size:	$size" >>human_genome_info.txt
echo "Chromosome number:	$chr_num" >>human_genome_info.txt

