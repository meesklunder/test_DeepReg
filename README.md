# test_DeepReg

In this project, three ways of predicting Transcription Factor identity from sequences are compared. One is based on the predicted Pfam domains, and has been carried out before. The second is DeepReg, which can be downloaded from [GitHub](https://github.com/LeonardoLed/DeepLearning-_TF). The third is DeepTFactor and can be downloaded from [BitBucket](https://bitbucket.org/kaistsystemsbiology/deeptfactor/src/master/).

The Data folder contains all the predicted genes' protein sequences from *Ophiocordyceps camponoti-floridani* and the Pfam-predicted TF's, downloaded from the [Fungal Genomics Portal](https://fungalgenomics.science.uu.nl/portal/ophcf2/).
It also contains the output file from DeepReg, containing their predicted TF's with confidence scores, and intermediate files.

There is one script explaining how DeepReg was run, called `running_DeepReg.sh`. DeepTFactor was run using the example code from their directory and following the installation guide for packages described there. The file `comparing_TFs.sh` contains code that counts the different overlaps in predicten TF's, and then `viz.py` vizualzes this in a venn diagram.  

