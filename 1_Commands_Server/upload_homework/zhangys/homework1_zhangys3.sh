## PBS configure 
#PBS -N Homework_zhangys3_1
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=4
#PBS -l mem=3000m

# This is necessary to find  the module commands
source /etc/profile.d/modules.sh
# load tools by module 
module load  tophat2/2.0.12 

date > /public/home/zhangys3/project/Introduction-to-B-G/1_Commands_Server/upload_homework/zhangys/log
tophat2 --version >> /public/home/zhangys3/project/Introduction-to-B-G/1_Commands_Server/upload_homework/zhangys/log

