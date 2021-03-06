% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datefixR-package.R
\docType{package}
\name{datefixR}
\alias{datefixR}
\title{datefixR: Standardize Dates in Different Formats or with Missing Data}
\description{
There are many different formats dates are commonly represented
with: the order of day, month, or year can differ, different separators
("-", "/", or whitespace) can be used, months can be numerical, names, or
abbreviations and year given as two digits or four. \code{datefixR} takes dates
in all these different formats and converts them to \R{}'s built-in date
class. If \code{datefixR} cannot standardize a date, such as because it is too
malformed, then the user is told which date cannot be standardized and the
corresponding ID for the row. \code{datefixR} also allows the imputation of
missing days and months with user-controlled behavior.
}
\section{Author}{

\strong{Maintainer}: Nathan Constantine-Cooke
\email{nathan.constantine-cooke@ed.ac.uk}
\href{https://orcid.org/0000-0002-4437-8713}{(ORCID)}
}

\seealso{
\url{https://docs.ropensci.org/datefixR/}

\url{https://github.com/ropensci/datefixR/}
}
