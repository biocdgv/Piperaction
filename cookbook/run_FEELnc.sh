#!/usr/bin/bash

	FEELnc_filter.pl  FEELnc_filter.pl -i <transcripts> -a <reference_genome_annotation> -b transcript_biotype=protein_coding  > candidate_lncRNA.gtf

	FEELnc_codpot.pl FEELnc_codpot.pl -i candidate_lncRNA.gtf -a <coding_sequences_reference_genomes> -l <model_non_coding_rnas> --outdir <out_dir> -g <reference_genome> -n 350,350 

	FEELnc_classifier.pl FEELnc_classifier.pl -i <output/candidate lncRNA.gtf> -a <output/mRNA_sequences> -w 100  > lncClases.txt 

# To search function of the noncoding rnas within GFF files:

	gffread abyss-96.gff -g <reference_genome.fasta> -x <coding_sequence> -W -y <protein_sequences>