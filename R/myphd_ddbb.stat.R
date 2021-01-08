#---------------------
# Normal models `lmer`
#---------------------

#' @export
myphd_ddbb.mod.norm <- function(
	df_mod,
	kinship_mod,
	vars,
	covlist, 
	stat = c('base', 'lme4qtl'))
{
### arg
 	stat <- match.arg(stat, c('base', 'lme4qtl'))
 	 

### compute models
  sapply(vars, function(x) {
		f <- formula(paste(x, ' ~ ', paste(covlist, collapse = '+'), '+', paste('(1|ID)')))
    
		l_mod <- relmatLmer(
			f, 
			df_mod, 
			relmat = list (ID = kinship_mod), 
			REML = FALSE)
		})
}

#---------------------
# Normal steps `lmer`
#---------------------

#' @export
thesis.step.norm <- function(phen, models, stat = c('base', 'lmer', 'lmerTest'))
{
  ### arg
  stat <- match.arg(stat, c('base', 'lmer', 'lmerTest'))

  ### compute models
  lapply(models, function(x) {				
				lstep <- step(as(as(x, 'merMod'), 'merModLmerTest'), reduce.fixed = F, reduce.random = F)

	### extract elements
	call <- print(data.frame(lstep$model))
	fixed <- print(data.frame(summary(lmod)$coefficients))
	mean <- print(data.frame(lstep$lsmeans.table))
	stim <- print(data.frame(lstep$diffs.lsmeans.table))
	})
}
