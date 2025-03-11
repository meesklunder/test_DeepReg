#! /bin/bash

# DEEPREG vs PFAM
# ------------------

deepreg_results="Data/predictions.txt"

# sort both foles
sort -k1 Data/Ophcf2.TF.txt | sed 's/ /_/g' > Data/Ophcf2.TF.srt.txt
sort -k1 $deepreg_results > Data/predictions.srt.txt

echo -n "nr of TFs by DeepReg: "
grep -c . Data/predictions.srt.txt

echo -n "overlapping predictions Deepreg vs Pfam: "
join -o1.1,1.2 Data/Ophcf2.TF.srt.txt Data/predictions.srt.txt | grep -c .

echo -n "Only Pfam preds: "
join -v1 Data/Ophcf2.TF.srt.txt Data/predictions.srt.txt | grep -c .

echo -n "Only DeepReg preds: "
join -v2 Data/Ophcf2.TF.srt.txt Data/predictions.srt.txt | grep -c .

echo -n "total Fungal specific in Pfam preds: "
grep -c "Fungal_Specific_TF" Data/Ophcf2.TF.srt.txt

echo -n "missed fungal specific by DeepReg: "
grep -c "Fungal_Specific_TF" Data/only_pfam_TFs.txt

# DEEPTFACTOR vs PFAM
# ----------------

# predicted by running in conda prompt:
#	python3 tf_running.py -i ./Dataset/Ophcf2.proteins_nostar.fasta -o ./result -g cpu

deeptfactor_results="/home/mobaxterm/Desktop/map/UU/Writing_Assignment/deeptfactor/result/prediction_result.txt"

echo " "

# find total predicted TF's
echo -n "nr of TFs by deeptfactor: "
grep -c "True" $deeptfactor_results

# save only positive predictions
grep "True"  $deeptfactor_results | sort -k1 > Data/deeptfactor_predictions.srt.txt

echo -n "overlapping predictions deeptfactor vs Pfam: "
join -t $'\t' -o 2.3,1.1,1.2 Data/Ophcf2.TF.srt.txt Data/deeptfactor_predictions.srt.txt | grep -c .

echo -n "Only Pfam preds: "
join -v1 Data/Ophcf2.TF.srt.txt Data/deeptfactor_predictions.srt.txt | grep -c .

echo -n "Only DeepTFactor preds: "
join -v2 Data/Ophcf2.TF.srt.txt Data/deeptfactor_predictions.srt.txt | grep -c .

echo -n "total Fungal specific in Pfam preds: "
grep -c "Fungal_Specific_TF" Data/Ophcf2.TF.srt.txt

echo -n "missed fungal specific by deeptfactor: "
join -v1 Data/Ophcf2.TF.srt.txt Data/deeptfactor_predictions.srt.txt | grep -c "Fungal_Specific_TF"

# DEEPREG vs DEEPTFACTOR
# -----------------------

echo " "

echo -n "overlapping predictions deeptfactor vs deepreg: "
join Data/deeptfactor_predictions.srt.txt Data/predictions.srt.txt | grep -c .

echo -n "Only deeptfactor preds: "
join -v1 Data/deeptfactor_predictions.srt.txt Data/predictions.srt.txt | grep -c .

echo -n "Only DeepReg preds: "
join -v2 Data/deeptfactor_predictions.srt.txt Data/predictions.srt.txt | grep -c .

# THREE_WAY COMPARISON
# ---------------------

echo -n "Only DeepReg (Abc): "
join -v2 Data/deeptfactor_predictions.srt.txt Data/predictions.srt.txt | join -v1 - Data/Ophcf2.TF.srt.txt | grep -c .

echo -n "Only deeptfactor (aBc): "
join -v1 Data/deeptfactor_predictions.srt.txt Data/predictions.srt.txt | join -v1 - Data/Ophcf2.TF.srt.txt | grep -c .

echo -n "DeepReg & deeptfactor (ABc): "
join -o0 Data/deeptfactor_predictions.srt.txt Data/predictions.srt.txt | join -v1 - Data/Ophcf2.TF.srt.txt | grep -c .

echo -n "Only Pfam (abC): "
join -v1 Data/Ophcf2.TF.srt.txt Data/predictions.srt.txt | join -v1 - Data/deeptfactor_predictions.srt.txt | grep -c .

echo -n "DeepReg & Pfam (AbC): "
join -o0 Data/Ophcf2.TF.srt.txt Data/predictions.srt.txt | join -v1 - Data/deeptfactor_predictions.srt.txt | grep -c .

echo -n "deeptfactor & Pfam (aBC): "
join -o0 Data/Ophcf2.TF.srt.txt Data/deeptfactor_predictions.srt.txt | join -v1 - Data/predictions.srt.txt | grep -c .

echo -n "All (ABC): "
join -o0 Data/Ophcf2.TF.srt.txt Data/deeptfactor_predictions.srt.txt | join - Data/predictions.srt.txt | grep -c .

