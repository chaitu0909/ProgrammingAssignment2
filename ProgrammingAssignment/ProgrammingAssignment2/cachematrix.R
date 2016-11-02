## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(originalMatrix = matrix()) {
  
  InverseMatrix <- NULL
  set <- function(y) {
    originalMatrix <<- y
    InverseMatrix <<- NULL
  }
  
  get <- function() originalMatrix
  setMatrixInverse <- function(solve) InverseMatrix <<- solve
  getInverseMatrix <- function() InverseMatrix
  list(set = set, get = get,
       setMatrixInverse = setMatrixInverse,
       getInverseMatrix = getInverseMatrix)

}

## Write a short comment describing this function

cacheSolve <- function(cacheableMatrix,...) {
        ## Return a matrix that is the inverse of 'x'
  invertedMatrix <- cacheableMatrix$getInverseMatrix()
  if(!is.null(invertedMatrix)) {
    message("getting cached data")
    return(invertedMatrix)
  }
  data <- cacheableMatrix$get()
  invertedMatrix <- solve(data, ...)
  cacheableMatrix$setMatrixInverse(invertedMatrix)
  invertedMatrix
  
}
