#--------------------------------
# Data tables of phen/ped
#--------------------------------

#' @export
myphd_ddbb.phen <- function(dir)
{
 ### argument to 'setwd()'
  if(missing(dir)) {
    dir <- myphd_ddbb.phendir()
  }
  stopifnot(file.exists(dir))


### argument to 'library()'
	myphd_ddbb.required_packages(
		locale = 'es_ES.UTF-8',
		update_packages = FALSE)
 

### list files
	l_files <- myphd_ddbb.phen.load_dt_block(
    home_dir = dir,
    pattern = 'RData')
 

### list files
	if(endsWith(l_files[[1]], 'RData') == TRUE) {

		load(l_files[['platelet_norm']])


			### names()
				l_dat <- list(dat, K)
				
				names(l_dat) <- c('platelet_norm', 'K_matrix') 

			### return
  			return(l_dat)
	
	} else {

	dat <- myphd_ddbb.phen.load_dt_block(
    home_dir = dir)


		### return
  		return(dat)
	}

}

#----------------
# Get normal data
#----------------

#' @export
thesis.norm.platelets <- function(dir)
{
	# read phen	(traits, covariables & set)
	load("~/Datasets/GAIT_2/set.RData")
			# subset phens
			phens <- myphd_ddbb.traits.platelets()
	
	# read normal data
  dat_norm <- read.csv("~/Datasets/GAIT_2/datnorm.csv")
	
	# phen	
	dat <- subset(set@sampleInfo, select = c(phens, "AGE", "SEX",
								"contraception", "smoking"))
	dat$ID <- rownames(dat)
	stopifnot(all(dat_norm$ID %in% dat$ID))
	
		### update variables (gr, AGEc)
		dat <- mutate(dat,
						gr = ifelse(AGE < 13, 1, 
		  					 ifelse(AGE < 19, 2, 
		  					 ifelse(AGE < 65, 3, 
		  					 ifelse(AGE < 102, 4, stop())))))

		dat <- mutate(dat,
					 AGEc = ifelse(AGE < 13, AGE - 13/2, 
									ifelse(AGE < 19, AGE - (13 + 19)/2,
									ifelse(AGE < 65, AGE - (65 + 19)/2, 
									ifelse(AGE < 102, AGE - (102 + 65)/2, stop())))))

	dat <- within(dat, {
  			 gr <- factor(gr)
     		 gr <- relevel(gr, ref = 3)
 	})
  
	dat <- within(dat, {
  			 SEX <- factor(SEX)
  			 SEX <- relevel(SEX, ref = "M")
	})

	### join
  dat <- left_join(dat, dat_norm, by = "ID")
	
	### datacleaning IPF
	ind1 <- which(dat$IPFCT > 14)
		dat$IPFCT[ind1] <- NA
		dat$IPFAB[ind1] <- NA
		dat$HIPFCT[ind1] <- NA
		dat$IPFX[ind1] <- NA

	# datacleaning PFA
	ind2 <- which(dat$PFAadp > 200)
		dat$PFAadp[ind2] <- NA
	
	ind3 <- which(dat$PFAepin > 280)
		dat$PFAepin[ind3] <- NA

	### rename variables
	dat <- rename(dat, c(contraception = "con", smoking = "smk", AGE = "age", AGEc = "age_c", SEX = "sex"))

	### subset data == 804 (healthy)	
	dat <- subset(dat, NORPT == "NOR")
	stopifnot(nrow(dat) == 804)
  
	### return
  return(dat)
}


#------------
# IDs/alerts
#------------

#' @export
thesis.id.alert <- function()
{
  c("32210", # Extracción muy larga
    "34310", # Embarazada de 3 semanas
    "38203", # Plasma hemolizado; extracción larga
    "38312", # HBPM (added by Marina)
    "39309", # Extracción larga
    "42204", # HBPM en las últimas 24h
    "43214", # Hepatopatía crónica
    "45210", # HBPM en las últimas 24h
    "47312", # HBPM y fase aguda de trombosis
    "49201", # HBPM
    "52116", # Hepatopatía crónica
    "52314", # Embarazada de 7 semanas
    "54209", # Hepatopatía crónica
    "54308", # TVP el mismo día del estudio (fase aguda)
    "55313", # Sintrom
    "64205", # Sintrom
    "66102", # Sintrom
    "67201"  # Sintrom
  )
}

