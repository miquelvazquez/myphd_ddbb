# ------------------------------------------------------
# general setups for 'myphd_ddbb.phen.R' files
# load data from 'myphd_ddbb.phendir()'
# load R packages from 'myphd_ddbb.required_packages()'
#-------------------------------------------------------



# load directories------------------------------------------------------------------------


#' @export
myphd_ddbb.phendir <- function()
{

  nodename <- Sys.info()[["nodename"]]
  
  switch(nodename,
  		'DESKTOP-6P8VLTV' = '~/my_git/myphd_ddbb/data',

  stop(paste("`nodemname` (", nodename, ") is unknown")))

}


### load packages-------------------------------------------------------------------------


#' @export
myphd_ddbb.required_packages <- function(
	locale = 'es_ES.UTF-8',
	update_packages = FALSE)
{
### 'locale()' argument
  options(datatable.fread.dec.locale = locale)	## alert to 'locale()' config!!

### repositories
	local({r <- getOption('repos')
  	r['CRAN'] <- 'https://cloud.r-project.org/'
    options(repos = r)})

### funtion to auto_load
	auto_load <- function(a.package){
		 suppressWarnings(suppressPackageStartupMessages(
   	 library(a.package, character.only = T)))
	}

### list of packages
	pacman::p_load(
    tidyverse, lubridate, data.table, testthat, assertthat,
		plyr, Hmisc, reshape, viridis, scales, magrittr, gtools,
    gridExtra, rmarkdown, knitr, prettydoc, DT, car, broom,
    tidyr, stringr, emmeans, lmerTest, lme4qtl,
    janitor, numbers, rlist, bit64,
    install = TRUE,
    update = update_packages)


### option screen 'width'
	if(R.Version()$os == 'linux-gnu') {
	 	options(width = 150)
  }


### rm funtions 'R.profile'
	rm(list = ls(all = TRUE))
}
