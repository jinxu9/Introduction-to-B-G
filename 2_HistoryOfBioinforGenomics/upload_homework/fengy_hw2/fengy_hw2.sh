## PBS configure
#PBS -N fengy_hw2
#PBS -j oe
#PBS -1 batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=1

#this is necessary to find the module commands
source /etc/profile.d/modules.sh

# download the chicken's genome
wget http://hgdownload.soe.ucsc.edu/goldenPath/galGal6/bigZips/galGal6.fa.fai

# print the information
echo "Name: Chicken genome"
echo "Version: Gallus_gallus-6.0/galGal6"
echo "Finish Time: Mar. 2017"

# calculate the size of genome and  the number of chromosomes
gen_size=`tail -1 /public/home/fengy65/genomes/galGal6.fa.fai |cut -f 3`
chrom_num=`grep -v 'NW' /public/home/fengy65/genomes/galGal6.fa.fai | wc -l`

# return the numbers
echo "Genome Size: $gen_size"
echo "Chromosome Number: $chrom_num"
