#!/usr/bin/env python
# coding: utf-8

# ! conda activate <ACTIVATE_CONDA_ENVIRONMENT>
# 
# run rnaSPAdes (Bushmanova et al. 2019) to *de novo* assembly of transcripts likeso:
# 
#     rnaspades.py \
#     -1 <FORWARD_READS> \
#     -2 <REVERSE_READS> \
#     -s <SINGLE-END_READS> \
#     -o <OUTPUT_DIRECTORY> \
#     -t <NUMBER_THREADS> \
# 
# INPUT: clean reads.
# OUTPUT: *de novo* assembled transcripts.
