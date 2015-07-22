## Those two functions can be used to compute the inverse of a matrix. The advantage is, that the second function 
# (cacheSolve) first checks the cache for a solution, before it computes a (new) inverse.

## the first main function stores a bunch of functions, that can be used to set and get a matrix

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        
        set <- function(n) {    # changes the matrix stored in the main function
                m <<- n         # substitutes the matrix x with y (the input) in the main function
                s <<- NULL      # restores to null the value of the inverse s
        }
        get <- function() m     # returns the value of matrix m
        
        setinverse <- function(solve) s <<- solve       # stores value of input in variable s (can be any value)
        getinverse <- function() s                      # returns variable s
       
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## the second main function computes the inverse of a matrix m, if it can't be found in the cache

cacheSolve <- function(x, ...) {                # Input is the object where makeCachMatrix is stored
         s <- m$getinverse()                    # subsetting the main function to apply the functions from makeCacheMatrix 
        
        if(!is.null(s)) {                       # checking if there is already an inverse s
                message("getting cached data")
                return(s)                       # simply returning the stored value
        }
        data <- m$get()                         # gets the matrix stored with makeCacheMatrix
        s <- solve(data)                        # inverts the loaded matrix and assigns it to s
        m$setinverse(s)                         # stores the inverted matrix s
        s
}
