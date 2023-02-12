#!/usr/bin/bash

# run IDBA-tran (Peng et al. 2013) to *de novo* assembly of transcripts:

    idba_tran \
    -r <MERGED_READS> \
    -o <OUTPUT_DIRECTORY> \

# INPUT: Clean reads.
# OUTPUT: *de novo* assembled transcripts with different k-mer lengths.