```r
### load 'devtools' packages
	library(devtools)


### load package
	load_all('~/my_git/myphd_ddbb/')


### load 'data'
	dat <- myphd_ddbb.phen()

	### list of objects
		l_vars <- myphd_ddbb.traits.platelets()[['original_tr']]
		l_covlist <- myphd_ddbb.covlist_plt.norm()
		all_specs <- c('gr', 'sex', 'gr_sex')		
		l_emmeans <- myphd_ddbb.specs_plt.norm()


### 'l_mods' & 'l_emmeans'
	l_mods <- myphd_ddbb.l_mods.norm(
		df_mods = dat[[1]],
		df_kinship = dat[[2]],
		vars = l_vars,
		covlist_mods = l_covlist,
		all_specs = all_specs,
		covlist_specs = l_emmeans)

``` 
