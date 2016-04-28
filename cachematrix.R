## This pair of functions caches the inverse of a matrix

## This creates a matrix object that can cache it's inverse

makeCacheMatrix <- function(x = matrix( )){
        my_inv <- NULL
        set <- function (y) {
                x <<- y
                my_inv <<- NULL
        }
        get <- function () x
        setinverse <- function(inverse) my_inv <<- inverse
        getinverse <- function() my_inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}



## This computes the inverse of the martix object returned by makeCacheMatrix. This will be retrieve from the cache if it has already been calulated

cacheSolve <- function(x, .){
        my_inv <-  x$getinverse()
        if(!is.null(my_inv)){
                message("getting cached data")
                return(my_inv)
        }
        data <- x$get()
        my_inv <- solve(data, .)
        x$setinverse(my_inv)
        my_inv
} 


