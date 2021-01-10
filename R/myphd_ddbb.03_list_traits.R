#-------------------------------------
# Traits names by biological function
#-------------------------------------

#' @export
myphd_ddbb.traits.platelets <- function()
{
### original traits
  ori_tr <- c(
		'PTES', 'PTOP', 'PT40', 'PCTES', 'VPMES', 'VPM40', 'PCT40', 'PDW', 'PTG',
    'IPFCT', 'HIPFCT', 'IPFAB',  'IPFX', 'PFAadp', 'PFAepin')


### list
	l_tr <- list(
    original_tr = ori_tr)


### return
	return(l_tr)
}

