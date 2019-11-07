#!/usr/bin/env python
# coding: utf-8

# 
# run concatenator.pl (Cerveau y Jackson 2016) to concatenate several assemblies in order to improve their quality: 
#        
#     perl concatenator.pl \
#     -i <ASSEMBLIES_FOLDER> \
#     -w <OUTPUT_FOLDER> \
#     -aS <Min_Cov_aS> \
#     -Cd <CD-HIT-EST_PATH> \
#     -Tr <TRANSDECODER_PATH> \
#     
# As an output, you should get a combined assembly, that should be checked for transcript redundancy as well, because perhaps the assemblers assembly the same transcript. To check this out, run CD-HIT-EST (Fu et al. 2012) likeso:
# 
#     cd-hit-est \
#     -i <COMBINED_ASSEMBLY> \
#     -o <OUTPUT_FILE> \
#     -aL <Min_Cov_LS> \
#     -aS <Min_Cov_aS> \
#     -o <OUTPUT_FILE_NAME> \
#     -c <SEQ_IDENTITY_THRESHOLD> \
#     
#    parameters -aL and -aS mean minimal coverage ratio of the longest and shortest sequence, respectively.
#     
# INPUT: 2 or more assemblies.
# OUPUT: One non-redundant assembly.
