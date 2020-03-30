cd /Users/mitchellellison/Desktop/Building_Refrence_File_for_mRNAs/Nucleosome_Positions_by_Chemical_Cleavage
ls

head nature11142-s2.txt 

awk '{print $1 "\t" $2 "\t" $2 "\t" $3 "\t" $4 "\t" "+"}' nature11142-s2.txt > unique_map_brogaard_2012.bed

head unique_map_brogaard_2012.bed


awk ' $6=="+" {print $1 "\t" $2 "\t" $2 "\t" $4 "\t" $5 "\t" $6}' mRNA.bed > mRNA_5prime_1.temp
awk ' $6=="-" {print $1 "\t" $3 "\t" $3 "\t" $4 "\t" $5 "\t" $6}' mRNA.bed > mRNA_5prime_2.temp
cat mRNA_5prime_1.temp mRNA_5prime_2.temp > mRNA_5prime.bed
rm  mRNA_5prime_1.temp mRNA_5prime_2.temp


head mRNA_5prime.bed


bedtools sort \
-i mRNA_5prime.bed \
> mRNA_5prime_sorted.bed

bedtools sort \
-i unique_map_brogaard_2012.bed \
> unique_map_brogaard_2012_sorted.bed

bedtools closest \
-a mRNA_5prime_sorted.bed \
-b unique_map_brogaard_2012_sorted.bed \
-k 1 \
-D a \
-io \
-t first \
> mRNA_5prime_closest_unique_map_brogaard_2012.temp


awk '{print $7 "\t" $8 "\t" $9 "\t" $4 "\t" $5 "\t" $6}' mRNA_5prime_closest_unique_map_brogaard_2012.temp > mRNA_5prime_closest_unique_map_brogaard_2012.bed
rm mRNA_5prime_closest_unique_map_brogaard_2012.temp




