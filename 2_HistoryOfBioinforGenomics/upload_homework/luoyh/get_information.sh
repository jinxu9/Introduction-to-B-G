twoBitToFa C_elegans.2bit C_elegans.fa
module load samtools/1.9
samtools faidx C_elegans.fa
python summary.py
