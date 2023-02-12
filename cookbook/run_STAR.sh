#!/usr/bin/bash
# coding: utf-8

# ! conda activate
# 
# run STAR (Dobin et al. 2013) for reads alignment likeso:
# 
# at first glance, you should create an index with the reference genome:
# 
#     STAR \
#     --runThreadN <NUMBER_THREADS> \
#     --runMode <STAR_JOB> \
#     --genomeDir <OUTPUT_DIRECTORY> \
#     --genomeFastaFiles <REFERENCE_GENOME> \
#     --sjdbGTFfile <ANNOTATED_TRANSCRIPTS_GTF> \
#     --sjdbGTFfeatureExon <NAME_3RD_COLUMN> \
# 
#     --sjdbGTFfeatureExon is the name in the 3rd column of the GTF file that will be look up by the STAR 
#     aligner. It's EXON by default, but you should be aware that this name can change, for example for CDS.
# 
# INPUT: Reference genome in fasta format and annotation file in GTF format (OPTIONAL).
# OUTPUT: Genome index to be used as <INDEX_DIRECTORY>.
# 
# In order to map the reads to the genome index with STAR, you should notice that this software only accepts one type of library,paired-end or single-end. So, if this is your case, you should run the alignments separately and then merge them likeso:
# 
#     for PE:
#     STAR \
#     --runMode <STAR_JOB> \
#     --runThreadN <NUMBER_THREADS> \
#     --genomeDir <INDEX_DIRECTORY> \
#     --readFilesIn <FORWARD_READS> <REVERSE_READS> \
#     --outFileNamePrefix <OUTPUT_PATH> \
# 
#     for SE:
#     STAR \
#     --runMode <STAR_JOB> \
#     --runThreadN <NUMBER_THREADS> \
#     --genomeDir <INDEX_DIRECTORY> \
#     --readFilesIn <SE_READS> \
#     --outFileNamePrefix <OUTPUT_PATH> \
# 
# 
# INPUT: Genome index and clean reads.
# OUTPUT: Alignment statistics and SAM file.
# 
# Note: you should convert and sort this sam file into a coordinated bam file, in order to do some other tasks such as genome guided assembly with Trinity (Grabherr et al. 2011). This conversion can be done by samtools (Li et al. 2009), like shown in run_samtools.sh.