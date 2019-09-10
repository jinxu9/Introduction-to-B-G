## PBS configure 
#PBS -N homework2-Chenzihao
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=1
#PBS -l mem=3000m

source /etc/profile.d/modules.sh

#download  fastafile
wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/493/695/GCF_000493695.1_BalAcu1.0/GCF_000493695.1_BalAcu1.0_genomic.fna.gz
wget http://hgdownload.soe.ucsc.edu/goldenPath/balAcu1/bigZips/balAcu1.fa.gz

#get the information of genome from fastafile
gzip -d gzip -d balAcu1.fa.gz

#module load samtools 
samtools faidx GCF_000493695.1_BalAcu1.0_genomic.fna
samtools faidx balAcu1.fa

size=`tail -1 /public/home/Chenzh275/Data/balAcu1/balAcu1.fa.fai |cut -f 3`
printf " Genome Size:	$size\n"  

#there is no Minke Whales' chromosome information.
#ChrmNum=
#printf " Chromosome number:	"$ChrmNum

