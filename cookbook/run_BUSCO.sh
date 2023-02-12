#!/usr/bin/bash

# run BUSCO (Simão et al. 2015) to assess assembly's quality:

    run_BUSCO.sh  \
    --in <ASSEMBLY.FASTA> \
    --lineage_path <LINEAGE_DATABASE> \
    --mode <ACTION_MODE> \ 
    --out <OUTPUT_FILE> \

# parameters --lineage_path and --mode, are the database of your organism of interest and the mode of    
# action (tran for transcriptome, geno for genome and prot for protein), respectively.

# to make some useful figures run BUSCO likeso:

    generate_plot.sh \
    -wd <Plotting_Directory> \

# INPUT: Assembly in fasta format.
# OUTPUT: Several quality metrics of your assembly.