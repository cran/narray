#' Summarize a matrix analogous to a grouped df in dplyr
#'
#' @param x      A matrix
#' @param from   Names that match the dimension `along`
#' @param to     Names that this dimension should be summarized to
#' @param along  Along which axis to summarize
#' @param ...    Parameters passed to `base/match`
#' @param FUN    Which function to apply, default is throwing error on aggregation
#' @return       A summarized matrix as defined by `from`, `to`
#' @export
summarize = function(x, along=1, to, from=dimnames(x)[[along]], ...,  FUN) {
    warning("summarize() is deprecated and will be removed in 0.4.0. ",
            "Use map() with subsets instead.")

    lookup = match(dimnames(x)[[along]], from=from, to=to, ..., na_rm=TRUE)
    x = subset(x, index=names(lookup), along=along)
    
    # aggregate the rest using fun
    re = split(x, along=along, subsets=lookup)
    re = lapply(re, function(j) map(j, along, FUN, drop=FALSE))
    bind(re, along=along)
}
