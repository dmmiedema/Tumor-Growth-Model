# Tumor-Growth-Model
Matlab scripts for stochastic simulations of the growth of clones in solid cancers. The code has been tested on MATLAB 9.0 and later versions.

The programs in these scripts can be used for simulating growth of malignant cells. 
Each clone starts as a single cell and grows according to the following dynamics.
Cells divide or lose clonenigic activity (i.e. stop growing) with rate lambda and probabilities a and 1-a, respectively. 
Clonogenic activity is lost for the whole clone simultaneously or for individual cells; the probability that a cell loses clonogenic activity through either of these processes is h and 1-h, respectively.

The versions "CGS" and "CGS_time" differ in that "a" is an input parameter and a constant in "CGS" (for exponential tumor growth) and "a" is time-dependent in "CGS_time*" (for tumor growth at the surface). In addition, the versions "CGS_time_stoch_a_x" and "CGS_time_stoch_a_t" have a Gaussian noise term added to the time-dependent average value of "a" for surface growth. The noise term is different for each clone, but constant over time for a particular clone in "CGS_time_stoch_a_x" (to model spatial fluctuations); and fluctuating over time for each clone in "CGS_time_stoch_a_t".

A demo with an example how the code is evaluated and instructions on how to install is also provided in this repository.
