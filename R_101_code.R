
# clear everything from memory (previous work, etc.)
# I almost always use this at the beginning of primary R scripts
rm(list=ls())

# Handy command to navigate to a file or directory using a 
# Windows Explorer type window
file.choose()

# Set working directory
setwd("C:\\Users\\Dave\\Documents\\Teaching Materials\\BOT 5790")


#%%%%%%%%%%%%%%%%%#
# Reading in data #
#%%%%%%%%%%%%%%%%%#

# Below, I've included some dummy code that you can use
# to read in your data to R. I use .csv format, though 
# other types are possible. The data gets read in as
# a 'data frame', which is defined and discussed below.
# The names() function allows to to change the column
# titles of the .csv file, if you so choose.

# HERE IS THE CODE EXAMPLE:

# newly_read_in_df <- read.csv("your_data_file.csv")
# names(newly_read_in_df)=c("name1","name2","name3","name4")


#%%%%%%%%%%%%%%%%%%%#
# R data structures #
#%%%%%%%%%%%%%%%%%%%#

# Four main types of data structures covered below include vectors, 
# matrices, arrays, and data frames.

#---------------------------------------------------------------------------------------
# VECTORS
#     - one-dimensional data set
#     - think one row or column from an excel spreadsheet

# Create a vector of data using the concatenate function
vector_1 <- c(1,5,4,3,5,3,2,9,5,7,8,9,2,3,4,1,1,9,1,5,6,7,8,9,9)
vector_1

# Create a vector as a sequence with specified intervals
vector_2 <- seq(0,15.6,0.2)
vector_2

# Create an empty numeric format vector that is 25 elements long
vector_3 <- numeric(25)
vector_3

# Create a new vector by adding vector_1 and vector_2
vector_4 <- vector_1 + vector_3

# Create a new vector by multiplying vector_1 values 
# by negative decimal number
vector_5 <- vector_1 * -5.32

# What happens if a calculation is performed between 
# two vectors of different length?

# Vectors can contain character data as well
vector_6 <- c("Rick","Morty","Summer")

# Check the structure type 
str(vector_5)
str(vector_6)

#---------------------------------------------------------------------------------------
# MATRICES
#     - two-dimensional data sets
#     - think one entire spreadsheet in excel
#     - data type throughout a matrix must be homogenous

# Create an empty matrix with a specific number of rows ('nrow') and 
# a specific number of columns ('ncol')

matrix_1 <- matrix(nrow = 25, ncol = 5)
matrix_1

# Fill all matrix cells with a specific value
matrix_2 <- matrix(5, nrow = 25, ncol = 5)
matrix_2

# Fill a matrix with all the data from vector_1, (in this case we know 
# the total number of elements in each is equal: n=24)
matrix_3 <- matrix(vector_1, nrow=6,ncol=4)
matrix_3 

# Check dimensions of matrix_3
dim(matrix_3)

# Check structure of matrix_3
str(matrix_3)

#---------------------------------------------------------------------------------------
# ARRAYS
#     - three-dimensional data sets
#     - think one entire excel workbook containing more than one spreadsheet
#     - data type throughout a matrix must be homogenous

# Fill an array with data created using the sequence function
array_1 <- array(seq(1,5,0.25),dim=c(2,5,2))
array_1

# Check dimensions and structure for array_1
dim(array_1)
str(array_1)

#---------------------------------------------------------------------------------------
# DATA FRAMES 
#     - two-dimensional data sets, like matrices, with a few differences
#     - columns have names (title on the top row)
#     - data types can be heterogenous across columns
#     - this format is REQUIRED for ggplot2
#     - more often than not, these are probably the way to go, IMO

# Create a few vectors
names = c("Rick","Morty","Summer")
age_yrs = c(75,14,17)
height_cm = c(180.3,108.2,126.1)

# Combine the vectors into a data frame
df_1 <- cbind.data.frame(names,age_yrs,height_cm)
df_1

#---------------------------------------------------------------------------------------


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#
# Indexing and using logical operators #
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#

# Note on indexing: When specifying a location in a vector, matrix, array, 
# or dataframe we use []. The $ is used to specify a particular column in
# a data frame.
#
# For data structures with higher dimensionality (matrices,data frames and 
# arrays), R uses the following format: [row,column,array]

#---------------------------------------------------------------------------------------
# Since a vector is 1d, we simply enter the number corresponding to a 
# single position, or range of positions in the vector

# Show vector_1 we created earlier
vector_1

# Select the 7th elemnt in vector_1
vector_1[7]

# Select elements 7 through 10 in vector_1
vector_1[7:10]

# Select elements 3, 7, and 12 from vector_1
elemSel_v1 <- c(3,7,12)
vector_1[elemSel]

#----
# Since matrices and data frames are 2d, for indexing, we need a comma 
# to separate rows and columns inside the brackets

# Select elements from rows 2 through 4, and columns 1 through 3
# for matrix_3
matrix_3[2:4,1:3]

#----
# Select rows 1 through 2 (and all columns) in df_1
df_1[1:2,]

# Get all the elements in the names column of df_1
df_1$names

#----
# For arrays, we need an additional comma in the brackets to specify the matrices
# we are interested in 

# Select elements from rows 1,columns 1 through 3, in both matrices of array_1
array_1[1,1:3,1:2]

#---------------------------------------------------------------------------------------
# USING LOGICAL OPERATIONS - SOME EXAMPLES

# select all the rows in df1 that contain the value 'Rick' from the names column
df_1[df_1$names == "Rick",]

# Select all the rows in df1 that do not contain the value 'Rick' in the names column
df_1[df_1$names != "Rick",]

# Select all the rows in df1 with age_yrs values less than 35.5 years old
df_1[df_1$age_yrs < 35.5,]

# Select all the rows in df1 that fall within the height range of 115 - 175 cm
df_1[df_1$height_cm < 175 & df_1$height_cm > 115,]

#---------------------------------------------------------------------------------------


#%%%%%%%%%%%%%%%%%%%%%#
# Using distributions #
#%%%%%%%%%%%%%%%%%%%%%#

# There are several different distribution types built into R for continuous
# and discrete data. We'll focus on the normal distribution here, but the others
# work in a similar fashion.

#---------------------------------------------------------------------------------------

# Here, let's define some normal distribution parameters 

# Define the mean
mu_1 <- 1.762

# Define the standard deviation
sd_1 <- 0.754

#-------#
# dnorm #
#-------#

# Calculates probability (height of point along the y-axis) for a given x-axis
# value from a probability density function (PDF)
dnorm(-1, mean = mu_1, sd = sd_1)
dnorm(1.5, mean = mu_1, sd = sd_1)
dnorm(3.5, mean = mu_1, sd = sd_1)

#-------#
# pnorm #
#-------#

# Solves the cumulative distribution function (CDF) by integrating the PDF
# (calculating area under the curve) to the left of the specified value
pnorm(-1, mean = mu_1, sd = sd_1)
pnorm(1.5, mean = mu_1, sd = sd_1)
pnorm(3.5, mean = mu_1, sd = sd_1)

#-------#
# qnorm #
#-------#

# This is the inverse of pnorm, and gives the x-axis value for a PDF that 
# corresponds to the specified CDF value

qnorm(0.000124576, mean = mu_1, sd = sd_1)
qnorm(0.3641153, mean = mu_1, sd = sd_1)
qnorm(0.9894178, mean = mu_1, sd = sd_1)

#-------#
# rnorm #
#-------#

# Create a dataset from random samples from the normal distrubtion
# with mean and standard deviation described above
samp_norm <- rnorm(10000, mean = mu_1, sd = sd_1)
samp_norm
hist(samp_norm)

# Discrete data example using a Poisson distribution
# ***Note the difference in parameters***
samp_pois <- rpois(10000, lambda = mu_1)
samp_pois
hist(samp_pois)

#---------------------------------------------------------------------------------------


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#
# Creating and calling functions #
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#

# Functions are super handy when you have to repeat a 
# mathematical/computational process multiple times.

#---------------------------------------------------------------------------------------

# Defining a function

calc_y <- function(m,x,b) {
  
  y <- m*x + b
  
  return(y)
}

calc_y(7,2540,0.567)
#----

# Functions can be 'nested'

calc_y2 <- function(m,x,b,var1,var2) {
  
  var1 <- calc_y(m,x,b)
  
  var2 <- var1 * 25 + 7
  
  var3 <- rep(var2,15)
  
  return(var3)
  
}

calc_y2(4,2.3456,2,1.7,2)
#----

# Call functions defined elsewhere, in a different 
# R script file

# (In this case, I've got in the current working directory)
xtraFunc <- file.path('R_101_functions.R')
source(xtraFunc)

# Run the two sourced functions
calc_y3(2.34,5.1,0.7328,seq(1,100,1))
calc_y4(5.2341)

#---------------------------------------------------------------------------------------


#%%%%%%%%%#
# Looping #
#%%%%%%%%%#

# Looping is a great way to deal with iterative processes in R

#---------------------------------------------------------------------------------------

#--------------#
# The for loop #
#--------------#

# Create an empty vector to store the ouput the loop will generate

x <- numeric(0)

for (i in 1:15) {
  x[i] <- 2.35*i
}

x

#---------------------#
# The nested for loop #
#---------------------#

# Create an empty matrix to store the output the loop will generate

matrix_4 <- matrix(0,nrow=10,ncol=10)

for (i in 1:10){
  for (j in 1:10) {
    matrix_4[i,j] <- j+5*i^2
  }
}


#----------------------#
# More complex looping #
#----------------------#

# Create a dataframe for this example
col1 <- seq(0.5,100,0.5)
col2 <- rnorm(200,4.32,1.73)
col3 <- rnorm(200,4.32,1.73)
col4 <- rnorm(200,4.32,1.73)
col5 <- rnorm(200,4.32,1.73)
col6 <- rnorm(200,4.32,1.73)
col7 <- rnorm(200,4.32,1.73)

loop_df <- cbind.data.frame(col1,col2,col3,col4,col5,col6,col7)

# Create an empty vector to store the ouput the for loop will produce
loop_output <- numeric(0)

# Run a for loop that for each row in loop_df, takes the value in the first
# column and multiplies it by the average of the values in the remaining
# six columns.
for (i in 1:length(loop_df[,1])) {
  
  a = loop_df[i,1]
  b = loop_df[i,2:7]
  
  loop_output[i] = a * mean(as.numeric(b))
  
}

loop_output

# quick plot to check the output
plot(loop_output)

# END OF R_101 CODE







