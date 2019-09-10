#PBS -N homework
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=4
#PBS -l mem=3000m

source /etc/profile.d/modules.sh
module load samtools

samtools --version

date
