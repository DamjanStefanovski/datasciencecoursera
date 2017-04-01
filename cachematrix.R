## These functions written in partial from Coursera Data Science:R Programming
## Week3 , Programming Assignment 2 (GitHub user:DamjanStefanovski)

## Function that creates a special "matrix" object so we can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL                      ## Initialize the inverse property
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }     
  ## Getting the matrix
  get <- function()
    x           ## Return the matrix
  setinverse <- function(inverse) inv <<- inverse        ##Setting the inverse of the matrix, assigns value
  getinverse <- function() inv                           ## Getting the inverse of the martix, gets the value of inv where called
  ## Back a list of the methods
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## Return a matrix that is the inverse of 'x'
## Computes the inverse of the special "matrix" returned by makeCacheMatrix above


cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}

