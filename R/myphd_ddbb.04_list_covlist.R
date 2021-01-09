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
    PTES = c('gr * age_c + gr * sex'), 
		PTOP = c('gr * age_c + gr * sex'), 
		PT40 = c('gr * age_c + gr * sex'), ## lmer failed
		PCTES = c('gr * age_c + gr * sex'), ## lmer failed
		PDW = c('gr * age_c'),
		VPMES = c('gr + gr * age_c'),
		VPM40 = c('gr'), 
		PCT40 = c('gr * age_c'),  ## lmer failed
		PTG = c('gr * age_c'), 
		PFAepin = c('gr'),
		PFAadp = c('gr'), ## lmer failed
		IPFCT = c('gr * age_c'),
		HIPFCT = c('gr'),
		IPFAB = c('gr * age_c'),
		IPFX = c('gr * age_c'))
  

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
