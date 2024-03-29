#!/usr/bin/bash
# coding: utf-8

# 
# run junction_saturation.sh from the RSeQC package (Wang et al. 2012), to make a transcript saturation curve in order to find how much sequencing do you need to have new isoforms:
# 
#     junction_saturation.sh \
#     -i <BAM_FILE> \
#     -r <BED_FILE> \
#     -o  <OUTPUT_FILE> \
#   
#      -i <BAM_FILE>, this file can be generated by any aligner of your choice (HISAT2 Kim et al. 2015) , 
#      STAR (Dobin et al. 2013), etc) and samtools (Li et al. 2009).
#   
#      -r <BED_FILE> can be achieved by the next script from gffutils package,by using a reference
#      annotation 
#      (.GTF or .GFF) file 
#      likeso:
#    
#     gtf2bed.pl \
#     <ANNOTATION_FILE> > <BED_FILE>
# 
# INPUT: a BAM, BED and an ANNOTATION FILE.
# OUTPUT: a transcript saturation curve.