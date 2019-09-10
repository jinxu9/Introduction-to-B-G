## PBS configure
#PBS -N homework2_get_info_zhangys
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=1
#PBS -l mem=3000m

# This is necessary to find  the module commands
source /etc/profile.d/modules.sh
# load tools by module
#get the information of genome from fastafile
#gzip -d dm6.fa.gz
#module load samtools 
#samtools faidx dm6.fa
#may not be the correct genome size
#size1=`tail -1 ./dm6.fa.fai|cut -f 3`
#echo " Genome Size:	$size1"  

awk '{sum+=$2} END {print " Genome Size:",sum}' ./dm6.fa.fai
#get the chromosome number
chrnum=`grep -v '_' ./dm6.fa.fai | cut -f 1 | cut -c 1-4 | uniq | wc -l`
#echo " Genome Size2:     $size2"
echo " Chromosome number:	$chrnum"
#echo " Genome Size3:     $size3" 
