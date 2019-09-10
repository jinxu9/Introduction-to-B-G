## PBS configure 
#PBS -N homework2-Chenzihao
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=1
#PBS -l mem=3000m

source /etc/profile.d/modules.sh

#download  fastafile
#wget ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/493/695/GCF_000493695.1_BalAcu1.0/GCF_000493695.1_BalAcu1.0_genomic.fna.gz

#get the information of genome from fastafile
#gzip -d GCF_000493695.1_BalAcu1.0_genomic.fna.gz
#module load samtools 
#samtools faidx GCF_000493695.1_BalAcu1.0_genomic.fna
size=`tail -1 /public/home/Chenzh275/Data/balAcu1/GCF_000493695.1_BalAcu1.0_genomic.fna.fai|cut -f 3`
printf " Genome Size:	$size\n"  

#I can't find the chromosome number from fna-format file, maybe i'll update this,when the fa-format file is been downloaded.
#ChrmNum=
#printf " Chromosome number:	"$ChrmNum

