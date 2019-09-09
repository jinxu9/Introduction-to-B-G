## PBS configure 
#PBS -N homework_xijf
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=4
#PBS -l mem=3000m

# This is necessary to find  the module commands
source /etc/profile.d/modules.sh
# load tools by module 
module load bowtie2 

bowtie2 --version  > /public/home/xijf/project/log

date >> /public/home/xijf/project/log 
