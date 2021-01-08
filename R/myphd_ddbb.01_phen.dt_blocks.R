#---------------------------------------------------------
# list of files to load managed by 'myphd_ddbb.phen.R'
# to load list of files 'myphd_ddbb.phen.load_dt_block()'
# to read list of files 'myphd_ddbb.phen.read_dt_block()'
#---------------------------------------------------------


### list file to load---------------------------------------------------------------------


myphd_ddbb.phen.load_dt_block <- function(
	home_dir,
	pattern)
{
### 'list.dirs()'
  l_dir <- list.dirs(
  	path = home_dir,
  	recursive = FALSE)


### pattern
	pattern <- paste0('.', pattern)

### 'list.files()'
	l_files <- list()

	for(i in seq_along(l_dir)) {

  	file <- list.files(
  		path = l_dir[i],
  		pattern = pattern,
  		full.names = TRUE,
  		recursive = TRUE)

  	# save in a list
  		l_files[[length(l_files) + 1]] = file
	}


### 'names()'
	names(l_files) <- c(
		 'platelet_norm')


### kept only few elements in the environment
  rm(list = setdiff(ls(), 'l_files'))


### return
	return(l_files)
}


### read several datasets-----------------------------------------------------------------


#' @export
myphd_ddbb.phen.read_dt_block <- function(
  l_files)
{
### list
	l_dt <- list()


	for(i in seq_along(l_files)) {
  	dt <- lapply(
  		l_files[[i]],
  		fread,
  		sep = ';',
  		dec = '.',
  		na.strings = c('', 'NA'))

  	# save in a list
  		l_dt[[length(l_dt) + 1]] = dt
	}


### unlist()
  l_dt <- unlist(l_dt, recursive = FALSE)


### kept only few elements in the environment
  rm(list = setdiff(ls(), 'l_dt'))


### return
	return(l_dt)
}
