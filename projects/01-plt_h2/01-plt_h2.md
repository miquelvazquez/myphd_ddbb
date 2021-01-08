# Complete h2 results on platelets in GAIT 2 Study
Miquel Vàzquez-Santiago  
`r Sys.Date()`  




# Library





# Load data


```r
dat <- thesis.phen.platelets (group = "platelets")

# vector of variables
vars <- sort(names(dat)[27:41])
	
	# numerical
	dat[, vars] <- lapply(dat[, vars], as.numeric)

# data.frame of vars
plt <- dat[, c(27:41)]
```
# Distribution


```r
# bucle
for(i in seq_along(vars)){
	
	# plots
	dens <- thesis.plot.dens(dat, vars)	
	qq <- thesis.plot.qq(dat, vars)
}

# arrenge
dens_p <- marrangeGrob(dens, nrow = 3, ncol = 5)
qq_p <- marrangeGrob(qq, nrow = 3, ncol = 5)

# return
dens_p
```

![``gg_dens``](figures/gg_dens.png)

```r
qq_p
```

![``gg_qq``](figures/gg_qq.png)

```r
# ggsave
ggsave(dens_p, file = "gg_dens.png")
ggsave(qq_p, file = "gg_qq.png")
```

# Descriptive
### PTES 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|   80   |    197    |   229    |  237   |    272    |  527   |  231   |

### PTOP 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|   72   |    193    |   226    |  234   |    268    |  481   |  299   |

### VPMES 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|  6.3   |    9.9    |   10.5   |  10.5  |   11.2    |  14.1  |  234   |

### PCTES 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|  0.09  |   0.21    |   0.24   | 0.251  |   0.28    |  0.55  |  234   |

### PDW 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|  8.7   |   11.7    |   12.7   |  12.9  |   13.9    |  22.1  |  238   |

### PTG 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|  11.8  |   25.4    |   30.1   |  30.4  |   35.3    |  57.1  |  283   |

### PT40 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|   90   |    198    |   233    |  243   |    279    |  572   |  272   |

### VPM40 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|  8.4   |   11.3    |   12.1   |  12.4  |   13.2    |  18.9  |  272   |

### PCT40 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
| 0.121  |   0.247   |  0.279   |  8.07  |   0.337   |  594   |  272   |

### IPFCT 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|  0.4   |     2     |   2.8    |  3.26  |     4     |   19   |  326   |

### IPFAB 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|  1.3   |    4.7    |   6.6    |  7.13  |    8.9    |  41.3  |  326   |

### HIPFCT 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|  0.1   |    0.5    |   0.8    |   1    |    1.2    |  11.9  |  326   |

### IPFX 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|  12.9  |   16.6    |   17.7   |   18   |   19.1    |  28.9  |  326   |

### PFAadp 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|   48   |    74     |    83    |  86.9  |    97     |  300   |  263   |

### PFAepin 


|  Min.  |  1st Qu.  |  Median  |  Mean  |  3rd Qu.  |  Max.  |  NA's  |
|:------:|:---------:|:--------:|:------:|:---------:|:------:|:------:|
|   49   |    100    |   114    |  120   |    133    |  297   |  267   |

# Heredability

|  &nbsp;  |  trait  |  Var  |   SE   |   pval   |   cov   |  lower.SE  |  upper.SE  |
|:--------:|:-------:|:-----:|:------:|:--------:|:-------:|:----------:|:----------:|
|  **13**  |  IPFX   | 0.654 | 0.0706 | 2.77e-17 | 0.0605  |   0.583    |   0.725    |
|  **10**  |  IPFCT  | 0.639 | 0.0703 | 8.63e-18 |  0.106  |   0.569    |   0.709    |
|  **8**   |  VPM40  | 0.629 | 0.0618 | 6.1e-28  |  0.01   |   0.568    |   0.691    |
|  **11**  |  IPFAB  | 0.629 | 0.0691 | 2.97e-17 | 0.0517  |    0.56    |   0.698    |
|  **5**   |   PDW   | 0.623 | 0.0559 | 1.15e-29 | 0.0771  |   0.567    |   0.679    |
|  **6**   |   PTG   | 0.621 | 0.0629 | 1.06e-21 | 0.0779  |   0.558    |   0.684    |
|  **12**  | HIPFCT  | 0.589 | 0.0625 | 3.57e-25 |  0.105  |   0.527    |   0.652    |
|  **3**   |  VPMES  | 0.505 | 0.0625 | 6.23e-20 | 0.0531  |   0.443    |   0.568    |
|  **2**   |  PTOP   | 0.436 | 0.0721 | 1.72e-11 |  0.16   |   0.364    |   0.508    |
|  **15**  | PFAepin | 0.43  | 0.0756 | 1.65e-10 | 0.00346 |   0.354    |   0.506    |
|  **14**  | PFAadp  | 0.43  | 0.069  | 2.34e-12 | 0.00467 |   0.361    |   0.499    |
|  **1**   |  PTES   | 0.418 | 0.0716 | 7.12e-11 |  0.162  |   0.346    |   0.489    |
|  **7**   |  PT40   | 0.416 | 0.0657 | 4.91e-13 |  0.179  |    0.35    |   0.481    |
|  **4**   |  PCTES  | 0.41  | 0.0725 | 6.34e-10 |  0.132  |   0.337    |   0.482    |
|  **9**   |  PCT40  | 0.196 | 0.0718 | 0.00082  | 0.0333  |   0.124    |   0.268    |

# Plotting h2

```r
# fix sort
tab_mod$trait <- factor(tab_mod$trait, levels = tab_mod$trait[order(tab_mod$Var)])

# plot
h2_p <- ggplot(tab_mod, aes(x = trait, y = Var)) + 
                        geom_point(aes(trait)) +
												geom_pointrange(aes(ymin = lower.SE, ymax = upper.SE)) +
                        coord_flip()


h2_classic <- ggplot(tab_mod, aes(x = trait, y = Var)) + 
							 			geom_bar(position = 'dodge', stat = 'identity') +
							 			geom_errorbar(aes(ymin = lower.SE, ymax = upper.SE), width =.2, position = "identity") +
							 			coord_flip()

# return
h2_p
```

![``gg_h2``](figures/gg_h2.png)

```r
# ggsave
ggsave(h2_p, file = "gg_h2.png")
ggsave(h2_classic, file = "gg_h2_c.png")
```
											   
