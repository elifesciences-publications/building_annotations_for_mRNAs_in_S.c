cd /Users/mitchellellison/Desktop/Building_Refrence_File_for_mRNAs/Orientations 
ls

bedtools closest \
-a plus1nuc_CDS_CPS_sorted.bed \
-b plus1nuc_CDS_CPS_sorted.bed \
-io \
-D a \
-k 1 \
> plus1nuc_CDS-CPS_closest_results.tsv

# What I am doing here is:	
# 	Comparing the annotation file for mRNAs to itself
# 	Not allowing the program to call overlaps as the closeset annotation
# 	Having it report distance relative to file a and making the distance upstream be reported as negative and downstream be reported as positive 
# 	Allowing the software to only report one closest annotation

#plus1nuc_CDS-CPS_closest_results.tsv = 6331 genes



# Select genes that are within 500bp

# awk '$19<500 {print}' plus1nuc_CDS-CPS_closest_results.tsv > plus1nuc_CDS-CPS_closest_results_closer_than_500bp.tsv
awk '$19>-500 {print}' plus1nuc_CDS-CPS_closest_results.tsv > plus1nuc_CDS-CPS_closest_results_closer_than_500bp.temp
awk '$19<-200 {print}' plus1nuc_CDS-CPS_closest_results_closer_than_500bp.temp > plus1nuc_CDS-CPS_closest_results_closer_than_500bp2.temp

awk '$19<500 {print}' plus1nuc_CDS-CPS_closest_results.tsv > plus1nuc_CDS-CPS_closest_results_closer_than_500bp3.temp
awk '$19>200 {print}' plus1nuc_CDS-CPS_closest_results_closer_than_500bp.temp > plus1nuc_CDS-CPS_closest_results_closer_than_500bp4.temp

cat plus1nuc_CDS-CPS_closest_results_closer_than_500bp2.temp plus1nuc_CDS-CPS_closest_results_closer_than_500bp4.temp > plus1nuc_CDS-CPS_closest_results_closer_than_500bp.bed


#plus1nuc_CDS-CPS_closest_results_closer_than_500bp.tsv = 4422 genes

# Select tandem genes 
awk '$6==$15 {print}' plus1nuc_CDS-CPS_closest_results_closer_than_500bp.tsv > plus1nuc_CDS-CPS_tandem.tsv
# awk '$6==$15 {print}' plus1nuc_CDS-CPS_closest_results_closer_than_300bp.tsv > plus1nuc_CDS-CPS_tandem.tsv


#convert to BED6
awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' plus1nuc_CDS-CPS_tandem.tsv > plus1nuc_CDS-CPS_tandem1.temp
awk '{print $10 "\t" $11 "\t" $12 "\t" $13 "\t" $14 "\t" $15}' plus1nuc_CDS-CPS_tandem.tsv > plus1nuc_CDS-CPS_tandem2.temp
cat plus1nuc_CDS-CPS_tandem1.temp plus1nuc_CDS-CPS_tandem2.temp | sort | uniq > plus1nuc_CDS-CPS_tandem.bed
# tandem = 2976 genes


# Select Convergent and Divergent Genes
awk '$6!=$15 {print}' plus1nuc_CDS-CPS_closest_results_closer_than_500bp.tsv > plus1nuc_CDS-CPS_divergent_convergent.temp


# Select Divergent Genes
awk '$19<0 {print}' plus1nuc_CDS-CPS_divergent_convergent.temp > plus1nuc_CDS-CPS_divergent.tsv
awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' plus1nuc_CDS-CPS_divergent.tsv > plus1nuc_CDS-CPS_divergent1.temp
awk '{print $10 "\t" $11 "\t" $12 "\t" $13 "\t" $14 "\t" $15}' plus1nuc_CDS-CPS_divergent.tsv > plus1nuc_CDS-CPS_divergent2.temp
cat plus1nuc_CDS-CPS_divergent1.temp plus1nuc_CDS-CPS_divergent2.temp | sort | uniq > plus1nuc_CDS-CPS_divergent.bed
#divergent = 1186


# Select Convergent Genes
awk '$19>0 {print}' plus1nuc_CDS-CPS_divergent_convergent.temp > plus1nuc_CDS-CPS_convergent.tsv
awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' plus1nuc_CDS-CPS_convergent.tsv > plus1nuc_CDS-CPS_convergent1.temp
awk '{print $10 "\t" $11 "\t" $12 "\t" $13 "\t" $14 "\t" $15}' plus1nuc_CDS-CPS_convergent.tsv > plus1nuc_CDS-CPS_convergent2.temp
cat plus1nuc_CDS-CPS_convergent1.temp plus1nuc_CDS-CPS_convergent2.temp | sort | uniq > plus1nuc_CDS-CPS_convergent.bed
#convergent = 1981


rm *.temp





