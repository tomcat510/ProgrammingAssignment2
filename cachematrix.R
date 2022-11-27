## Put comments here that give an overall description of what your
## functions do

## return a list with cached matrix

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
	set <- function(y) {
		x <<- y
		inv <<- NULL
	}
	get <- function() x
	setinverse <- function(solve) inv <<- solve
	getinverse <- function() inv
	list(set = set, get = get,
		setinverse = setinverse,
		getinverse = getinverse)
}


## Return a matrix that is the inverse of 'x' by accepting a list of cached data
## If it's already been calculated, it checks first by checking for a value in $getinverse

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
		if(!is.null(inv)) {
			message("please wait, accessing cache")
			return(inv)
		}
		ourMatrix <- x$get()
		inv <- solve(ourMatrix)
		x$setinverse(inv)
		inv
}
