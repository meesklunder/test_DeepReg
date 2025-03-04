#! /bin/bash

# changed the directory in Inference_CNN_LSTM_class.py to:
	# data_path = '/home/mobaxterm/Desktop/map/UU/Writing_Assignment/test_DeepReg/Data/'
	# file_path = data_path + 'Ophcf2.proteins.fasta'

# running the model and saving the printed output to a log file in the Data directory
echo "running DeepReg... This may take a few minutes"
python3 ../DeepLearning-_TF/Inference/Inference_CNN_LSTM_class.py > ../Inference_Ophcf2.log
