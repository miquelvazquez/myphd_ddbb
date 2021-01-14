#-------------------------------------------------------------------------------
# covlist 'relmatLmer' models
# published list covars for normality ranges by 'myphd_ddbb.covlist_plt.norm()'
#-------------------------------------------------------------------------------



### platelet 'covlist' for normality------------------------------------------------------

#' @export
myphd_ddbb.covlist_plt.norm <- function(traits)
{
  ### pre-defined data
  transf <- list(
    PTES = c('gr * age_c', 'gr * sex'), 
		PTOP = c('gr * age_c', 'gr * sex'), 
		PT40 = c('gr * age_c', 'gr * sex'), ## lmer failed
		PCTES = c('gr * age_c', 'gr * sex'), ## lmer failed
		VPMES = c('gr * age_c'),
		VPM40 = c('gr'), 
		PCT40 = c('gr * age_c'),  ## lmer failed
		PDW = c('gr * age_c'),
		PTG = c('gr * age_c'), 
		IPFCT = c('gr * age_c'),
		HIPFCT = c('gr'),
		IPFAB = c('gr * age_c'),
		IPFX = c('gr * age_c'),
		PFAepin = c('gr'),
		PFAadp = c('gr')) ## lmer failed)
  

### select traits
  if(!missing(traits)) {
    stopifnot(all(traits %in% names(transf)))
    transf <- transf[[traits]]
  
    
		### case of a single trait
    	if(length(traits)) {
      	transf <- unlist(transf)
    }
  }

### return
  return(transf)
}



### platelet 'specs' for normality--------------------------------------------------------

#' @export
myphd_ddbb.specs_plt.norm <- function(traits)
{
  ### pre-defined data
  transf <- list(
		PTES = c('gr'),
		PTES = c('sex'),
    PTES = c('gr', 'sex'),
		PTOP = c('gr'),
		PTOP = c('sex'),			
		PTOP = c('gr', 'sex'),
		PT40 = c('gr'), ## lmer failed
		PT40 = c('sex'), ## lmer failed
		PT40 = c('gr', 'sex'), ## lmer failed
		PCTES = c('gr'), ## lmer failed
		PCTES = c('sex'), ## lmer failed
		PCTES = c('gr', 'sex'), ## lmer failed
		VPMES = c('gr'),
		VPM40 = c('gr'), 
		PCT40 = c('gr'),  ## lmer failed
		PDW = c('gr'),
		PTG = c('gr'), 
		IPFCT = c('gr'),
		HIPFCT = c('gr'),
		IPFAB = c('gr'),
		IPFX = c('gr'),
		PFAepin = c('gr'),
		PFAadp = c('gr')) ## lmer failed
  

### select traits
  if(!missing(traits)) {
    stopifnot(all(traits %in% names(transf)))
    transf <- transf[[traits]]
  
    
		### case of a single trait
    	if(length(traits)) {
      	transf <- unlist(transf)
    }
  }

### return
  return(transf)
}
