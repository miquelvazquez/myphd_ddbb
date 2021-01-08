# theme_set
theme_set(theme_light())

# Libraries
library(ggplot)
library(RColorBrewer)

# Data h2 original
traits <- c("PLT", "MPV", "PCT", "PDW", "P_LCR", "IPF%", "IPF#", "HIPF%", "IPF_X", "PFAadp", "PFAepin")
h2r <- c(0.41, 0.50, 0.42, 0.65, 0.64, 0.65, 0.67, 0.59, 0.69, 0.45, 0.52)
se <- c(0.062, 0.063, 0.063, 0.055, 0.056, 0.060, 0.060, 0.064, 0.057, 0.062, 0.067)
cov <- c(0.16, 0.06, 0.13, 0.08, 0.08, 0.10, 0.05, 0.10, 0.05, 0.010, 0.001)
	
# data.frame
dat <- data.frame(traits, h2r, se, cov)
	
# variables
dat <- mutate( dat,
	lower.se = (h2r - se),
	upper.se = (h2r + se))

# Order
dat <- as.data.frame(dat[order(-dat$h2r), ])

# Plot h2
	# fix sort
	dat$traits <- factor(dat$traits, levels = dat$traits[order(dat$h2r)])

# plot
h2_original <- ggplot(dat, aes(x = traits, y = h2r)) + 
                    	geom_point(aes(traits)) +
											geom_pointrange(aes(ymin = lower.se, ymax = upper.se)) +
										  stat_sum_single(cov) +
                    	coord_flip()

# ggsave
ggsave(h2_original, file = "gg_h2_original.png")
