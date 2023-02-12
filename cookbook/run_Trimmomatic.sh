#!/usr/bin/bash
# coding: utf-8

# ! conda activate <ACTIVATE_CONDA_ENVIRONMENT>
# 
# run Trimmomatic (Bolger et al. 2014) to remove low quality bases, artifacts and contamination likeso:
#     
#     for PE: 
#     trimmomatic PE \
#     -threads <NUMBER_THREADS> \
#     -phred33 <PHRED_VALUE_THRESHOLD> \
#     <INPUT_FORWARD_READS> <INPUT_REVERSE_READS> \
#     <OUTPUT_FORWARD_READS> <OUTPUT_REVERSE_READS> \
#     ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:keepBothReads \
#     LEADING:3 TRAILING:3 MINLEN:36 \
#     
#     for SE:
#     trimmomatic SE \
#     -threads <NUMBER_THREADS> \
#     -phred33 <PHRED_VALUE_THRESHOLD> \
#     <INPUT_SINGLE-END_READS> \
#     ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 \
#     SLIDINGWINDOW:4:15 MINLEN:36 \
#     
#     --TruSeq3-PE are the ILLUMINA adapters's fasta sequences 
#     (https://github.com/timflutre/trimmomatic/tree/master
#     /adapters).
#     
# INPUT: raw reads and adapters's fasta sequences.
# OUTPUT: clean reads.