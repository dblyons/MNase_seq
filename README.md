# MNase-seq analysis for Choi et al.
<h4>bash and R code for MNase-seq analysis performed in Choi et al. (2018)  
<br/>  
<br/>

numap.sh is just a wrapper of initial numap scripts as provided at http://www-hsc.usc.edu/~valouev/NuMap/README.txt
<br/>
to generate phasograms from wrapper output above, one can use:

	for i in ./*bg; do phasogram_of_sites positions_file=./$i output_file=./$i.phaso max_dist=3000 & done
	
then estimate peaks on phasogram output:

	for i in ./*phaso; do estimate_peaks dist_file=./$i output_file=./${i%%}.phasogram.smoothed bw=30 field=1 & done

then import into R with the following scripts:
<br/>

calculate_NRL.R:    <br/>generates a table of NRL estimates from the linear regression fit of the distances between dyad peaks generated in with numap


plot_linear_fit.R:  <br/>to visualize the regression line used in calculating the NRL
	

plot_phasogram.R:  <br/>plot the histogram of dyad-to-dyad distances as a smoothed line
