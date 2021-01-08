context("read dat file")

test_that("read double numbers with dec .", {
  dat <- thesis.phen.platelets(traits = "PDW")
  
  expect_true(class(dat$PDW) == "numeric")
})

test_that("read groups", {
  dat <- thesis.phen.platelets(group = "platelets")
  
  expect_true(all(thesis.traits.platelets() %in% names(dat)))
})

test_that("read dat file", {
  dat <- thesis.phen.platelets()
  
  expect_true(all(c("ID", "SEX", "AT", "VT", "Throm", "TEC") %in% names(dat)))
  
 	expect_true(sum(is.na(dat$SEX)) == 0)
})

test_that("read that file", {
  dat <- thesis.norm.platelets()
  
  expect_true(all(c("NORPT", "ID") %in% names(dat)))
  
  expect_true(nrow(dat) == 804)
	expect_true(sum(is.na(dat$IPFCT)) == 86)
	expect_true(sum(is.na(dat$PFAepin)) == 34)
})
