## PBS configure
#PBS -N get_hg38_info
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=1
#PBS -l mem=3000m

# find the module commands
source /etc/profile.d/modules.sh
# download hg38
wget -c http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz -O hg38.fa.gz
# unzip
gzip -d hg38.fa.gz

# load samtools
module load samtools/1.9
# faidx 
samtools faidx hg38.fa

# find the info of size
size='tail -1 hg38.fa.fai | cut -f 3'
echo "Size:	$size"

# find the num of chr
grep -v '_' hg38.fa.fai >> hg38-2.fa.fai 
chr_num= 'less hg38-2.fa.fai | wc -l'
echo "Num of chromosomes:	$chr_num"

