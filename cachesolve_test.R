cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        print(data)
        inverse <- solve(data)
        print(inverse)
        x$setinverse(inverse)
        inv
}