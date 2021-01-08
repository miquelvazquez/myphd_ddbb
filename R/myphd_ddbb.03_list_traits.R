#-------------------------------------
# Traits names by biological function
#-------------------------------------

#' @export
myphd_ddbb.traits.platelets <- function()
{
### original traits
  ori_tr <- c(
		'PTES', 'PTOP', 'VPMES', 'PCTES', 'PDW', 'PTG', 'PT40', 'VPM40',  'PCT40',
    'IPFCT', 'IPFAB', 'HIPFCT', 'IPFX', 'PFAadp', 'PFAepin')


### list
	l_tr <- list(
    original_tr = ori_tr)


### return
	return(l_tr)
}

