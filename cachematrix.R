## Sets up two functions "makeCacheMatrix" and "caheSolve". The first caches a given matrix to the variable "inv" and delivers the functions(methods) "set", "get", "setinverse" and "getinverse". The function "cacheSolve" solves/inverts the given matrix or uses the cached output of the inverting operation if the matrix does not changed. 
## 

## The makeCacheMatrix gets a matrix x as argument and sets up a list with the four delivered functions as elements. The selection of the functions is done by the "...$function()" formalism. When the function is applied "inv" (the storing variable) is initialized with NULL. The storing of the inverse is done by the "setinverse" function by using the <<- operator to store "inverse" to "inv" that is in the parent environment.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## "cacheSolve" solves e.g. inverts the given matrix if the variable "inv" is NULL and then uses the method "setinverse" to pass the inverse to the function "makeCacheMatrix" that stores the inverse into the caching variable "inv". On the other hand if "inv" isn't NULL it returns the cached matrix stored in "inv" without recomputing it. 

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inverse <- solve(data)
        x$setinverse(inverse)
        inverse #changing inv to inverse was the crucial point
}
