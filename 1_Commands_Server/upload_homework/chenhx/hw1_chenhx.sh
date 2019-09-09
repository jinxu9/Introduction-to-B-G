## PBS configure 
#PBS -N homework_chenhx
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=4
#PBS -l mem=3000m

# This is necessary to find  the module commands
source /etc/profile.d/modules.sh
# load tools by module 
module load bowtie2

date > /public/home/chenhx98/project/Introduction-to-B-G/1_Commands_Server/upload_homework/chenhx/log_chenhx
bowtie2 --version >> /public/home/chenhx98/project/Introduction-to-B-G/1_Commands_Server/upload_homework/chenhx/log_chenhx

