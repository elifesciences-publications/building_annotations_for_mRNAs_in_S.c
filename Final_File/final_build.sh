cd /Users/mitchellellison/Desktop/Building_Refrence_File_for_mRNAs/Final_File
ls

bedtools sort -i mRNA.bed > mRNA_sorted.bed


join -j 4 -o 1.1,1.2,1.3,1.4,1.5,1.6,2.1,2.2,2.3,2.4 <(sort -k4 mRNA_5prime_closest_unique_map_brogaard_2012.bed) <(sort -k4 mRNA_3prime_closest_unique_map_Ozsolak_2010_polyadenylation_sites.bed) > join1.txt

join -j 4 -o 1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,1.10,2.1,2.2,2.3,2.4 <(sort -k4 join1.txt) <(sort -k4 mRNA_sorted.bed) > join2.txt


awk ' $6=="-" {print}' join2.txt > join_minus.txt 
awk ' $6=="+" {print}' join2.txt > join_plnus.txt 

awk '{print $1 "\t" $2 "\t" $8 "\t" $4 "\t" "." "\t" $6 "\t" $12 "\t" $13 "\t" "255,0,0" "\t" $2-$8}' join_plnus.txt > plus1nuc_CDS_CPS_temp1
awk '{print $1 "\t" $8 "\t" $2 "\t" $4 "\t" "." "\t" $6 "\t" $12 "\t" $13 "\t" "255,0,0" "\t" $8-$2}' join_minus.txt > plus1nuc_CDS_CPS_temp2

cat plus1nuc_CDS_CPS_temp1 plus1nuc_CDS_CPS_temp2 > plus1nuc_CDS_CPS.temp

#'{ if(($7 == 6) && ($8 >= 11000000)) { print } }'

awk ' $3<=0 {print $1  "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10}' plus1nuc_CDS_CPS.temp > plus1nuc_CDS_CPS_excluded1.temp
awk ' $2<=0 {print $1  "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10}' plus1nuc_CDS_CPS.temp > plus1nuc_CDS_CPS_excluded2.temp
awk ' $10>0 {print $1  "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10}' plus1nuc_CDS_CPS.temp > plus1nuc_CDS_CPS_excluded3.temp
cat plus1nuc_CDS_CPS_excluded1.temp plus1nuc_CDS_CPS_excluded2.temp plus1nuc_CDS_CPS_excluded3.temp > plus1nuc_CDS_CPS_excluded.bed


awk ' $3>0 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10}' plus1nuc_CDS_CPS.temp > plus1nuc_CDS_CPS_1.temp
awk ' $2>0 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9 "\t" $10}' plus1nuc_CDS_CPS_1.temp > plus1nuc_CDS_CPS_2.temp
awk ' $10<=0 {print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $8 "\t" $9}' plus1nuc_CDS_CPS_2.temp > plus1nuc_CDS_CPS.bed


bedtools sort -i plus1nuc_CDS_CPS.bed > plus1nuc_CDS_CPS_sorted.bed









