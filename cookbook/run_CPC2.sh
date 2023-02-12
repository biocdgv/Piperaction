#!/usr/bin/bash

# run CPC2 (Kang et al. 2017) to find your transcripts's coding potential likeso:

    CPC2.sh \
    -i <TRANSCRIPTOME.FA> \
    -o <OUTPUT_FILE> \

# INPUT: a transcriptome file  in fasta format.
# OUTPUT: a text file with the coding potential of each transcript.