#!/usr/bin/bash

# run samtools (Li et al. 2009) to convert a sam file into a coordinated bam file likeso:

    samtools view \
    -bS <SAM_FILE> > <OUTPUT_BAM_FILE> \

    samtools sort \
    <BAM_FILE> \
    -o <COORDINATED_BAM_FILE> \
    -O <TYPE_BAM> \

# INPUT: an alignment SAM file.
# OUTPUT: a coordinated BAM File for downstream analysis.