#!/usr/bin/env python
# coding: utf-8

# ! conda activate <ACTIVATE_CONDA_ENVIRONMENT>
# 
# run PLEK (Li et al. 2015) in order to find the coding potential of your transcripts. But first, if you have a non-model organism or different from a human or vertebrate, you should train PLEK with coding and non-coding reference databases likeso:
#  
#     PLEKModelling.py \
#     -mRNA <REFERENCE_mRNA_DATABASE> \
#     -lncRNA <REFERENCE_ncRNA_DATABASE> \
#     -prefix <PREFIX_JOB> \
#     -thread <NUMBER_THREADS> \
#     
# then you can run the software to analyze coding potentials:
#      
#     PLEK.py \
#     -fasta <TRANSCRIPTOME.FA> \
#     -out <OUTPUT.FILE> \
#     -thread <NUMBER_THREADS> \
#     -range <PREFIX_JOB.range> \
#     -model <PREFIX_JOB.model> \
#     
#         parameters -range and -model are generated with the PLEKModelling.py script. The databases 
#         can be looked up in ensembl databases (Hubbard et al. 2002)
#     
# INPUT: mRNA and lncRNA databases, transcriptome in fasta format.
# OUTPUT: list of the coding potential of each sequence from the transcriptome.
