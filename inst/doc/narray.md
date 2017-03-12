---
title: "narray Usage Examples"
author: "Michael Schubert"
date: "2017-03-05"
output:
  rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{narray Usage Examples}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---



Array and Matrix processing
===========================

This package provides consistent utility functions for array programming with
arbitrary dimensions (summary below).

We recommend to load this package in its own namespace to not shadow base R
functions using [`modules`](https://github.com/klmr/modules) or
[`import`](https://github.com/smbache/import).


```r
# example using `modules`
ar = modules::import_package(narray)
ar$myfunction(...)
```



Stacking and splitting
----------------------

`stack()` is like `cbind`/`rbind`, but along arbitrary axes, and taking care of (1) names 
along each dimension and (2) padding partial matching arrays.

![stack-schema](stack.png)


```r
A = matrix(1:4, nrow=2, ncol=2, dimnames=list(c('a','b'),c('x','y')))
B = matrix(5:6, nrow=2, ncol=1, dimnames=list(c('b','a'),'z'))

C = stack(list(A, B), along=2)
C
```

```
##   x y z
## a 1 3 6
## b 2 4 5
```

```r
D = stack(list(m=A, n=C), along=3) # we can also introduce new dimensions
D
```

```
## , , m
## 
##   x y  z
## a 1 3 NA
## b 2 4 NA
## 
## , , n
## 
##   x y z
## a 1 3 6
## b 2 4 5
```

`split()` splits an array along a given axis; can do each element or defined subsets.

![split](split.png)


```r
#split(C, along=2, subsets=c('s1','s1','s2'))
```

Mapping functions on arrays
---------------------------

Like `apply`, but not reordering array dimensions and allowing to specify 
subsets that the function should be applied on. The function must either return
a vector of the same length as the input (returns matrix of same dimension) or
of length 1 (drops current dimension or returns subsets).

![map-schema](map.png)








