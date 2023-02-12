#!/usr/bin/bash

# There are several tools that receive paired-end reads in one file, instead of two. In order to deal with it, here are few examples of the many ways to merge files: 

# If you want interleaved paired-end (PE) reads in one file, 
# run this script from BBtools (Bushnell 2018)
# likeso:

	reformat.sh \
	in1=<FORWARD_READS> \
	in2=<REVERSE_READS> \
	out=<MERGED_FILE> \

# or run this from SortMeRNA (K.shlova et al. 2012) likeso:

	merge-paired-reads.sh <FORWARD_READS> <REVERSE_READS> 
	<MERGED_FILE>

# INPUT: PE reads in separated files.
# OUTPUT: one fasta file containing both  interleaved PE reads.
#
# However, please bear in mind that if you have not only PE reads but single-end (SE) as well, before merging PE files, you should concatenate SE reads to the end of their corresponding PE reads, according to their orientation. For example:
#	cat <FORWARD_READS> <SE_READS> > <MERGED_READS>

# INPUT: PE reads and SE reads.
# OUTPUT: one fasta file containing PE plus SE reads.
# In the aforementioned example, my SE reads had the same orientation of the PE forward reads. You can use tools like salmon (Patro et al. 2017) to find out reads's orientation.