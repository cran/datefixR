## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(datefixR)

## ---- echo = FALSE------------------------------------------------------------
bad.dates <- data.frame(id = seq(5),
                        some.dates = c("02/05/92",
                                       "01-04-2020",
                                       "1996/05/01",
                                       "2020-05-01",
                                       "02-04-96"),
                        some.more.dates = c("01 03 2015",
                                            "02/05/00",
                                            "01/05/1990",
                                            "03-Dec-2012",
                                            "02 April 2020"))
knitr::kable(bad.dates)

## -----------------------------------------------------------------------------
fixed.dates <- fix_dates(bad.dates,
                         c("some.dates", "some.more.dates"))
knitr::kable(fixed.dates)

## -----------------------------------------------------------------------------
fix_date("01 02 2014")

## ---- echo = FALSE------------------------------------------------------------
impute.dates <- data.frame(id = 1,
                        some.date = "1992")
knitr::kable(impute.dates)

## -----------------------------------------------------------------------------
imputed.dates <- fix_dates(impute.dates, "some.date")
knitr::kable(imputed.dates)

## -----------------------------------------------------------------------------
imputed.dates <- fix_dates(impute.dates,
                           "some.date",
                           day.impute = 1,
                           month.impute = 1)
knitr::kable(imputed.dates)

## -----------------------------------------------------------------------------
imputed.dates <- fix_dates(impute.dates,
                           "some.date",
                           month.impute = NA)
knitr::kable(imputed.dates)

## ---- eval = FALSE------------------------------------------------------------
#  imputed.dates <- fix_dates(impute.dates,
#                             "some.date",
#                             month.impute = NULL)
#  # ERROR

## -----------------------------------------------------------------------------
fix_date("2014", day.impute = 1, month.impute = 1)

## -----------------------------------------------------------------------------
citation("datefixR")

