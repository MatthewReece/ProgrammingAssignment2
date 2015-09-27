## This is an example of how to use the <<- operator
## to demonstrate lexical scope of variables in R.
## This example assumes that the input matrix is 
## always invertable

## This function which contains funtions to set and
## get the values of a list and also to set and get
## the values of the inverse of the matrix input

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(i) {
        x <<- i
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse
    getinv <- function() inv
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}


## This function calculates the inverse of the matrix,
## checks to see if it has been set already, if it is,
## returns values from the cache, if not, calculates
## the inverse matrix and sets the result in the cache
## using the setinv function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinv(inv)
    inv
}
