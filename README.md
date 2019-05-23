# MNase-seq analysis for Choi et al.
<h3>bash and R code for MNase-seq analysis performed in Choi et al. (2019)  </h3>
<br/>
isolate mapped mononucleosomal-sized fragments
<br/>

<br/>
then run  <h4>numap.sh</h4> <br/>which is a wrapper of initial numap scripts as provided at <br/> http://www-hsc.usc.edu/~valouev/NuMap/README.txt<br/>
<br/>

then run the following to remove non-nuclear genome data:<br/>

	
	 perl -wnl -e '/^\d/ and print;' dyad_positions.txt  >  dyad_pos_<uniqueIdentifier>.bg
	
then put them all together in a single directory and run:

	for i in ./*bg; do phasogram_of_sites positions_file=./$i output_file=./$i.phaso max_dist=3000 ; done
	
then estimate peaks on phasogram output:

	for i in ./*phaso; do estimate_peaks dist_file=./$i output_file=./${i%%}.phasogram.smoothed bw=30 field=1 ; done

then import into R and do these analyses with the following scripts:
<br/>

<h4>calculate_NRL.R:</h4>  generates a table of NRL estimates from the linear regression fit of the distances between dyad peaks generated in with numap

<h4>plot_linear_fit.R:</h4>  to visualize the regression line used in calculating the NRL

<h4>plot_phasogram.R:</h4>  plot the histogram of dyad-to-dyad distances as a smoothed line
