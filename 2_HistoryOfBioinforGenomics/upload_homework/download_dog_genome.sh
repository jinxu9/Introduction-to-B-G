## PBS configure 
#PBS -N load_module_test
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=1
#PBS -l mem=3000m

# This is necessary to find  the module commands
source /etc/profile.d/modules.sh
# load tools by module 
wget http://hgdownload.soe.ucsc.edu/goldenPath/canFam3/bigZips/canFam3.fa.gz -O /public/home/jinxu/DB/canFam3/canFam3.fa.gz

