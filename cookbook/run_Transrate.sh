#!/usr/bin/bash
# coding: utf-8

# ! conda activate <ACTIVATE_CONDA_ENVIRONMENT>:
# 
# run Transrate (Smith-Unna et al. 2016) to analyze assembly quality likeso:
# 
#      transrate \
#      --assembly <ASSEMBLIES_FILES> \
#      --left <FORWARD_READS> \
#      --rights <REVERSE_READS> \
#      --threads <NUMBER_THREADS> \
#      --output <OUTPUT_DIRECTORY> \  
#      
# INPUT: Several transcriptomes in fasta format.
# OUTPUT: Differente Transrate quality scores.