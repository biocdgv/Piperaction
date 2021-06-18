#!/usr/bin/env python
# coding: utf-8

# ! conda activate <ACTIVATE_CONDA_ENVIRONMENT>
# 
# Note: if you have paired-end (PE) and single-end reads (SE), you should merge first, those SE reads into their respective PE reads, by knowing their orientation, and then run Trinity likeso. 
# Hint: you can take a look on the script merging_files to do this task. 
# 
# Run Trinity (Grabherr et al. 2011) for *de novo* transcripts assembly:
# 
#     Trinity \
#     --seqType <SEQUENCING_TYPE> \
#     --max_memory <MAXIMUM_MEMORY> \
#     --left <FORWARD_READS> \
#     --right <REVERSE_READS> \
#     --CPU <NUMBER_OF_CORES> \
#     --output <OUTPUT_DIR> \
#   
# INPUT: clean paired-end reads
# OUTPUT: *de novo* assembly
