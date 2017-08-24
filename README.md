# Tumor-Growth-Model
A Matlab script for stochastic simulations of the growth of clones in solid cancers. 

The program in this script can be used for simulating growth of malignant cells. 
Each clone starts as a single cell and grows according to the following dynamics.
Cells divide or lose clonenigic activity (i.e. stop growing) with rate lambda and probabilities a and 1-a, respectively. 
Clonogenic activity is lost for the whole clone simultaneously or for individual cells; the probability that a cell loses clonogenic activity through either of these processes is h and 1-h, respectively.
