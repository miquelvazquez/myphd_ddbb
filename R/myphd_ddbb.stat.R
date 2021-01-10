#--------------------------------------------
# Normal models 'relmatLmer()' & 'emmeans()'
#--------------------------------------------

#' @export
myphd_ddbb.l_mods.norm <- function(
	df_mods,
	df_kinship,
	vars,
	covlist_mods,
	# covlist_emmeans,
	stat = c('base', 'lme4qtl', 'car', 'emmeans'))
{
### arg
 	stat <- match.arg(stat, c('base', 'lme4qtl', 'car' ,'emmeans'))


### transform 'data'
	df_1 <- df_mods %>% 
		gather(trait, value, all_of(vars)) %>% 
		group_by(trait) %>%
		group_nest()


### force 'sort()'
	df_1 <- df_1[order(factor(df_1[['trait']], levels = unique(vars))), ]


### compute models
	df_1 <- df_1 %>%
		mutate(
			l_form = map2(trait, covlist_mods, 
				~ paste0( 'value ~ ', paste0(.y, collapse = ' + '), ' + ', paste0('(1 | ID)'))),
			l_mods = map2(data, l_form,
        ~ try(relmatLmer(
						formula = as.formula(.y),
						data = .x,
						relmat = list(ID = df_kinship),
						control = lmerControl(
							check.nobs.vs.nlev = 'ignore',
	  					check.nobs.vs.nRE = 'ignore',
							check.nobs.vs.rankZ = 'ignore'),
						REML = FALSE))),
			aov_mods = map(l_mods,
				~ try(Anova(.x, type = 'II', test.statistic = 'Chisq'))))


### compute 'emmeans'


### return
	return(df_1)

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
