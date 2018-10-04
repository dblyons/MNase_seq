# MNase_seq
bash and R code for MNase-seq analysis performed in Choi et al. (2018)

#wrapper of numap scripts = "numap.sh" as provided at http://www-hsc.usc.edu/~valouev/NuMap/README.txt

#!/bin/bash 
#genome table = $1
#sam file = $2 
#analysis path = $3

#1. input 120 to 180 bp MNase fragments from Lyons and Zilberman (2017) 

#2. Calculate align files:
sam_2_align_bin genome_table=$1 input_sam_file=$2 analysis_path=$3

#3. Estimate MNase-Seq library fragment size
dist_plots analysis_path=$3

#4. Calculate dyads from MNase-seq reads
align_2_dyads analysis_path=$3

#5. Calculate stringency plots
dyad_stringency analysis_path=$3

#6. Call dyads
call_dyads analysis_path=$3 output_path=./$3/dyad_calls/


