#!/bin/bash 

echo
echo '1 input sam; 2 output directory '
echo


#2. Calculate align files:
sam_2_align_bin genome_table=$1 input_sam_file=$2 analysis_path=$3

#Note:hg19.gt is provided with the distribution. You can use QuEST software to generate genome tables for other genomes.

#3. Estimate MNase-Seq library fragment size
dist_plots analysis_path=$3

#4. Calculate dyads from MNase-seq reads
align_2_dyads analysis_path=$3

#5. Calculate stringency plots
dyad_stringency analysis_path=$3

#6. Call dyads
call_dyads analysis_path=$3 output_path=./$3/dyad_calls/




#7. Match dyads between two experiments
#match_dyads called_dyads_file1=./$2/dyad_calls/$3 called_dyads_file2=././MNase_seq_analysis2/dyad_calls/ match_dist=30 genome_table=bsgenome_tair9.chrNames.txt output_path=./dyad_matching

#8. Calculate nucleosome binding differences at a set of genomic sites
#diff_summaries_at_sites called_dyads_file1=./dyad_matching/dyad_matches unmatched_file1=./dyad_matching/unmatched_dyads1 unmatched_file2=./dyad_matching/unmatched_dyads2 positions_file=sites.txt genome_table=hg19.gt output_file=sites.nucl_diff dist=5000


