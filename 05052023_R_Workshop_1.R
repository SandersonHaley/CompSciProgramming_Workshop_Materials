#R is particularly useful for statistical analysis and has many packages for stats in biology that aren't necessarily available in Python.
#R is used mostly for statistical analysis and data visualization in Biology. 
#It is more of a mathematically structured language compared to Python.


#Part1: Language




# 1)Getting Started

# Comments work the same as in Python. To comments a line use "#" at the start for single lines. 


# 1A) Working Directory
# An active R session always has a working directory associated with it. If you want to set this directory, you can. 
# To check the location for your working directory: 
getwd()
# file paths are always enclosed in double quotation marks and R only uses forward slashes, 
# not backslashes, when specifying folder locations.
# You can change the working directory using: 
setwd(directory)
#You can provide a relative or absolute path when setting the working directory.

# 1B) installing and Loading R packages
# The base installation has a lot of built-in commands for numeric calculations,
# common statistical analyses, and plotting and visualization.
# These do not need to be imported or loaded in any way to the used.
# More specialized techniques and datasets are contained within packages (also known as libraries) of code.
# Contributed packages are used a lot in Biology and you need to install and load these libraries.

# Loading Packages
# You need to call the library to use them and gain access to its functions and datesets. 
library("MASS")

# Installing Packages 
# First you need to download and install packages before you can load them. 
install.packages("ks")

#Updating Packages
#To look for updates of all your installed packages:
update.packages()

# 1C)Help Files and Function Documentation
#Like Linux, R comes with a suite of help files which you can use to search for particular functionality,
#to seek information on precisely how to use a given function and specify its arguments,
#to clarify the role of arguments in the operations, to learn about the form of any returned objects,
#to provide possible examples of using a function and to get details on how you may cite any software.
#To access then use the help function in the prompt or the ? shortcut:
?mean
#If you are unsure about the actual name of the function use the help.search function or you can use the ?? shortcut:
??"mean"

#1D)Saving work and Exiting R

# Workspaces
# you can use GUI menu items to save and load workspaces image files.
#An R workspace image contains all the information held in the Rsession at the time of exit and is saved as a .RData file.
#Loading a stored .RData file allows you to "pick up from where you left off"
# you can use the R commands save.image and load at the console for handling workspace .RData files.
#SAving a workspace image this way does not retain the functionality of any contributed packages that were loaded. You have the load the libraries again.
# the quickest way to exit R is to enter q() at the prompt. You will be asked if you want to save a workspace image.
q()

#Scripts
#work in the built-in script editor and save them as a plain text file with the .R extension.


#2) Numerics, Arithmetic, Assignment, and Vectors

#2A)R for Basic Math

#Arithmetic
#R follows standard mathematical rules and PEDMAS.Example:
10^3+3*60/8-3
#Missing or misplaced parentheses are a big source of arithmetic errors in R.

#Logarithms and Exponentials
#In R, the log transformation is acheived with the log function. 
#You supply log with the number to transform, assigned to the value x, and the base, assigned to base:
log(x=243,base=3)
#Some things to consider:
# 1) both x and the base must be positive
# 2) the log of any number x when the base is equal to x is 1
# 3) the log of x=1 is always 0, regardless of the base

#The R command for the exponential function is exp:
exp(x=3)

#Default behaviours of log is to assume the natural log:
log(x=20.08554)

#E-notation
#when R prints a very large or small number beyond a certain threshold of significant figures (n=7), the number are displayed using classic scientific e-natation
20000000000
0.000000002

#2B)Assigning Objects
#If you want to save the results of a calculation and perform further functions, you need to be able to assign the results of a 
#given computation to an object in the current workspace. You are storing some item or results under a given name so it can be accessed later.
#An object in R = a variable in Python
#You can specify an assignment in R in two ways: using arrow notation and using a single equal sign.
x <- -5
x
x = x +1
x
mynumber = 45.2
y <- mynumber*x
y

ls() # shows all the objects in the workspace in alphabetical order

#2C) Vectors

#often you will want to perform the same calculation or comparisons upon multiple entities.
#You can do this type of operation using vectors.

# Creating a Vector
#A vector is a collection of observations or measurements concerning a single variable. 
#More complicated data structures may consist of several vectors.
#The function for creating a vector is the single letter c, with the desired entries in parentheses seperated by commas.
myvec <- c(1,3,1,42)
myvec

#vector entries can be calculations or previously stroed items ( including other vectors)
foo <- 32.1
myvec2 <- c(3, -3,2,3.45,1e+03,64^0.5,2+(3-1.1/9.44),foo)
myvec2
myvec3 <- c(myvec,myvec2)

#Sequences(seq),Repetition(rep), Sorting(sort), and Lengths(length)
#the easiest way to create a sequence, with numeric values separated by intervals of 1, is to use the colon operators.
3:27
# you can also provide either previously stored value or a (strictly parenthesized) calculation when using the colon operator.
foo <- 5.3
bar <- foo:(-47+1.5)
bar

# SEquences with seq
#allows for more flexibility when creating sequences
seq(from=3,to=27,by=3)
# instead of providing a by number you can specify a length.out value to produce a vector with that many numbers, evenly spaced between the from and to values
seq(from=3,to=27,length.out=40)
#for decreasing sequences, the use of "by" must be negative.
foo <- 5.3
myseq <- seq(from=foo,to=(-47+1.5),by=-2.4)
myseq

#Repetition with rep
#repeat a certain value
rep(x=1,times=4)
rep(x=c(3,62,8.3),times=3)
rep(x=c(3,62,8.3),each=2)
rep(x=c(3,62,8.3),times=3,each=2)
#default is to treat the values of times and each as 1
#as with seq, you can include the result of rep in a vector
foo <- 4
c(3,8.3,rep(x=32,times=foo), seq(from=2,to=1,length.out=foo+1))


#Sorting with sort
#Sorting a vector in increasing or decreasing order of its elements is another simple operation.
sort(x=c(2.5,-1,-10,3.44),decreasing=FALSE)
sort(x=c(2.5,-1,-10-3.44),decreasing=TRUE)
foo <- seq(from=4.3,to=5.5,length.out=8)
foo
bar <- sort(x=foo,decreasing=TRUE)
bar
sort(x=c(foo,bar),decreasing=FALSE)

#Finding a Vector Length with length
#determines how many entries exist in a vector given as the argument x
length(x=c(3,2,8,1))
length(x=5:13)
foo <- 4
bar <- c(3,8.3,rep(x=32,times=foo),seq(from=-2,to=1,length.out=foo+1))
length(x=bar)

#Subsetting and Element Extraction
#you can access individual elements by asking R to return the values of myvec at specific locations, done by entering the name of the vector followed by the position in square brackets.
#same as indexing in Python
myvec <- c(5,-2.3,4,4,4,6,8,10,40221,-8)
length(x=myvec)
myvec[1]
foo <- myvec[2]
foo
myvec[length(x=myvec)]

myvec.len <- length(x=myvec)
bar <- myvec[myvec.len-1]
bar
#you can use colon notation with length of a specific vector to get all possible indexes for extracting a particular element in the vector
1:myvec.len
# you can also delete individual elements by using negative versions of the indexes supplied in the square brackets
myvec[-1]
baz <- myvec[-(myvec.len-1)]
baz
qux <- myvec[-(myvec.len-1)]
qux
# this returns the values of qux except for its last element
length(x=qux)
qux[-length(x=qux)]

#you can also subset objects using vectors of indexes, rather than individual indexes
myvec[c(1,3,5)]
#you can use the colon operator to create a sequence of indexes
1:4
foo <-myvec[1:4]
foo

# the order of the returned elements depends entirely upon the index vector supplied in the square indexes and the resulting extractions
length(x=foo):2
foo[length(foo):2]

#you can also use rep to repeat an index
indexes <- c(4,rep(x=2,times=3),1,1,2,3:1)
indexes
foo[indexes]

#you can also return the elements of a vector after deleting more than one element.
#For example, to create a vector after removing the first and third elements of foo.
foo[-c(1,3)]
#it is not possible to mix positive and negative indexes in a single index vector
# to overwrite certain elements in an existing vector with new values, you first specify the elements you want to overwrite using square brackets
#then use the assignment operator to assign the new values
bar <- c(3,2,4,4,1,2,4,1,0,0,5)
bar
bar[1] <- 6
bar

#when selecting multiple elements, you can specify a single value to replace them all or enter a vector of value that is equal in length to the number of elements selected to replace them.
bar[c(2,4,6)] <- c(-2,-0.5,-1)
bar

#overwriting elements 7 to 10 (inclusive)
bar[7:10] <- 100
bar

#Vector-Oriented Behavior
#try this:
foo <- 5.5:0.5
foo
foo-c(2,4,6,8,10,12)
#Multiply foo by bar
bar <- c(1,-1)
foo*bar
#bar is applied repeatedly over length of foo
#If vector length are not evenly divisible
baz <- c(1,-1,0.5,-0.5)
foo*baz
# you can consider single values to be vectors of 1, so you can use them to repeat an operation on all values of the vector
qux <- 3
foo+qux
#you can get the sum of a vector
foo
sum(foo)
#and their product
prod(foo)
# this vector-oriented behaviour can be used to overwrite multiple elements
foo
foo[c(1,3,5,6)] <- c(-99,99)
foo


#3 Matrices and Arrays

#3A)Defining a matrix
#you can describe a matrix A as an m x n matrix, A will have exactly m rows and n columns.
#A will have a total of mn entries with each entry having a unique position given by its specific row and column# to create a matrix in R, use the matrix command, providing the entries of the matrix to the data argument as a vector

A <-matrix(data=c(-3,2,893,0.17),nrow=2,ncol=2)
A

#2x2 matrix A was filled in a column-by-column fashion when reading the data entries from left to right.
#you can control how F fills in data using the argument byrow:

matrix(data=c(1,2,3,4,5,6),nrow=2,ncol=3, byrow=FALSE)

#explicitly told to fill data column-wise, this is the default

matrix(data=c(1,2,3,4,5,6),nrow=2,ncol=3,byrow=TRUE)

#Row and Column Bindings
# if you have multiple vectors of equal length, you can quickly build a matrix by binding together these vectors using rbind and cbind. 
# you can either treat the vector as a row or a column.

rbind(1:3,4:6)

cbind(c(1,4),c(2,5),c(3,6))

#Matrix Dimensions
#dim provides the dimensions of a matrix stored in your workspace

mymat <- rbind(c(1,3,4),5:3,c(100,20,90),11:13)
dim(mymat)
#Other useful commands
nrow(mymat)
ncol(mymat)
dim(mymat)[2]

#3B Subsetting
#extracting or subsetting elements from a matrix in R is much like extracting elements from vectors
#element extraction still uses the square-brackets operator, but now it must be performed with both a row and a column position in this order [row,column]
A <- matrix(c(0.3,4.5,55.3,91,0.1,105.5,-4.2,8.2,27.9), nrow=3,ncol=3)
A
A[3,2]

#Row, Column and Diagonal Extractions
#To return a column
A[,2]
#to return a row
A[1,]
#whenever an extraction (or deletion) results in a single value, single row, or single column, R will always return stand-alone vectors comprised of the requested values.
A[2:3,]
A[,c(3,1)]
A[c(3,1),2:3]

# you can also identify the values along the diagonal of a square matrix using the diag command
diag(x=A)

#Omitting and overwriting
#to delete or omit elements from a matrix, you again use square brackets , but this time with negative indexes
A[,-2]

#remove the first row from A and retrieves the third and second column values, in that order, from the remaining two rows
A[-1,3:2]
#without the first row and second column
A[-1,-2]
#deletes the first row and then deletes the second and third column
A[-1,-c(2,3)]

#To overwirte particular elements, or entire rows and columns, you identify the elements to be replaced and then assign the new values, like with vectors
#the new elements can be a single value, a vector of the same length as the number of elements to be replaced, or a vector whose length evenly divides the number of elements to be replaced
#make a copy of A
B <-A
#overwites the second row of B with the sequence 1,2,3
B[2,] <- 1:3
#overwrites the second column elements of the first and third rows with 900
B[c(1,3),2] <- 900
#replace the third column of B with the values in the third row of B
B[,3] <- B[3,]

# Try R's vector recycling by overwriting the first and third columns elements of row 1 and 3 with the two vvalues -7 and 7
B[c(1,3),c(1,3)] <- c(-7,7)

#to highlight the roles of index order on matrix replacement:
B[c(1,3),2:1] <- c(65, -65, 88, -88)
B
#if you want to replace the diagonal of a square matrix, you can avoid explicit indexes and directly overwrite the values using the diag command
diag(x=B) <-rep(x=0, times=3)



#3C Matrix Operations and Algebra
#Matrix Transpose
#In R, the transpose of a matrix is found with the function t. Let's create a new matrix and then transpose it
A <- rbind(c(2,5,2),c(6,1,4))
A
t(A)
#returning to the original matrix
t(t(A))

#Identity Matrix
#you can create an identity matrix of any dimension using the standard matrix function, but you can also use diag
A <- diag(x=3)
A

# Scalar Multiple of a Matrix
# a scalar value is just a single, univariate value
#multiplication of any matrix A by a scalar value a results in a matrix in which every individual element is multiplied by a
#R performs this multiplication in an element-wise manner, Scalar multiplication of a matrix is carried out using the standard arithmetic * operator
A <- rbind(c(2,5,2),c(6,1,4))
a <- 2
a*A

#Matrix Addition and Substraction
#Addition and substraction of two matrices of equal size is also performed in an element-wise fashion. Coresponding elements are added aor substracted from one another. 
A <- cbind(c(2,5,2),c(6,1,4))
A
B <- cbind(c(-2,3,6),c(8.1,8.2,-9.8))
A-B

#Matrix Multiplication
#The standard * operator cannot be used. Instead you use R's matrix product operator, written with percent symbols as %*%.
#Does the number of columns in the first matrix match the number of rows in the second matrix?
A <- rbind(c(2,5,2),c(6,1,4))
dim(A)
B <- cbind(c(3,-1,1),c(-3,1,5))
dim(B)

A%*%B
B%*%A

#Matrix Inversion
#the R function solve is one option for inverting a matrix
A <- matrix(data=c(3,4,1,2), nrow=2, ncol=2)
A
solve(A)

#Multidimensional Arrays are possible in R but we will not discuss it because I rarely use them in bioinformatics.


#4 Non-Numeric Values
#4A) Logical Values (Boolean Values)

foo <- TRUE
foo
bar <- F
bar

# a vector can be filled with logical values
baz <- c(T,F,F,F,T,F,T,T,T,F,T,F)
baz
length(x=baz)

# Matrices can be created with these vlaues too
qux <- matrix(data=baz,nrow=3,ncol=4,byrow=foo)

#A Logical Outcome: Relational Operators
1==2
1>2
(2-1) <=2
1!=(2+3)

#relatinal operators uses element-wise behavious
foo <-c(3,2,1,4,1,2,1,-1,0,3)
bar <- c(4,1,2,1,1,0,0,3,0,4)
length(x=foo) == length(x=bar)

foo == bar
foo < bar
foo <= bar
foo <=(bar+10)

#vector recycling also applies to logicals
baz <- foo[c(10,3)]
baz

foo > baz

# you can also check all the values of a vector against a single value
foo <3

#let's rewrite the content of foo and bar as a 5x2 column-filled matrices
foo.mat <-matrix(foo,nrow=5,ncol=2)
foo.mat
bar.mat <- matrix(bar,nrow=5,ncol=2)
bar.mat

#same element-wise behaviour applies to matrices
foo.mat <= bar.mat
foo.mat<3

# when examining a vector, any returns TRUE if any logicals in the vector are TRUE and returns FALSE otherwise.
#The function all returns TRUE only if all of the logical are TRUE and returns FALSE otherwise.
qux <- foo==bar.mat
qux
any(qux)
all(qux)

quux <- foo <=(bar+10)
quux
any(quux)
all(quux)

#Multiple Comparisons: Logical Operators
# the result of any logical operator is a logical value

FALSE||((T&&True)||FALSE)
!TRUE&&TRUE
(T&&(TRUE||F))&&FALSE
(6<4)||3!=1)

#Some examples of element-wise comparison
foo <- c(T,F,F,F,T,F,T,T,T,F,T,F)
foo
bar <- c(F,T,T,T,F,F,F,F,T,T,T,T)
bar

foo&bar
foo|bar

#only on first pair in vectors
foo&&bar
foo||bar

#Logicals are Numbers
#True as 1 and False as 0
TRUE+TRUE
FALSE-TRUE
T+T+F+T+F+F+T

1&&1
1||0
0&&1

#Logical Subsetting and Extraction
myvec <- c(5,-2.3,4,4,4,6,8,10,40221,-8)
#extract the negative values
myvec[c(F,T,F,F,F,F,F,F,F,F,T)]
#finding negative elements
myvec<0
#use to subset
myvec[myvec<0]
#R recycles the flag vector if it's too short, to extract every second elemnt from myvec starting with the first
myvec[c(T,F)]
#do more complicated extractions using relatiional and logical operators
myvec[(myvec>0)&myvec<1000]
# can also overwite specific elements using logical flag vectors
myvec[myvec<0] <- -200

#The R function which takes in a logical vector as the argument x and returns the indexes corresponding to the positions of any and all TRUE entries
which(x=c(T,F,F,T,T))
#you can use this to identify the index positions of myvec that meet a certain condition
which(x=myvec<0)
#you can use which identify the numeris indexes you want to delete and render them negative
myvec[-which(x=myvec<0)]


#the same things can be done using matrices
A <- matrix(c(0.3,4.5,55.3,91,0.1,105.5,-4.2,8.2,27.9),nrow=3,ncol=3)
A
#to extract the second and third column elements of the  first row of A using logicals
A[c(T,F,F),c(F,T,T)]
#replace all elements less than one with -7
A[A<1] <- -7
A
#if you use which to identify numeric indexes based on a logical flag structure, you have to be a little morecareful when dealing with 2-D objects. 
A>25
which(x=A>25)
# laid out column by column, the indices make sense
#you can make which return dimension-specific indexes using the optional argument arr.ind (array indexes), treats the object as a matrix or array rather than a vector, providing yoiu with the row and column positions of the elements you requested
which(x=A>25,arr.ind=T)

#4B) Characters
#Creating a string
foo <- "This is a string!"
foo
length(x=foo)
# R treats a string as a single entity.
#To count the number of characters , you can use the nchar function
nchar(x=foo)
#almost any combination of characters, including numbers can be a string.
bar <-"23.3"
bar
# in this form, the string has no numeric meaning and it won't be treated like a number
bar*2
#strings can be compared in several ways, the most common comparison being a check for equality
"alpha"=="alpha"
"alpha"!="beta"
c("alpha", "beta", "gamma")=="beta"
# is one string greater based on alphabetical order?
"alpha"<="beta"
"gamma">"Alpha"
#uppercase letters are considered greater than lowercase letters
"Alpha">"alpha"
"beta">="bEtA"
#most symbols can also be used in a string, except for the backslash (escape).

#Concatenation
# there are two main functions to concatenate (glue together) one or more strings: cat and paste
# cat sends its output directly to the console screen and doesn't formally return anything
#paste concatentates its contents and then returns the final character string as a usable R object
qux <- c("awesome", "R", "is")
length(x=qux)
qux
cat(qux[2],qux[3],"totally",qux[1],"!")
paste(qux[2],qux[3], "totally", qux[1], "!")

# these functions have an optional argument sep, that's used as a seperator between strings as they're concatentated
paste(qux[2],qux[3],"totally",qux[1],"!",sep="---")
paste(qux[2],qux[3],"totally",qux[1],"!",sep="")
# R will insert a space by default in cat
cat("Do you think ",qux[2], " ",qux[3], " ",qux[1],"?", sep="")
#cat and paste can be used to neatly summarize results
a <- 3
b <- 4.4
cat("The value stored as 'a' is ",a,".",sep="")
paste("The value stored as 'b' is ",b,".",sep="")

#Escape Sequences
# the \ is used to invoke an escape sequence. An escape sequence lets you enter characters that control the format and spacing in a string, rather than being interpreted as normal text

cat("here is a string\nsplit\tto new\b\n\n\tlines")

# want a normal \ or "?
cat("I really want a backclash: \\\nand a double quote: \"")
#FOLDER seperation MUST use a forward slash / and not a backslash

#Substrings and Matching
#pattern matching lets you inspect a given string to identify smaller strings within it
#the function substr takes a string x and extracts the part of the string between two character positions (inclusive), indicated with numbers passed as start and stop arguments
foo <- "this is a character string!"
substr(x=foo,start=21,stop=27)

#substr can also be used with the assignment operator to directly substitute in a new set of characters
substr(x=foo,start=1,stop=4) <- "Here"
foo
#the sub function searches a given string a for a smaller string pattern contained within. It then replaces the first instance with a new string, given as the argument replacement
#gsub does the same thing, but it replacesevery instance of the pattern

bar <- "How much wood chould a woodchuck chuck"
sub(pattern="chuck",replacement"hurl",x=bar)
gsub(pattern="chuck",replacement="hurl",x=bar)


#4C FActors
# Identifying Categories
#suppose you find eight people and record thier first name, sex, and month of birth.
firstname <- c("Liz","Jolene","Susan","Boris","Rochelle","Tim","Simon","Amy")
sex.num <- c(0,0,0,1,0,1,1,0)
sex.char <- c("female","female","female","male","female","male","male","female")
#factors are typically creates from a numeric or a character vector
sex.num.fac <- factor(x=sex.num)
sex.num.fac
sex.char.fac <- factor(x=sex.char)
sex.char.fac
# you can extract the levels as a vector of character strings using the levels function
levels(x=sex.num.fac)
levels(x=sex.char.fac)
#you can also relabel a factor using levels
levels(x=sex.num.fac) <- c("1", "2")
sex.num.fac
#factor-valued vectors are subsetted in the same way as any other vector
sex.char.fac[2:5]
sex.char.fac[c(1:3,5,8)]
#if you want to subset from a factor using a logical flag vector, keep in mind that the levels of a factor are stored as character strings, even if the original data vector was numeric, so you need to use a string when requesting or testing for a particular level
#ID all men
sex.num.fac=="2"
firstname[sex.char.fac=="male"]

#DEfining and Ordering Levels
#Some factors with levels can be logically ordered, for example, month of birth, where there are 12 levels that have a natural order
mob <- c("Apr","Jan","Dec","Sep","Nov","Jul","Jul","Jun")
#2 problems: not all possible categories are represented and the vector does not reflect the natural order of the months
mob[2]
mob[3]
mob[2]<mob[3]

#you can handle these problems by adding additional arguments to the factor function.
# you can define additional levels by supplying a character vector of all possible values to the levels argument and then instruct R to order the values precisely as they appear in levels by setting the argument ordered to TRUE
ms <- c("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")
mob.fac <- factor(x=mob,levels=ms,ordered=TRUE)
mob.fac

mob.fac[2]
mob.fac[3]
mob.fac[2]<mob.fac[3]

#Combining and Cutting
#the c function doesn't work the same way with factor-values vectors
new.values <- factor(x=c("Oct","Feb","Feb"), levels=levels(mob.fac),ordered=TRUE)
new.values
#try using c
c(mob.fac,new.values)
#c function interprets factors as integers
#comparing this with the defined levels you can see that the numbers refer to the index of each month within the ordered levels
levels(mob.fac)
#you use these integers with levels(mob.fac) to retrieve character vector of the complete observed data
levels(mob.fac)[c(mob.fac,new.values)]
#Now you have all the observation stored in a vector, but they are currently stored as strings, not factor values
mob.new <-levels(mob.fac)[c(mob.fac,new.values)]
mob.new.fac <- factor(mob.new,levels=levels(mob.fac),ordered=TRUE)
mob.new.fac


# factors are also often created from data that was originally measured on a continuum
Y <- c(0.53,5.4,1.5,3.33,0.45,0.01,2,4.2,1.99,1.01)
# bin the data in intervals of small, medium, and large
br <- c(0,2,4,6)
cut(x=Y,breaks=br)
cut(x=Y, breaks=br,right=F)
cut(x=Y,breaks=br,right=F,include.lowest=T)
lab <- c("Small", "Medium", "Large")
cut(x=Y,breaks=br,right=F,include.lowest=T,labels=lab)




#5) Lists and Dataframes
#5A) Lists of Objects
#Definition and Component Access
foo <- list(matrix(data=1:4,nrow=2,ncol=2),c(T,F,T,T), "hello")
foo
# you save a matrix, a vector and a character string to a list
#how many items are in the list?
length(x=foo)
#you can retrieve components from a list using indexes, which are entered in double square brackets
foo[[1]]
foo[[3]]
# this is called member reference. When you've retrieved a component this way, you can treat it just like a stand-alone object in the workspace
foo[[1]] + 5.5
foo[[1]][1,2]
foo[[1]][2,]
cat(foo[[3]],"you!")

#to overwrite a member of foo, use the assignment operator
foo[[3]]
foo[[3]] <- paste(foo[[3]],"you!")
foo

#list splicing which lets you select multiple list items at once
bar <- foo[c(2,3)]

#Naming
#you can name list components, the name is an R attribute
names(foo) <- c("mymatrix", "mylogicals", "mystring")
foo
#you can perform member referencing using these names and the dollar operator rather than the double square brackets
foo$mymatrix
foo[[1]]

#subsetting named members also works the same way
all(foo$mymatrix[,2]==foo[[1]][,2])
#naming while creating the list
baz <- list(tom=c(foo[[2]],T,T,T,F), dick="g'day mate", harry=foo$mymatrix)
baz
names(baz)


#Nesting
#a member of a list can be a list itself.
#when nesting lists, it's important to keep track of the depth of any member for subsetting or extraction later
baz$bobby <- foo
baz
#names and indexes are now double layered
baz$bobby$mylogicals[1:3]
baz[[4]][[2]][1:3]
baz[[4]]$mylogicals[1:3]

#5B DAtaframes
#there is no restriction on the type of data that can be in a dataframe
#in a dataframe, the members must all be vectors of equal length
#Construction
mydata <- data.frame(person=c("Peter","Lois","Meg","Chris","Stewie"), age=c(42,40,17,14,1),sex=factor(c("M","F","F","M","M")))
mydata
#extract portions of the data by specifying row and column index positions
mydata[2,2]
mydata[3:5,3]
mydata[,c(3,1)]
#you can also use the names of the vectors to access variables even if you don't know their column index positions
mydata$age
#you can subset this
mydata$age[2]
#you can report the size of a dataframe -- the number of records and variables -- just like with a matrix
nrow(mydata)
ncol(mydata)
dim(mydata)
#R's default behavior for character vectors passed to data,frame is to convert each variable into a factor object
mydata$person
#to prevent automatic conversion of character strings to factors when using data.frame, set the optional argument stringsAsFactors to FALSE
mydata <- data.frame(person=c("Peter","Lois","Meg","Chris","Stewie"),age=c(42,40,17,14,1), sex=factor(c("M","F","F","M","M")),stringsAsFactors=FALSE)
mydata
mydata$person

#Adding Data Columns and Combining Data Frames
#use rbind and cbind
newrecord <-data.frame(person="Brian", age=7, sex=factor("M",levels=levels(mydata$sex)))
newrecord
mydata <-rbind(mydata,newrecord)
#adding a column
funny <- c("High","High","Low","Med","High","Med")
funny <- factor(x=funny,levels=c("Low", "Med", "High"))
funny
mydata <- cbind(mydata,funny)
mydata
#you can also add to dateframe using the dollar sign operator
mydata$age.mon <- mydata$age*12
mydata

#Logical Record Subseting

#you want to see all records corresponding to males
mydata$sex=="M"
mydata[mydata$sex=="M"]

## you can use the same behaviour to pick and choose which variables to return in the subset
mydata[mydata$sex=="M",-3]
mydata[mydata$sex=="M",c("person","age","funny","age.mon")]
#the logical flag vector you place in the square brackets just has to match the number of records in the dataframe
mydata[mydata$age>10|mydata$funny=="High",]
#sometimes it could yeild no records
mydata[mydata$age>45,]


#6) Special Values, Classes, and Coercion
#6A) Some Special Values
#Infinity
#R imposes limits on how extreme a number can be before the software cannot reliably represent it.
#When a number is too large for R to represent, the value is deemed to be infinite
#represented by special value Inf, which is case sensitive
#it represents a numeric value and is associated only with numeric vectors
foo <- Inf
foo
bar <- c(3401,Inf,3.1,-555,Inf,43)
bar
baz <- 90000^100
baz

# you can have negative infinity
qux <- c(-42,565,-Inf,-Inf,Inf,-45632.3)
qux
Inf*-9
# if you add or multiply infinity, you also get infinity as a result
Inf+1
4*-Inf
-45.2-Inf 
Inf+Inf
Inf/23
#zero and infinity go hand in hand when it comes to division
-59/Inf
-59/-Inf
#any non-zero value divided by zero will result in infinity
-59/0
Inf/0
#detecting infinite values in a data structure
qux
is.infinite(x=qux)
is.finite(x=qux)
#relational operators function normally
-Inf/Inf
Inf>Inf
qux==Inf
qux==-Inf

#NaN
#in some situations, it is impossible to express the result of a calculation using a number, Inf or -Inf
# these difficult-to-quantify special values are labeled NaN (Not a Number)
#NaN is only associated with numeric observations
foo <- NaN
foo
bar <- c(NaN,54.3,-2,NaN,90094.123,-Inf,55)
bar
# if you attempt to cancel representation of Inf in any waym the result is NaN
-Inf+Inf
Inf/Inf
#NaN results when zero is divided by zero
0/0
#any math operation involving NaN will simply result in NaN
NaN+1
#is.nan is used to detect the presence of NaN values. Relational operators cannot be used with NaN
bar 
is.nan(x=bar)
!nan(x=bar)
is.nan(x=bar)|is.infinite(x=bar)
bar[-(which(is,nan(x=bar)|is.infinite(x=bar)))]



#NA
#data often contains missing values
#R uses a special term to represent missing values,NA (Not Available)
#not the same a NaN
#missing values can occur for any type of observation
foo <- c("character","a",NA,"with","string",NA)
foo
bar <- factor(c("blue",NA,NA,"blue","green","blue",NA,"red","red",NA,"green"))
bar
baz <- matrix(c(1:3,NA,5,6,NA,8,NA),nrow=3,ncol=3)
baz
#the is.na function can be used to find NA in an object
qux <- C(NA,5.89,Inf,NA,9.43,-2.35,NaN,2.10,-8.53,-7.58,NA,-4.58,2.01,NaN)
qux
is.na(x=qux)
which(x=is.nan(x=qux))
which(x=(is.na(x=qux)&!is.nan(x=qux)))
#the na.omit function will take the structure and delete all the NAs from it, it will also apply to NaN if the elements are numeric
quux <- na.omit(object=qux)
#similar to NaN, arithmetic calculations with Na result in NA, same with relational operators
3+2.1*NA-4
3*c(1,2,NA,NA,NaN,6)
NA>76


#NULL
#used to explicitly define an "empty" entity, which is different from a "missing" entity specified with NA
foo <- NULL
foo
bar <- NA
bar
# bar has an index position while foo does not
c(2,4,NA,8)
c(2,4,NULL,8)
#Null cannot take a position in a vector
c(NA,NA,NA)
c(NULL,NULL,NULL)
#the is.null function is used to check whether something is explicitly NULL. Suppose you have an optional argument named opt.arg and that, if supplied, opt.arg should be a character vector of length 3
opt.arg <- c("string1","string2","string3")
is.na(x=opt.arg)
is.null(x=opt.arg)
#if the argument is empty, using NULL over Na for the check is better
opt.arg <- c(NA,NA,NA)
is.na(x=opt.arg)
opt.arg <- c(NULL,NULL,NULL)
is.null(x=opt.arg)

#the empty NULL has an interesting effect if it's included in arithmatic or relational comparisons
NULL+53
53<=NULL
#the result is an "empty" vector of a type determined by the nature of the operation attempted. NULL dominates any arithmetic, even if it includes other special values
NaN-Null+NA/Inf
#NULL also occur naturally when examining lists and dataframes
foo <- list(member1=c(33,1,5.2,7), member2="NA or NULL?")
foo
foo$member3
# the result of NULL signals that a member called member3 in foo doesn't exist and is empty and can be filled with whatever you want
foo$member3 <- NA
foo
#the same thing applies to querying a dataframe for nonexistent columns or variables using the dollar operator



#6B) Understanding Types,Classes, and Coercion
#Attributes
# each R object you create has additional information about the nature of the object itself, referred to as attributes
#in general, you can think of attributes as either explicit or implicit. 
#Explicit attributes are immediately visible to the user, while R determined implicit attributes internally
#you can print explicit attributes for a given object with attributes function
foo <-matrix(data=1:9,nrow=3,ncol=3)
foo
attributes(foo)
#if you know he name of the attribute you can use attr
attr(x=foo,which="dim")
#gives same answer as 
dim(foo)
#attribute-specific commands are useful because they also allow access to implicit attribute, which, while still controllable by the user, are set automatically by the software
#names and levels functions are also both attribute-specific functions
#explicit attributes are often optional; if they aren't specified, they are set to NULL
bar <- matrix(data=1:9,nrow=3,ncol=3,dimnames=list(c("A","B","C"),c("D","E","F")))
bar
attributes(bar)
dimnames(bar)

#some attributes can be modified after an object has been created
dimnames(foo) <- list(c("A","B","C"),c("D","E","F"))

#Object Class
# an object's class is one of the most useful attributes for describing an entity in R
#every object has at least one class
#Stand-Alone Vectors
num.vec1 <- 1:4
num.vec1
num.vec2 <- seq(from=1,to=4,length=6)
num.vec2
char.vec <- c("a","few","strings","here")
char.vec
logic.vec <- c(T,F,F,F,T,F,T,T)
logic.vec
fac.vec <- factor(c("Blue","Blue","Green","Red","Green", "Yellow"))
fac.vec
#check their class
class(num.vec1)
class(num.vec2)
class(char.vec)
class(logic.vec)
class(fac.vec)
#Other Data Structures
num.mat1 <- mtrix(data=num.vec1,nrow=2,ncol=2)
num.mat1
num.mat2 <- matrix(data=num.vec2,nrow=2,ncol=3)
num.mat2
char.mat <- matrix(data=char.vec,nrow=2,ncol=2)
logic.mat <- matrix(data=logic.vec,nrow=4,ncol=2)
logic.mat
#check the class
class(num.mat1)
class(num.mat2)
class(charmatch)
class(logic.mat)
#Multiple Classes
ordfac.vec <- factor(x=c("Small","Large","Large","Regular","Small"), levels=c("Small","Regular","Large"),ordered=TRUE)
ordfac.vec
class(ordfac.vec)

#Is-Dot Object-Checking Functions
#to check whether the object is a specific class or data type, you can use is-dot functions on the object and it will return a TRUE or FALSE logical value
num.vec1 <- 1:4
num.vec1
is.integer(num.vec1)
is.numeric(num.vec1)
is.matrix(num.vec1)
is.data.frame(num.vec1)
is.vector(num.vec1)
is.logical(num.vec1)

#As-Dot Coercion Functions
#converting from one object or data type to another is referred to as coercion.
#coercion is performed either implicitly or explicitly.
#Implicit coercion occurs automatically when elements need to be converted to another type in order for an operation to complete
1:4+c(T,F,F,T)
#Implicit coercion also happens when you use paste or cat to glue together character strings
foo <- 34
bar <-T
paste("Definitely foo: ",foo,";definitely bar: ",bar,".",sep="")
#explicit coercion happens in other situation by the user using as-dot functions
as.numeric(c(T,F,F,T))
1:4+as.numeric(c(T,F,F,T))
foo <- 34
foo.ch <- as.character(foo)
bar <- T
bar.ch <- as.character(bar)
bar.ch
paste("Definitely foo: ",foo.ch,"; definitely bar ",bar.ch,".",sep="")
#coercion only works if it makes sense
as.numeric("32.4")
as.numeric("g'day mate")
#changing number to logicals
as.logical(as.numeric(c("1","0","1","0","0")))
#not all data-type coercion is easy. FActors are trickier because R treats the levels as integers
baz <- factor(x=c("male","male","female","male"))
baz
as.numeric(baz)
#internally the level of a given factors are actually labelled as level 1, level 2, etc...
quz <- factor(x=c(2,2,3,5))
qux
as.numeric(qux)
# coercion can let you store the contents of a matrix as a single vector
foo <- matrix(date=1:4,nrow=2,ncol=2)
foo
as.vector(foo)

#7) Basic Plotting
# I'm not going to go through examples of this because you can use the built-in plotting tools or contributed tools like ggplot2.
# I prefer to do complex stats in R then save the dataframes as csv and plot in Python because the figures tend to look better and are easier to construct in Python for me.

#8) Reading and Writing Files
#8A) R-Ready Data Sets
#Built-in DAta Sets
#there are many datasets that are contained within the built-in automatically loaded package datasets
library(help="datasets")
#Contributed DAta SEts
#other datasets are available in contributed packages
library("tseries")
#8B REading in External DAta Files
#The Table Format
# you need a header, delimiter and missing values
# typically the files are .txt or .csv files
mydatafile <- read.table(file="path to file", header=TRUE, sep=" ", na.strings="*", stringsAsFactors=FALSE)
mydatafile
#Spreadsheet Workbooks
spread <-read.csv(file="path to file", header=FALSE,stringsAsFactors=TRUE)
#Web-BAsed Files
dia.url <- "URL"
diamonds <- read.table(dia.url)
#Other File Formats can also be inputted

#8C) Writing out Data Files and Plots
write.table(x=mydatafile, file="path and name of new file", sep="@", na="??",quote=FALSE, row.names=FALSE)
#Plots and Graphic Files
jpeg(filename="path and name of new file",width=600,height=600)
plot(1:5,6:10,ylad="a nice ylab",xlab="here's an xlab", main="a saved .jpeg plot")
points(1:5,10:6,cex=2,pch=4,col=2)
dev.off()
#can save as pdf with same format, switch jpeg with pdf
#can use ggsave with ggplot2
foo <- c(1.1,2,3.5,3.9,4.2)
bar <- c(2,2.2,-1.3,0,0.2)
qplot(foo,bar,geom="blank")
  +geom_point(size=3,shape=8,color="darkgreen")
  +geom_line(color="orange",linetype=4)
ggsave(filename="path and name of file")

#8D) Ad Hoc Object REad/Write Operations
somelist <- list(foo=c(5,2,45), bar=matrix(data=c(T,T,F,F,F,F,T,F,T),nrow=3,ncol=3), baz=factor(c(1,2,2,3,1,1,3),levels=1:3,ordered=T))
somelist
dput(x=somelist,file="myRobject.txt")
newobject <- dget(file="myRobject.txt")
newobject
