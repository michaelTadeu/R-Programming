# makeCacheMatrix() takes a matrix 'x' as input and provides functions to get
# and set its inverse. The function returns a list with the original matrix
# and the get and set functions

makeCacheMatrix <- function(x = matrix()) {
  
  inverse_of_matrix <<- NULL
  setInverse = function(inverse_of_x)
  {
    inverse_of_matrix <<- inverse_of_x
  }
  getInverse = function() 
  {
    inverse_of_matrix
  }
  
  list(matrix_created = x , setinverse = setInverse, getinverse = getInverse)

}


# cacheSolve() takes list generated by makeCacheMatrix() as input and returns 
# the inverse of the matrix stored in the list. If the inverse has already been 
# computed, it returns the cached value (using the getinverse() function of 
# the list), else it calculates the inverse using  solve() and sets the inverse 
# value in the list.

cacheSolve <- function(x, ...) {
  
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("Cached inverse of the matrix : ")
    return(inv)
  }
  data <- x$matrix_created
  inv <- solve(data)
  x$setinverse(inv)
  inv
        
}