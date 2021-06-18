#!/usr/bin/env python
# coding: utf-8

# ! conda activate <ACTIVATE_CONDA_ENVIRONMENT> 
# 
# 
# run BBDuk (Bushnell 2018) to split your reads regarding their biological origin based on k-mer length. It's very useful while working with RNA-seq dual data. 
# 
#     bbduk.sh \
#     in1= <FORWARD_READS> \
#     in2= <REVERSE_READS> \
#     ref= <REFERENCE> \
#     k= <K-MER_LENGTH> \
#     hdist= <HAMMING_DISTANCE> \
#     stats= <CONTAMINATION_SEQUENCES_REPORT> \
#     out= <UNMATCHED_READS> \
#     outm= <MATCHED_READS> \
# 
# INPUT: raw reads 
# OUTPUT: matched and unmatched reads to the reference of interest and k-mer pattern.

# In[ ]:




