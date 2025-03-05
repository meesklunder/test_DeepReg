# import modules
from matplotlib_venn import venn2
from matplotlib import pyplot as plt

# depict venn diagram
venn2(subsets = (341, 55, 153), set_labels = ('DeepReg','Pfam'), set_colors=("red", "green"), alpha=0.7)

# save it to a png file
plt.savefig("venn_pfam_DeepReg.png", dpi=150)
