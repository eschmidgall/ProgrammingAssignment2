## This code computes the inverse of a matrix. It uses a cached value of that inverse if it has been calculated before. 
## If the matrix has not been inverted before, it computes the inverse. 

## makeCacheMatrix creates a funcitno to either set the value of the matrix, get the value of the inverted matrix, set 
## the value of the inverse or get the value of the inverse. 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) { 
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse<- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve checks to see if the matrix has been inverted before. If not, it inverts the matrix. 

cacheSolve <- function(x) {
        ## Return a matrix that is the inverse of 'x'
    m <-x$getinverse()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    data <-x$get()
    m <-solve(data)
    x$setinverse(m)
    m
}
