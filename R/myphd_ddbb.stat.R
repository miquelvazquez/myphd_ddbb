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


### update data
	df_1 <- df_mod %>% 
		gather(trait, value, all_of(vars)) %>% 
		group_by(trait) %>% 
		nest()


### compute models
  sapply(vars, function(x) {
		f <- formula(paste(x, ' ~ ', paste0(covlist, collapse = '+'), '+', paste('(1 | ID)')))
    
		mod <- relmatLmer(
			formula = f, 
			data = df_mod, 
			relmat = list (ID = kinship_mod),
			control = lmerControl(
				check.nobs.vs.nlev = 'ignore',
	  		check.nobs.vs.nRE = 'ignore',
				check.nobs.vs.rankZ = 'ignore'),
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
