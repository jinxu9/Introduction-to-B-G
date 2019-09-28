## PBS configure 
#PBS -N ATAT-seq-analysis
#PBS -j oe
#PBS -q batch
#PBS -S /bin/sh
#PBS -l nodes=1:ppn=1
#PBS -l mem=3000m
#ATACseq analysis flow script record

#source /etc/profile.d/modules.sh

#download raw data
#mkdir -p fastqdata/sra
#cd fastqdata/sra
#for i in `seq 57 62`;
#do
   # prefetch SRR5874${i} &
#done

#change sra formate to fastq file
#mv *sra ../fastqdata
#ls *sra |while read id;
#do 
#nohup fastq-dump --split-3 --gzip $id & 
#done 
#cd ./sra
#rm *sra

#do qc to see the quality of data
#cd ../../ && mkdir qc
#cd qc
#ls ../fastqdata/*fastq.gz|while read id;
#do 
#nohup fastqc $id -o ./ &
#done
#multiqc *zip 


#module load samtools
#module load bowtie/v1.0.0
#qcresults looks no need to do clean-step, but the duplication, so here just start next step.
#cd ../ && mkdir align && cd align
#ls ../../fastqdata |for i in `seq 57 62`;
#do
#bowtie -p 5 -S -m 20 -X 2000 --sam-RG "ID:sample_${i}" --sam-RG "PL:illumina" --sam-RG "SM:SRR58746${i}" ../../../reference/TAIR10/TAIR10 -1 ../../fastqdata/SRR58746${i}_1.fastq -2 ../../fastqdata/SRR58746${i}_2.fastq |samtools sort -@ 2 -O bam -o ./SRR58746${i}_sorted.bam  
#done 

#make index for the bam files
#ls *.bam |while read id ;
#do 
#nohup samtools flagstat $id > ${id%%.*}.stat &
#nohup samtools index $id &
#done

#bamtobed
#ls *.bam |while read id ;
#do 
#bedtools bamtobed -i $id > ${id%.*}.bed 
#done

#genome size of Arabidopsis_thaliana 1.2e8 
#ls ../align/2nd_bowtiealign/*bam | while read id;
#do 
#macs2 callpeak -t $id -g 1.2e8 --nomodel --shift -75 --extsize 150 -n ${id%.*} --outdir ./
#done
#using in macs2 callpeak -g


#bamCoverage
#ls *.bam |while read id;
#do 
#bamCoverage -p 5 --normalizeUsing CPM -b $id -o ${id%.*}.bw 
#done

#build a readscount table
#cat *narrowPeak > readcount.bed 2> cat.err
#less readcount.bed |cut -f '1,2,3' > readcount.bed_cut.bed
#sort -k1,1V -k2,2n -k3,3n readcount.bed_cut.bed > readcount.bed_cut_sorted.bed
#bedtools merge -i readcount.bed_cut_sorted.bed -c 1 -o count > readcount.bed_cut_sorted_new.bed
#bedtools multicov -bams ../align/2nd_bowtiealign/stem_cell_ATAC_rep1_sorted.bam ../align/2nd_bowtiealign/stem_cell_ATAC_rep2_sorted.bam ../align/2nd_bowtiealign/stem_cell_ATAC_rep3_sorted.bam ../align/2nd_bowtiealign/mesophyll_cell_ATAC_rep1_sorted.bam ../align/2nd_bowtiealign/mesophyll_cell_ATAC_rep2_sorted.bam ../align/2nd_bowtiealign/mesophyll_cell_ATAC_rep3_sorted.bam -bed readcount_cut_sorted_new.bed > readcount_cut_sorted_final.bed 2>readcount.err &
#cat readcount_cut_sorted_final.bed |awk -FS '{print $1,$2,$3,$4"\tmerge_peaks_"NR}' >readcount_cut_sorted_finalfianl.bed 


#TSS
#computeMatrix reference-point  --referencePoint TSS  -p 5 -b 1000 -a 1000 -R ../../reference/TAIR10/Arabidopsis_thaliana.TAIR10.45.gtf -S ../align/2nd_bowtiealign/*.bw --skipZeros -o matrix_TSS.gz --outFileSortedRegions regions_genes.bed 
#computeMatrix scale-point  -p 5 -b 1000 -a 1000 -R ../../reference/TAIR10/Arabidopsis_thaliana.TAIR10.45.gtf -S ../align/2nd_bowtiealign/*.bw --skipZeros -o matrix_TSS.gz --outFileSortedRegions regions_genes.bed
#plotHeatmap -m matrix_TSS.gz -out Heatmap.png
#plotProfile --dpi 720 -m matrix_TSS.gz -out profile.pdf --plotFileFormat pdf
 
