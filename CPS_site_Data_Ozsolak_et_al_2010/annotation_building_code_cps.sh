cd /Users/mitchellellison/Desktop/Building_Refrence_File_for_mRNAs/CPS_site_Data_Ozsolak_et_al_2010
ls

head -n 43 Ozsolak_2010_polyadenylation_sites_V64.bed

awk ' $6=="+" {print $1 "\t" $3 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' mRNA.bed > mRNA_3prime_1.temp
awk ' $6=="-" {print $1 "\t" $2 "\t" $2 "\t" $4 "\t" $5 "\t" $6}' mRNA.bed > mRNA_3prime_2.temp
cat mRNA_3prime_1.temp mRNA_3prime_2.temp > mRNA_3prime.bed
rm  mRNA_3prime_1.temp mRNA_3prime_2.temp


bedtools sort \
-i mRNA_3prime.bed \
> mRNA_3prime_sorted.bed

bedtools sort \
-i Ozsolak_2010_polyadenylation_sites_V64.bed \
> Ozsolak_2010_polyadenylation_sites_V64_sorted.bed

bedtools closest \
-a mRNA_3prime_sorted.bed \
-b Ozsolak_2010_polyadenylation_sites_V64_sorted.bed \
-k 1 \
-D a \
-s \
-io \
-t first \
> mRNA_3prime_closest_unique_map_Ozsolak_2010_polyadenylation_sites.temp

awk '{print $7 "\t" $8 "\t" $9 "\t" $4 "\t" $5 "\t" $6}' mRNA_3prime_closest_unique_map_Ozsolak_2010_polyadenylation_sites.temp > mRNA_3prime_closest_unique_map_Ozsolak_2010_polyadenylation_sites.bed
rm mRNA_3prime_closest_unique_map_Ozsolak_2010_polyadenylation_sites.temp

# head nature11142-s2.txt 
# 
# awk '{print $1 "\t" $2 "\t" $2 "\t" $3 "\t" $4 "\t" "+"}' nature11142-s2.txt > unique_map_brogaard_2012.bed
# 
# head unique_map_brogaard_2012.bed
# 
# 
# awk ' $6=="+" {print $1 "\t" $2 "\t" $2 "\t" $4 "\t" $5 "\t" $6}' mRNA.bed > mRNA_5prime_1.temp
# awk ' $6=="-" {print $1 "\t" $3 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' mRNA.bed > mRNA_5prime_2.temp
# cat mRNA_5prime_1.temp mRNA_5prime_2.temp > mRNA_5prime.bed
# rm  mRNA_5prime_1.temp mRNA_5prime_2.temp
# 
# 
# head mRNA_5prime.bed
# 
# 
# bedtools sort \
# -i mRNA_5prime.bed \
# > mRNA_5prime_sorted.bed
# 
# bedtools sort \
# -i unique_map_brogaard_2012.bed \
# > unique_map_brogaard_2012_sorted.bed
# 
# bedtools closest \
# -a mRNA_5prime_sorted.bed \
# -b unique_map_brogaard_2012_sorted.bed \
# -k 1 \
# -t first \
# > mRNA_5prime_closest_unique_map_brogaard_2012.temp
# 
# 
# awk '{print $7 "\t" $8 "\t" $9 "\t" $4 "\t" $5 "\t" $6}' mRNA_5prime_closest_unique_map_brogaard_2012.temp > mRNA_5prime_closest_unique_map_brogaard_2012.bed
# rm mRNA_5prime_closest_unique_map_brogaard_2012.temp




