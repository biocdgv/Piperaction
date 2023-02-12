#!/usr/bin/bash

# run PORTRAIT (Arrial et al. 2009) to find the coding potential of the sequences from the transcriptome likeso:

    portrait-1.1.pl \
    -i <TRANSCRIPTOME.FA> \

# INPUT: transcriptome in fasta format.
# OUTPUT: list of coding potential of each sequence from the transcriptome.