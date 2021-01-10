#--------------------------------------------
# Normal models 'relmatLmer()' & 'emmeans()'
#--------------------------------------------

#' @export
myphd_ddbb.l_mods.norm <- function(
	df_mods,
	df_kinship,
	vars,
	covlist_mods,
	all_specs,
	covlist_specs,
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
				~ try(Anova(
						mod = .x, 
						type = 'II',
test.statistic = 'Chisq'))))


### double check #01
	l_allspecs <- head(l_vars, 4)
	l_anyspecs <- tail(l_vars, 11)
	
	stopifnot(head(df_1[['trait']], 4) %in% l_allspecs)


### compute 'emmeans'
	df_head <- df_1 %>%
		slice_head(n = length(l_allspecs)) %>%
		slice(rep(1:n(), each = length(all_specs)))

	df_tail <- df_1 %>%
		slice_tail(n = length(l_anyspecs))


	df_2 <- bind_rows(df_head, df_tail) %>%
		mutate(
			l_spec = map(covlist_specs, ~ paste0(.x)),
			est_means = map2(l_mods, l_spec,
				~ try(emmeans(
						object = .x,
						specs = .y))),
			diff_means = map(est_means,
				~ try(contrast(
						object = .x,
						method = 'pairwise',
						adjust = 'bonferroni'))))
						

### return
	return(df_2)

}
