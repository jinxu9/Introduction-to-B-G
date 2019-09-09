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

module load bowtie2/2.1.0
bowtie2 --version 
