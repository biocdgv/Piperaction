#!/usr/bin/env python
# coding: utf-8

# ! conda activate <ACTIVATE_CONDA_ENVIRONMENT>
# 
# run SortMeRNA (Kopylova et al. 2012) in order to separate rRNAs reads from those that matter (mRNAs and ncRNAs):
# 
# at first, you should create an index with the rRNA databases likeso:
# 
#     indexdb_rna \
#     --ref <rRNA_DATABASES> \
#     -v <VERBOSE> \
#         
#     parameter --ref is a comma separated list of rRNA databases in fasta format, like those coming from 
#     the SILVA database.
# 
# INPUT: rRNA databases.
# OUTPUT: Databases index.
# 
# then you can run the mapping step likeso:
# 
#     For PE:
#     
#     sortmerna \
#     --ref <rRNA_DATABASES_INDEX> \
#     -v <VERBOSE> \
#     --reads <PAIRED-END_READS> \
#     --other <NON_MAPPED_READS_FILE> \
#     --aligned <MAPPED_READS_FILE> \ 
#     --fastx  <FASTA_TYPE_OUTPUT> \
#     --sam <PATH_TO_ALIGNMENT> \
#     --paired_in <PE_READS_TO_ALIGNED> \
#     --log <OVERALL_STATISTICS> \
#     --a <NUMBER_THREADS> \
#     
#     --paired_in means that mapped interleaved paired-end reads will go in --aligned <FILE>. 
#  
#     For SE: 
#     
#     sortmerna \
#     --ref <rRNA_DATABASES_INDEX> \
#     -v <VERBOSE> \
#     --reads <SINGLE-END_READS> \
#     --other <NON_MAPPED_READS_FILE> \
#     --aligned <MAPPED_READS_FILE> \ 
#     --fastx  <FASTA_TYPE_OUTPUT> \
#     --sam <PATH_TO_ALIGNMENT> \
#     --log <OVERALL_STATISTICS> \
#     --a <NUMBER_THREADS> \
#     
# INPUT: Database index and PE or SE reads.
# OUTPUT: Mapped and non-mapped reads to the specific databases.
