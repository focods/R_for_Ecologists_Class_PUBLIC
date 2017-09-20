# David Millar
# dave.millar@uwyo.edu
# 9/20/2017

# R for Ecologists - Fall 2017


# FUNCTIONS TO BE CALLED FROM THE MAIN SCRIPT, 'R_101_code'

calc_y3 <- function(a,b,c,x) {
  
  y <- a*x^2 + b*x + c
  
  return(y)
  
}

calc_y4 <- function(x){
  
  y <- (x + 2 * 5.642)/5 * 2
  
  return(y)
}
