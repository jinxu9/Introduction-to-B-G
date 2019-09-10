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

bowtie2 --version  > /public/home/xijf/Github/Introduction-to-B-G/1_Commands_Server/upload_homework/xijf/log

date >> /public/home/xijf/Github/Introduction-to-B-G/1_Commands_Server/upload_homework/xijf/log
