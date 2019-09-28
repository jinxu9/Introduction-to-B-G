#!/bin/bash
#ATAC-seq data QC

#FRiP : fraction of reads in called peak regions -----Fraction of reads in peaks (FRiP) - Fraction of all mapped reads that fall into the called peak regions, i.e. usable reads in significantly enriched peaks divided by all usable reads. In general, FRiP scores correlate positively with the number of regions.
#ls ../peaks/*narrowPeak |while read id ;
#do 
#echo $id
#bed=../align/2nd_bowtiealign/$(basename $id "_peaks.narrowPeak").bed
#ls  -lh $bed 
#Reads=$(bedtools intersect -a $bed -b $id |wc -l|awk '{print $1}')
#totalReads=$(wc -l $bed|awk '{print $1}')
#echo $Reads  $totalReads 
#echo '==> FRiP value:' $(bc <<< "scale=2;100*$Reads/$totalReads")'%'
#done 

#IDR
#idr --sample /public/home/Chenzh275/Data/ATAC_GSE101940/peaks/stem_cell_ATAC_rep1_sorted_peaks.narrowPeak /public/home/Chenzh275/Data/ATAC_GSE101940/peaks/stem_cell_ATAC_rep2_sorted_peaks.narrowPeak  --plot










