## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
collapse = TRUE,
comment = "#>"
)

## ----gh-installation, eval = FALSE--------------------------------------------
#  install.packages("konfound")

## ----eval = TRUE--------------------------------------------------------------
library(konfound)

## -----------------------------------------------------------------------------
pkonfound(2, .4, 100, 3)

## -----------------------------------------------------------------------------
pkonfound(.4, 2, 100, 3)

## -----------------------------------------------------------------------------
pkonfound(est_eff = -2.2,
          std_err = .65, 
          n_obs = 200,
          n_covariates = 3)

## -----------------------------------------------------------------------------
pkonfound(.4, 2, 100, 3, to_return = "thresh_plot")

## -----------------------------------------------------------------------------
pkonfound(.4, 2, 100, 3, to_return = "corr_plot")

## -----------------------------------------------------------------------------
pkonfound(.4, 2, 100, 3, to_return = "raw_output")

## -----------------------------------------------------------------------------
# pkonfound(a = 35, b = 17, c = 17, d = 38)

## -----------------------------------------------------------------------------
# my_table <- tibble::tribble(
# ~unsuccess, ~success,
# 35,         17,
# 17,         38,
# )
# 
# pkonfound(two_by_two_table = my_table)

## -----------------------------------------------------------------------------
m1 <- lm(mpg ~ wt + hp + qsec, data = mtcars)
m1

konfound(m1, hp)

## -----------------------------------------------------------------------------
konfound(m1, wt, to_return = "table")

## ----message = F--------------------------------------------------------------
# if forcats is not installed, this install it first using install.packages("forcats") for this to run
if (requireNamespace("forcats")) {
    d <- forcats::gss_cat
    
    d$married <- ifelse(d$marital == "Married", 1, 0)
    
    m2 <- glm(married ~ age, data = d, family = binomial(link = "logit"))
    konfound(m2, age)
}

## ----eval = FALSE-------------------------------------------------------------
#  m4 <- glm(outcome ~ condition, data = binary_dummy_data)
#  konfound(m4, condition, two_by_two = TRUE)

## -----------------------------------------------------------------------------
if (requireNamespace("lme4")) {
    library(lme4)
    m3 <- fm1 <- lmer(Reaction ~ Days + (1 | Subject), sleepstudy)
    konfound(m3, Days)
}

## ----eval = TRUE--------------------------------------------------------------
mkonfound_ex
mkonfound(mkonfound_ex, t, df)

## ----eval = TRUE--------------------------------------------------------------
mkonfound(mkonfound_ex, t, df, return_plot = TRUE)

