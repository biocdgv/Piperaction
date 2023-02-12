#!/usr/bin/bash

# Run FastQC (Andrews 2010) to analyze your reads's quality:

    fastqc \
    <FORWARD_READS> <REVERSE_READS> <SINGLE-END_READS> \

# INPUT: reads to be analyzed.
# OUTPUT: several graphical quality metrics.