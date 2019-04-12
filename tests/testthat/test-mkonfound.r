context("Checking mkonfound")

library(mice)
library(lme4)

testmod1 <- lm(teachpop ~ texp + sex, data=popmis)
popmis <- popmis[1:100, ]
testmod2 <- lmer(teachpop ~ texp + sex + (1| school), data=popmis)

output1 <- konfound(testmod1, texp, test_all=TRUE, to_return = "raw_output")
output2 <- konfound(testmod2, texp, test_all=TRUE, to_return = "raw_output")

test_that("mkonfound works for lm and lmer outout", {
    expect_is(output1, "data.frame")
    expect_is(output2, "data.frame")
})