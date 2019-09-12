## PBS configure 
#PBS -N hw2_of_day2_chenhx
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=4
#PBS -l mem=3000m


source /etc/profile.d/modules.sh
module load samtools

#download the genome of yeast, named sacCer3
wget http://hgdownload.soe.ucsc.edu/goldenPath/sacCer3/bigZips/chromFa.tar.gz -O /public/home/chenhx98/project/hw/day2/genome_of_yeast/sacCer3.fa.gz
gunzip sacCer3.fa.gz
cat chrI.fa chrII.fa chrIII.fa chrIV.fa chrV.fa chrVI.fa chrVII.fa chrVIII.fa chrIX.fa chrX.fa chrXI.fa chrXII.fa chrXIII.fa chrXIV.fa chrXV.fa chrXVI.fa chrM.fa > allchr_of_sacCer3.fa

#get information from the genome
samtools faidx allchr_of_sacCer3.fa
size=$(awk -v sum=0 '{sum+=$2} END{print sum}' /public/home/chenhx98/project/hw/day2/genome_of_yeast/allchr_of_sacCer3.fa.fai)
num=$(awk -v i=0 '{if($2>0) i+=1} END{print i}' /public/home/chenhx98/project/hw/day2/genome_of_yeast/allchr_of_sacCer3.fa.fai)

#print out results
echo "Name of genome: sacCer3" > Infor_of_genome.txt
echo "Version of genome: sacCer3" >> Infor_of_genome.txt
echo "Finish time: Apr 2011" >> Infor_of_genome.txt
echo "Genome size:  $size" >> Infor_of_genome.txt
echo "Number of chromosomes:  $num" >> Infor_of_genome.txt


