# import modules
from matplotlib_venn import venn3
from matplotlib import pyplot as plt

venn3(subsets=(261, 145, 80, 47, 32, 8, 121), set_labels=('DeepReg', 'DeepTFactor', 'Pfam'), set_colors=("orange", "blue", "red"), alpha=0.7) 
 
plt.title("TF predictions from DeepReg, DeepTFactor and Pfam-based annotation")
plt.savefig("venn_DeepReg_DeepTFactor_Pfam.png", dpi=150)