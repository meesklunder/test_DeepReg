#! /bin/bash

# the Pfam-bsaed prediction results in 208 TFs
# DeepReg predicts 490 TFs

# sort both files on their gene name (first column)
sort -k1 Data/Ophcf2.TF.txt | sed 's/ /_/g' > Data/Ophcf2.TF.srt.txt
sort -k1 Data/predictions.txt > Data/predictions.srt.txt

# save overlapping and non-overlapping predictions
join -o1.1,1.2 Data/Ophcf2.TF.srt.txt Data/predictions.srt.txt > Data/overlapping_TFs.txt
join -v1 Data/Ophcf2.TF.srt.txt Data/predictions.srt.txt > Data/only_pfam_TFs.txt
join -v2 Data/Ophcf2.TF.srt.txt Data/predictions.srt.txt > Data/only_DeepReg_TFs.txt

# counting
grep -c . Data/overlapping_TFs.txt # >> 153 predictions overlap
grep -c . Data/only_DeepReg_TFs.txt # >> 341 predictions are only from DeepReg
grep -c . Data/only_pfam_TFs.txt # >> 55 predictions are only from Pfam

grep -c "Fungal_Specific_TF" Data/only_pfam_TFs.txt # >> 16 (of the 96) fungal specific TF's were not found by DeepReg
