#!/usr/bin/env python
# coding: utf-8

# 
# FEELnc_filter.pl  FEELnc_filter.pl -i /home/cristian/Documentos/Purp/data/Final/Cufflinks/transcripts.gtf -a /home/cristian/Documentos/Purp/data/Final/FEEL/Purpureocillium_lilacinum_gca_001653205.ASM165320v1.44.gtf -b transcript_biotype=protein_coding  > candidate_lncRNA.gtf
# 
# 
# %FEELnc_codpot.pl FEELnc_codpot.pl -i S1/candidate_lncRNA.gtf -a /home/cristian/Documentos/Purp/data/Final/FEEL/Purp_codingfirst.fa  -l /home/cristian/Documentos/Purp/data/Final/FEEL/Saccharomyces_cerevisiae.R64-1-1.ncrna.fa --outdir S2/ -g /home/cristian/Documentos/Purp/data/Final/FEEL/Purp-polished-abyss-96.fasta -n 350,350 
# 
# 
# %FEELnc_classifier.pl FEELnc_classifier.pl -i /home/cristian/Documentos/Purp/data/Final/FEEL2/S2/candidate_lncRNA.gtf.lncRNA.gtf -a /home/cristian/Documentos/Purp/data/Final/FEEL2/S2/candidate_lncRNA.gtf.mRNA.gtf -w 100  > lncClases.txt 
# 
# To search function of the noncoding rnas within GFF files:
# 
# gffread abyss-96.gff -g Purp-polished-abyss-96.fasta -x splice_CDS.fa -W -y protein.fa 
# 
