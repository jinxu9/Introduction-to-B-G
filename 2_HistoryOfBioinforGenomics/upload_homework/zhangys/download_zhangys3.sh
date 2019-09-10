## PBS configure 
#PBS -N homework2_download_zhangys
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=1
#PBS -l mem=3000m

# This is necessary to find  the module commands
source /etc/profile.d/modules.sh
# load tools by module 
wget http://hgdownload.soe.ucsc.edu/goldenPath/dm6/bigZips/dm6.fa.gz -O /public/home/zhangys3/project/homework/2/dm6.fa.gz

