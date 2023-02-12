#!/usr/bin/bash

# run rnaQuast (Bushmanova et al. 2016) in order to analyze transcriptomes's quality likeso:

    rnaQuast.sh \
    --transcripts <TRANSCRIPTOMES.FASTA> \
    --busco_lineage <BUSCO_DATABASE_OF_INTEREST> \
    --o <OUTPUT_DIRECTORY> \

# INPUT: Several transcriptomes in fasta format.
# OUTPUT: different quality metrics from the transcriptomes.