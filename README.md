# MNase-seq analysis for Choi et al.
bash and R code for MNase-seq analysis performed in Choi et al. (2018)

numap.sh:

	wrapper of numap scripts, as provided at http://www-hsc.usc.edu/~valouev/NuMap/README.txt



calculate_NRL.R:

	generates a table of NRL estimates from the linear regression fit of the distances between dyad peaks generated in with numap


plot_linear_fit.R:
	
	to visualize the regression line used in calculating the NRL
	

plot_phasogram.R

	plot the histogram of dyad-to-dyad distances as a smoothed line
