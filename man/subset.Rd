% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subset.r
\name{subset}
\alias{subset}
\title{Subsets an array using a list with indices or names}
\usage{
subset(X, index, along = -1, drop = FALSE)
}
\arguments{
\item{X}{The array to subset}

\item{index}{A list of vectors to use for subsetting, or vector if along is given}

\item{along}{Along which dimension to subset if index is a vector; default
is last dimension; argument is ignored if X is a vector}

\item{drop}{Remove unused dimensions after mapping; default: TRUE}
}
\value{
The subset of the array
}
\description{
Subsets an array using a list with indices or names
}
