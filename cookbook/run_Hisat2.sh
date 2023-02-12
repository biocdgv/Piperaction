#!/usr/bin/bash

# run Hisat2 (Kim et al. 2015) for splice-aware reads alignment likeso:

# at first glance, you should create an index with the reference genome:

    hisat2-build \
    <reference_in> <REFERENCE> \
    <ht2_base> <BASE_FILE_NAME> \
    -f <FOR_FASTA_FILES> \

# INPUT: Reference to be indexed in fasta format.
# OUTPUT: Genome index to be used as <INDEX_BASENAME>.

# then, you can now do some alignments:

    hisat2 \
    -x <HISAT2_INDEX> \
    -q <SPECIFY_FASTQ_FILES>  \
    -1 <FORWARD_READS>  \
    -2 <REVERSE_READS>  \
    -U <SINGLE_READS>  \
    --summary-file <ALIGNMENT_STATISTICS>  \
    -p <NUMBER_PROCESSORS>  \
    -S <PATH_TO_SAM_ALIGNMENT>  \

# INPUT: Genome index and clean reads.
# OUTPUT: Alignment statistics and SAM file.

# Note: you should convert and sort this sam file into a coordinated bam file, in order to do some other tasks such as genome guided assembly with Trinity (Grabherr et al. 2011). This conversion can be done by samtools (Li et al. 2009), like shown in run_samtools.sh.

# Highlights:
# if you are trying to get mapped and unmapped reads in different files, you can do it likeso:

    hisat2 \
    -x <HISAT2_index> \
    -q <SPECIFY_FASTQ_FILES>  \
    -1 <FORWARD_READS>  \
    -2 <REVERSE_READS>  \
    -U <SINGLE_READS>  \
    --al <PATH_ALIGNED_SE> \
    --un-conc <PATH_FAILED_CONCORDANTLY_PE> \
    --al-conc <PATH_ALIGNED_CONCORDANTLY_P> \
    --summary-file <ALIGNMENT_STATISTICS>  \
    -p <NUMBER_PROCESSORS>  \

# INPUT: reference to be mapped and clean reads.
# OUTPUT: mapped and unmapped reads in different files.