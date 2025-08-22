## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  message = FALSE
)

## ----setup--------------------------------------------------------------------
library(datefixR)

## ----echo = TRUE, results='asis'----------------------------------------------
bad.dates <- data.frame(
  id = seq(5),
  some.dates = c(
    "02/05/92",
    "01-04-2020",
    "1996/05/01",
    "2020-05-01",
    "02-04-96"
  ),
  some.more.dates = c(
    "01 03 2015",
    "2nd January 2010",
    "01/05/1990",
    "03-Dec-2012",
    "02 April 2020"
  )
)
knitr::kable(bad.dates)

## ----echo = TRUE, results='asis'----------------------------------------------
fixed.dates <- fix_date_df(
  bad.dates,
  c("some.dates", "some.more.dates")
)
knitr::kable(fixed.dates)

## -----------------------------------------------------------------------------
fix_date_char("01 02 2014")

## -----------------------------------------------------------------------------
fix_date_char("7 de septiembre del 2014")

## -----------------------------------------------------------------------------
fix_date_char("01 02 2014", format = "mdy")

## -----------------------------------------------------------------------------
fix_date_char("July 4th, 1776")

## -----------------------------------------------------------------------------
fix_date_char("1992")

## -----------------------------------------------------------------------------
fix_date_char("1992", day.impute = 1, month.impute = 1)

## -----------------------------------------------------------------------------
fix_date_char("1992", month.impute = NA)

## ----eval = FALSE-------------------------------------------------------------
# fix_date_char("1992", month.impute = NULL)
# # ERROR

## -----------------------------------------------------------------------------
example.df <- data.frame(
  id = seq(1, 3),
  some.dates = c("2014", "April 1990", "Mar 19")
)
fix_date_df(example.df, "some.dates", day.impute = 1, month.impute = 1)

## -----------------------------------------------------------------------------
date <- as.numeric(as.Date("2023-01-17"))
print(date)
fix_date_char(as.character(date))

## -----------------------------------------------------------------------------
fix_date_char("44941", excel = TRUE)

## -----------------------------------------------------------------------------
fix_date_char("12/IV/2019", roman.numeral = TRUE)

## -----------------------------------------------------------------------------
tryCatch(
  {
    fix_date_char("99-99-9999")
  },
  error = function(e) {
    cat("Error:", e$message, "\n")
  }
)

## ----eval=FALSE---------------------------------------------------------------
# # Current year: 2025 (third digit is 2)
# # Years 00-25 become 2000-2025
# fix_date_char("01/01/05") # → 2005-01-01
# fix_date_char("01/01/24") # → 2024-01-01
# 
# # Years 26-99 become 1926-1999
# fix_date_char("06/15/92") # → 1992-06-15
# fix_date_char("03/10/80") # → 1980-03-10

## -----------------------------------------------------------------------------
# Demonstrating current behavior (as of 2025)
samples <- c("01/01/20", "01/01/24", "01/01/23", "01/01/50", "01/01/99")
for (date in samples) {
  result <- fix_date_char(date)
  cat(sprintf("%s → %s\n", date, result))
}

## -----------------------------------------------------------------------------
fix_date_char("2023/12/25") # Automatically detects year-first
fix_date_char("1995-04-15") # Year-first with different separator

## -----------------------------------------------------------------------------
fix_date_char("January 15, 2023") # Month name → MDY
fix_date_char("Mar 5 1992") # Abbreviated month → MDY
fix_date_char("abril 20 2020") # Spanish month → MDY

## -----------------------------------------------------------------------------
# Default behavior (DMY)
fix_date_char("15/03/2023") # → 2023-03-15 (day/month/year)

# Override with format parameter
# fix_date_char("15/03/2023", format = "mdy") # → Invalid (month 15)
fix_date_char("03/15/2023", format = "mdy") # → 2023-03-15 (month/day/year)

## -----------------------------------------------------------------------------
# Ambiguous: could be March 5th or May 3rd
fix_date_char("03/05/2023") # → 2023-05-03 (assumes DMY)
fix_date_char("03/05/2023", format = "mdy") # → 2023-03-05 (forces MDY)

# Unambiguous: day > 12 forces correct interpretation
fix_date_char("15/03/2023") # → 2023-03-15 (only valid as DMY)
fix_date_char("03/15/2023", format = "mdy") # → 2023-03-15 (only valid as MDY)

## -----------------------------------------------------------------------------
# Year-first detection (4-digit first component)
test_dates_ymd <- c("2023/01/15", "1999-12-31", "2020.06.30")
for (date in test_dates_ymd) {
  cat(sprintf("%s → %s (YMD detected)\n", date, fix_date_char(date)))
}

# Month-name detection (text month triggers MDY)
test_dates_mdy <- c("March 15, 2023", "Dec 25 2020", "Jan 1st 2000")
for (date in test_dates_mdy) {
  cat(sprintf("%s → %s (MDY detected)\n", date, fix_date_char(date)))
}

# Default numeric (assumes DMY)
test_dates_dmy <- c("15/03/2023", "01-12-1999", "25.12.2020")
for (date in test_dates_dmy) {
  cat(sprintf("%s → %s (DMY default)\n", date, fix_date_char(date)))
}

## -----------------------------------------------------------------------------
# Force MDY interpretation
fix_date_char("01/02/2023", format = "mdy") # → 2023-01-02 (Jan 2nd)
fix_date_char("01/02/2023", format = "dmy") # → 2023-02-01 (Feb 1st)

# Useful for consistently formatted datasets
dates_usa <- c("01/15/2023", "03/22/2023", "12/01/2023")
lapply(dates_usa, function(x) fix_date_char(x, format = "mdy"))

## -----------------------------------------------------------------------------
usa_dates <- data.frame(
  id = 1:3,
  event_date = c("01/15/2023", "03/22/2023", "12/01/2023")
)

# Apply consistent MDY format
fixed_usa <- fix_date_df(usa_dates, "event_date", format = "mdy")
knitr::kable(fixed_usa)

## -----------------------------------------------------------------------------
citation("datefixR")

