cd /Volumes/G_DRIVE/spt6_50_ChIP_seq
ls


#Pool Biologial Dupliates

####Rpb3

bigwigCompare \
--bigwig1 bigwig_files/ME001_S1_spike_in_normalized.bw \
--bigwig2 bigwig_files/ME002_S2_spike_in_normalized.bw \
--ratio mean \
--binSize 1 \
--outFileName bigwig_files/WT_Rpb3.bw \
--outFileFormat 'bigwig'


bigwigCompare \
--bigwig1 bigwig_files/ME003_S3_spike_in_normalized.bw \
--bigwig2 bigwig_files/ME004_S4_spike_in_normalized.bw \
--ratio mean \
--binSize 1 \
--outFileName bigwig_files/spt6-50_Rpb3.bw \
--outFileFormat 'bigwig'

####Spt6

bigwigCompare \
--bigwig1 bigwig_files/ME005_S5_spike_in_normalized.bw \
--bigwig2 bigwig_files/ME006_S6_spike_in_normalized.bw \
--ratio mean \
--binSize 1 \
--outFileName bigwig_files/WT_Spt6.bw \
--outFileFormat 'bigwig'


bigwigCompare \
--bigwig1 bigwig_files/ME007_S7_spike_in_normalized.bw \
--bigwig2 bigwig_files/ME008_S8_spike_in_normalized.bw \
--ratio mean \
--binSize 1 \
--outFileName bigwig_files/spt6-50_Spt6.bw \
--outFileFormat 'bigwig'

####HSV

bigwigCompare \
--bigwig1 bigwig_files/ME009_S9_spike_in_normalized.bw \
--bigwig2 bigwig_files/ME010_S10_spike_in_normalized.bw \
--ratio mean \
--binSize 1 \
--outFileName bigwig_files/WT_HSV.bw \
--outFileFormat 'bigwig'


bigwigCompare \
--bigwig1 bigwig_files/ME011_S11_spike_in_normalized.bw \
--bigwig2 bigwig_files/ME012_S12_spike_in_normalized.bw \
--ratio mean \
--binSize 1 \
--outFileName bigwig_files/spt6-50_HSV.bw \
--outFileFormat 'bigwig'

####Input

bigwigCompare \
--bigwig1 bigwig_files/ME013_S13_spike_in_normalized.bw \
--bigwig2 bigwig_files/ME014_S14_spike_in_normalized.bw \
--ratio mean \
--binSize 1 \
--outFileName bigwig_files/WT_Input.bw \
--outFileFormat 'bigwig'


bigwigCompare \
--bigwig1 bigwig_files/ME015_S15_spike_in_normalized.bw \
--bigwig2 bigwig_files/ME016_S16_spike_in_normalized.bw \
--ratio mean \
--binSize 1 \
--outFileName bigwig_files/spt6-50_Input.bw \
--outFileFormat 'bigwig'




#Calculate log2 fold change


bigwigCompare \
--bigwig1 bigwig_files/spt6-50_Rpb3.bw \
--bigwig2 bigwig_files/WT_Rpb3.bw \
--pseudocount 0.01 \
--ratio log2 \
--binSize 1 \
--numberOfProcessors "max" \
--outFileName bigwig_files/Rpb3_spt6-50_vs_WT_log2_ratio.bw \
--outFileFormat "bigwig"


bigwigCompare \
--bigwig1 bigwig_files/spt6-50_Spt6.bw \
--bigwig2 bigwig_files/WT_Spt6.bw \
--pseudocount 0.01 \
--ratio log2 \
--binSize 1 \
--numberOfProcessors "max" \
--outFileName bigwig_files/Spt6_spt6-50_vs_WT_log2_ratio.bw \
--outFileFormat "bigwig"


bigwigCompare \
--bigwig1 bigwig_files/spt6-50_HSV.bw \
--bigwig2 bigwig_files/WT_HSV.bw \
--pseudocount 0.01 \
--ratio log2 \
--binSize 1 \
--numberOfProcessors "max" \
--outFileName bigwig_files/HSV_spt6-50_vs_WT_log2_ratio.bw \
--outFileFormat "bigwig"


bigwigCompare \
--bigwig1 bigwig_files/spt6-50_Input.bw \
--bigwig2 bigwig_files/WT_Input.bw \
--pseudocount 0.01 \
--ratio log2 \
--binSize 1 \
--numberOfProcessors "max" \
--outFileName bigwig_files/Input_spt6-50_vs_WT_log2_ratio.bw \
--outFileFormat "bigwig"




