## These are  two functions for computing the inverse of a matrix or, to save time, getting it 
## from the cache if it is already there. The code is completely analogous to that from the test
## example with the vector mean, I just replaced "mean" by "solve" and "m" by "inv". And it works.

## This function takes a matrix and makes from it a more complicated object with inv=NULL 
## if the inverse has never been computed and inv equal to its inverse otherwise.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) 
    inv <<- solve
  getsolve <- function() inv
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function works on an object constructed from a matrix by makeCacheMatrix and gets its inverse, 
## either from cache if it is already there, or by a new computation.

cacheSolve <- function(x, ...) {
        ## if the inverse is in cache
  inv <- x$getsolve()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  ## If the inverse is not in cache, compute it
  data <- x$get()
  inv <- solve(data, ...)
  x$setsolve(inv)
  inv
}
