#!/usr/bin/bash
# coding: utf-8

# ! conda activate <ACTIVATE_CONDA_ENVIRONMENT>
# 
# run Transabyss (Robertson et al. 2010) to *de novo* assembly of transcripts:
# 
#     transabyss \
#     --se <SINGLE-END_READS> \
#     --pe <PAIRED-END_READS> \
#     --threads <NUMBER_THREADS> \
#     --outdir <OUTPUT_DIRECTORY> \
# 
# INPUT: clean reads
# OUTPUT:*de novo* assembled transcripts.