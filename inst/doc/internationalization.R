## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(datefixR)

## -----------------------------------------------------------------------------
# Standard formats
fix_date_char("15 January 2020")
fix_date_char("July 4th, 1776")
fix_date_char("December 25th, 2023")

# Different separators
english_dates <- c( # US format with slashes
  "15-Jan-2020", # Day-month-year with hyphens
  "2020.01.15", # Year-first with dots
  "15th January 2020" # Full format with ordinal
)
fix_date_char(english_dates)

## -----------------------------------------------------------------------------
# Various French formats
french_dates <- c(
  "15 janvier 2020", # Standard format
  "le 3 mars 2013", # With article
  "1er avril 2022", # First of the month
  "25 déc. 2023", # Abbreviated December
  "3 mai 1968" # Historical date
)
fix_date_char(french_dates)

# Mixed separators in French
french_mixed <- c(
  "15-janvier-2020",
  "03/mars/2013",
  "2020.05.15"
)
fix_date_char(french_mixed)

## -----------------------------------------------------------------------------
# German date formats
german_dates <- c(
  "15. Januar 2020", # With ordinal dot
  "3. Dezember 1999", # December
  "1. Mai 2023", # May Day
  "24. Dez 2023", # Abbreviated December
  "15 Jan 2020" # Without ordinal
)
fix_date_char(german_dates)

# German with different separators
german_separators <- c(
  "15.01.2020",
  "15-Januar-2020",
  "15/01/20"
)
fix_date_char(german_separators)

## -----------------------------------------------------------------------------
# Spanish date variations
spanish_dates <- c(
  "15 de enero de 2020", # Full format with prepositions
  "7 de septiembre del 2014", # With "del" contraction
  "1 ene 2023", # Abbreviated January
  "25 dic 2023", # Abbreviated December
  "15 enero 2020" # Without prepositions
)
fix_date_char(spanish_dates)

# Regional variations
spanish_regional <- c(
  "15-ene-2020",
  "15/enero/2020",
  "2020-01-15"
)
fix_date_char(spanish_regional)

## -----------------------------------------------------------------------------
# Portuguese date formats
portuguese_dates <- c(
  "15 de janeiro de 2020", # Full format
  "3 de dezembro de 1999", # December
  "1º jan 2023", # First with ordinal
  "25 dez 2023", # Abbreviated
  "15 janeiro 2020" # Without prepositions
)
fix_date_char(portuguese_dates)

## -----------------------------------------------------------------------------
# Russian date examples
russian_dates <- c(
  "15 января 2020", # January
  "3 декабря 1999", # December
  "1 мая 2023", # May
  "25 дек 2023" # Abbreviated December
)
fix_date_char(russian_dates)

## -----------------------------------------------------------------------------
# Indonesian date examples
indonesian_dates <- c(
  "15 Januari 2020", # January
  "3 Desember 1999", # December
  "1 Mei 2023" # May
)
fix_date_char(indonesian_dates)

## -----------------------------------------------------------------------------
mixed_dates <- c(
  "15 January 2020", # English
  "15 janvier 2020", # French
  "15 Januar 2020", # German
  "15 enero 2020", # Spanish
  "15 de janeiro de 2020" # Portuguese
)
fix_date_char(mixed_dates)

## -----------------------------------------------------------------------------
international_formats <- c(
  "02/05/92", # US/UK ambiguous
  "2020-mai-01", # French with hyphen
  "1996.05.01", # German with dots
  "02 04 96" # Space separator
)
fix_date_char(international_formats)

## -----------------------------------------------------------------------------
roman_dates <- c("15.VII.2023", "3.XII.1999", "1.I.2000")
fix_date_char(roman_dates, roman.numeral = TRUE)

