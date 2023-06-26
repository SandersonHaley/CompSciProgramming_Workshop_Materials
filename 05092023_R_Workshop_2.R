install.packages("car")

#Part II: Programming


#9) Calling Functions
#9A) Scoping
#R's scoping rules determine how the language compartmentalizes objects and retrieves them in a given session.
#It defines the situations in which duplicate object names can exist at once

#Environments
#R enforces scoping rules with virtual environments, separate compartments where data structures and functions are stored.
#They allow R to distinguish between identical names that are associated with different scopes and therefore stored in different environments
#Environments are dynamic entities -- new environments can be created , and existing environments can be manipulated or removed

#Global Environments
#the compartment set aside for user-defined objects
#every object you've created or overwritten so far has resided in the global environment of your current global environment
#starting with a new workspace, do this:
foo <- 4+5
bar <- "stringtastic"
ls()

#Package Environments and Namespaces
# package environmental are loosely referring to the items made available by each package in R
#A package namespace essentially defines the visibility of its functions
# A package can have visible functions that a user is able to use and invisible functions that provide internal support to visible functions
#another part of the package environment handles imports designations, dealing with any functions or objects from other libraries that the package needs to import for its own functionality
#you can think of all ready-to-use functions and objects as belonging to specific package environments
#the same is true for the functions and objects any contributed packages you've explicitly loaded with library.
#You can use ls to list the items in a package environment:
ls("package:graphics")

#Local Environments
#each time a function is called in R, a new environment is created called the local environment or lexical environment
#this environment contains all the objects and variables created in and visible to the function, including any arguments you've supplied to the function upon execution.
#This feature allows the presence of argument names that are identical to other object names accessible in a given workspace
youthspeak <-matrix(data=c("OMG","LOL","WTF","YOLO"), nrow=2,ncol=2)
youthspeak
#calling this function creates a local environment containing the data vector
#when you execute the function, it begins by looking for data in this local environment, if it isn't there it widens the search.
#once the function has completed, this local environment is automatically removed.

#Search Path
# the search path is basically a list of the environments that R will search when an object is requested. 
search()
#you can look up the enclosing environment of any function using environment.
environment(seq)
environment(arrows)
# After loading a package you can see it enter the search path
library("car")
search()
# R stops searching once it exhausts the search path and reaching the empty environment.
#if what you are looking for isn't there you get an error
neither.here()
nor.there()

#Reserved and Protected Names
#a few key terms are strictly forbidden from being used as object names.
#These reserved names are necessary in order to protect fundamental operations and data types frequently used in the langauge.
# if and else
# for, while, and in
# function
# repeat,break, and next
# TRUE and FALSE
# Inf and -Inf
# NA, NaN, and NULL
# if you try to assign a new value to any of these reserved terms, an error occurs
NaN <- 5
# R is case sensitive so it is possible to assign values to any case-variant of the reserved names, but this is confusing so don't do it
False <- "confusing"
nan <- "This is"
cat(nan,False)

#also try not to assign values to T and F
T <- 42
F <- TRUE
F&&TRUE
# if you are following along, time to clear the global environment, use the rm function
ls()
rm(list=ls())
ls()


#9B Argument Matching
#Argument matching conditions allow you to provide arguments to functions either with abbreviated names or without names at all

#Exact
# you've been using exact matching so far, where the argument tag is written out in full
# Benefits to exact matching:
#Less prone to mis-specification of arguments than other matching styles
#order in which arguments are supplied does not matter
#useful when a function has many possible arguments but you want to specify only a few
# Main drawbacks of exact matching:
#cumbersome for relatively simple operations
#requires the user to remember or look up the full, case-sensistive tags

bar <- matrix(data=1:9,nrow=3,ncol=3,dimnames=list(c("A","B","C"),c("D","E","F")))
bar

#Partial
#partial matching lets you identify arguments with an abbreviated tag
bar <- matrix(nr=3,di=list(c("A","B","C"), c("D","E","F")),nc=3,dat=1:9)
# no set limit for characters as long at the tag is still identifiable
#partial matching benefits
#requires less code than exact matching
#argument tags are still visible
#order of supplied arguments still doesn't matter
#however, it gets trickier if there are multiple arguments whose tags start with the same letter
#Drawbacks of partial matching
# user must be aware of other potential arguments that can be matched by the shortened tag
#each tag must have a unique identification, which can be difficult to remember

#Positional
#you supply arguments without tags and R inteprets them based solely on their order
#must be aware of the precise positions of each argument
args(matrix)
bar <- matrix(1:9,3,3,F,list(c("A","B", "C"),c("D","E","F")))
bar
#Benefits of positional matching
#shorter,cleaner code, particularly for routine tasks
# no need to remember specific argument tags
#Drawbacks
#you must look up and exactly match the defined order of arguments
#reading code written by someone else can be more difficult, especially when it includes unfamiliar functions

#Mixed
bar <- matrix(1:9,3,3,dim=list(c("A","B","C"),c("D","E","F")))

#Dot-Dot-Dot: Use of Ellipses
# many functions exhibit variadic behaviours, they can accept any number of arguments and it's up to the user to decide how many arguments to provide
# this flexibility in R is achieved through the special dot-dot-dot designation (...;ellipsis)
args(data.frame)
#if a function is defined with the ellipsis , any argument that aren't matched to other argument tags are matched to the ellipsis
#two groups of functions: 1) where the ellipssis always represents the "main ingredients" in the function 2) functions where the ellipsis is meant as a supplementary or potential repository of optional arguments 
args(plot)


#10) Conditions and Loops
#10A) if Statements
#Stand-Alone Statement
a <- 3
mynumber <- 4
if(a<=mynumber){a <- a^2}
a
# the if statement offers a huge amount of flexibility -- you can place any kind of code in the braced area, including more if statements, enabling your program to make a sequence of decisions

#else Statements
a <- 3
mynumber <- 4
if(a<=mynumber){cat("Condition was",a<=mynumber) a<- a^2} else {cat("Condition was",a<=mynumber)a <- a-3.5}
a

#Using ifelse for Element-wise check
#an if statement can check the condition of only a single logical value.
#ifelse can perform this kind of vector-oriented check in relatively simple cases

x <- 5
y <- -5:5
y

result <- ifelse(test=y==0,yes=NA,no=x/y)
result

#Nesting and Stacking Statements
# an if statement can itself be placed within the outcome of another if statement
#by nesting or stacking several statements, you can weave intricate paths of decision-making by checking a number of conditions at various stages during execution
if(a<=number){
  cat("First condition was TRUE\n") 
  a <- a^2 
  if(mynumber>3){
    cat("Second condition was TRUE") 
    b <- seq(1,a,length=mynumber)
    }else{
      cat("Second condition was FALSE") 
      b <- a*mynumber
      }
} else {
    cat("First condition was FALSE\n") 
    a <- a-3.5 
    if(mynumber>=4){
      cat("Second condition was TRUE") 
      b <- a^(3-mynumber)
    } else{
        cat("Second condition was FALSE") 
      b <- rep(a+mynumber,times=3)}}
a
b
#you can get the same results by stacking if statements 
if(a<=mynumber && mynumber>3){
  cat("Same as 'first condition TRUE and second TRUE'") 
  a <- a^2 
  b <- seq(1,a,length=mynumber)
} else if(a<=mynumber && mynumber<=3){
    cat("Same as 'first condiditon TRUE and second FALSE") 
    a <-a^2 
    b <- a*mynumber
} else if(mynumber>=4){
    cat("Same as 'first condition FALSE and second TRUE'") 
    a <- a-3.5 
    b <- a^(3-mynumber)
} else{
    cat("Same as 'first condition FALSE and second FALSE") 
      a <- a-3.5 
      b <- rep(a+mynumber,times=3)} 
a
b

#The Switch Function
#choose which code to run based on the value of a single object.
mystring <- "Lisa"
foo <- switch(EXPR=mystring,Homer=12,Marge=34,Bart=56,Lisa=78,Maggie=90,NA)
foo


# the integer version of switch works in a slightly different way. Instead of using tags, the outcome is determined purely by positional matching
mynum <- 3
foo <- switch(mynum,12,34,56,78,NA)
foo


#10B Coding Loops
#for Loops
for(myitem in 5:7){
  cat("--BRACES AREA BEGINS--\n")
  cat("the current item is",myitem,"\n")
  cat("--BRACED AREA ENDS--\n\n")}

#you can use loops to manipulate objects that exist outside the loop
counter <- 0
for(myitem in 5:7){
  counter <- counter+1
  cat("The item in run",counter,"is",myitem,"\n")}

#Looping via Index or Value
#note the difference between using the loopindex to directly represent elements in the loopvector and using it to represent indexes of a vector
myvec <- c(0.4,1.1,0.34,0.55)
for(i in myvec){print(2*i)}
for (i in 1:length(myvec)){print(2*myvec[1])}

#suppose you want to write some code to inspect any list object and gather information about any matrix objects stored as members in the list
foo <- list(aa=c(3.4,1),bb=matrix(1:4,2,2),cc=matrix(c(T,T,F,T,F,F),3,2),dd="string here", ee=matrix(c("red","green", "blue", "yellow")))
foo
#first create some vectors that store information about the list members
name <- names(foo)
name
is.mat <- rep(NA,length(foo))
is.mat
nr <- is.mat
nc <- is.mat
data.type <- is.mat

#then make your for loop
for(i in 1:length(foo)){
  member <- foo[[i]]
  if(is.matrix(member)){
    is.mat[i] <- "Yes"
    nr[i] <- nrow(member)
    nc[i] <- ncol(member)
    data.type[i] <- class(as.vector(member))
  } else {is.mat[i] <- "No"}
}
bar <- data.frame(name,is.mat,nr,nc,data.type,stringsAsFactors=FALSE)
bar

#Nesting for loops
#you can nest for loops, just like if statements
#the inner loop is executed in full before the outer loop loopindex is incremented
loopvec1 <- 5:7
loopvec1
loopvec2 <- 9:6
loopvec2
foo <- matrix(NA,length(loopvec1),length(loopvec2))
foo
for(i in 1:length(loopvec1)){
  for(j in 1:length(loopvec2)){
    foo[i,j] <- loopvec1[i]*loopvec2[j]
  }
}
foo

#inner loopvectors can even be defined to match the current value of the loopindex of the outer loop
foo<- matrix(NA,length(loopvec1), length(loopvec2))
foo
for(i in 1:length(loopvec1)){
  for(j in 1:i){
    foo[i,j] <- loopvec1[i]+loopvec2[j]
  }
}
foo


#while Loops
myval <- 5
while(myval<10){
  myval <- myval+1
  cat("\n'myval' is now",myval,"\n")
  cat("'mycondition' in now",myval<10,"\n")
}

# it is often useful to set the loopcondition to be a seperate object so that you can modify it as necessary within the braced area.
mylist <- list()
counter <- 1
mynumbers <- c(4,5,1,2,6,2,4,6,6,2)
mycondition <- mynumbers[counter]<=5
while(mycondition){
  mylist[[counter]] <- diag(mynumbers[counter])
  counter <- counter+1
  if(counter<=length(mynumbers)){
    mycondition <- mynumbers[counter]<=5
  } else {
    mycondition <- FALSE
  }
}
mylist

#Implicit Looping with apply
# you can avoid some of the details associated with explicit looping by using the apply function.
# the apply function is the most basic form of implicit looping -- it takes a function and applies it to each margin of an array
foo <- matrix(1:12,4,3)
sum(foo)

row.totals <- rep(NA,times=nrow(foo))
for(i in 1:nrow(foo)){
  row.totals[i] <- sum(foo[i,])
}
row.totals

row.totals2 <- apply(X=foo,MARGIN=1,FUN=sum)
row.totals2

#if you want columns instead of rows
apply(X=foo,MARGIN=2,FUN=sum)

#tapply is the same idea by applying to the whole dataset
#lapply can operate member by member in a list
#sapply returns the same results as lapply but in an array form
#mapply can operate on multiple vectors or list at the same time
# all R apply function allow for additional arguments to be passed to FUN; most of them do this via ellisis

#10C) Other Control Flow Mechanisms
#Declaring break or next
# you can preemptively terminate a loop by declaring break
foo <- 5
bar <- c(2,3,1.1,4,0,4.1,3)
#break to terminate the loop if something returns FALSE
loop1.result <- rep(NA,length(bar))
loop1.result
for(i in 1:length(bar)){
  temp <- foo/bar[i]
  if(is.finite(temp)){
    loop1.result[i] <- temp
  } else {
      break
    }
}
loop1.result

# instead of breaking and completely ending a loop, you can use next to simply advance to the next iteration and continue execution
loop2.result <- rep(NA,length(bar))
loop2.result
for(i in 1:length(bar)){
  if(bar[i]==0){
    next
  }
  loop2.result[i] <- foo/bar[i]
}
loop2.result

#note that if you use either break or next in a nested loop, the command will apply only to the innermost loop

#The repeat Statement
# another option for repeating a set of operation 
fib.a <- 1
fib.b <- 1
repeat{
  temp <- fib.a+fib.b
  fib.a <- fib.b
  fib.b <- temp
  cat(fib.b,", ",sep="")
  if(fib.b>150){
    cat("BREAK NOW...\n")
    break
  }
}



#11) Writing Functions
#11A) the function Command
#to define a function, use the function command and assign the results to an object name, then you can call the function using that object name
#Function Creation

myfib <- function(){
  fib.a <- 1
  fib.b <-1
  cat(fib.a,",",fib.b,", ",sep="")
  repeat{
    temp <- fib.a+fib.b
    fib.a <- fib.b
    fib.b <- temp
    cat(fib.b,", ",sep="")
    if(fib.b>150){
      cat("BREAK NOW...")
      break
    }
  }
}
#before you can call the function you need to send it to console to import the function into the workspace
#this step is required anytime you create or modify a function and want to use it from the command prompt

myfib()

#Adding Arguments
myfib2 <- function(thresh){
  fib.a <- 1
  fib.b <- 1
  cat(fib.a,",",fib.b,", ",sep="")
  repeat{
    temp <- fib.a+fib.b
    fib.a <- fib.b
    fib.b <- temp
    cat(fib.b,", ",sep="")
    if(fib.b>thresh){
      cat("BREAK NOW...")
      break
    }
  }
}

myfib2(thresh=150)

#here is the function that stores the sequence in the vector and return is
myfib3 <- function(thresh){
  fibseq <- c(1,1)
  counter <- 2
  repeat{
    fibseq <- c(fibseq,fibseq[counter-1]+fibseq[counter])
    counter <- counter+1
    if(fibseq[counter>thresh]){
      break
    }
  }
  return(fibseq)
}

myfib3(150)
foo <- myfib3(10000)
foo
bar <- foo[1:5]
bar

#Using return
# if there is no return statement inside a function, the function will end when the last line in the body code has been run, at which point it will return the most recent assigned of created object in the function
dummy1 <- function(){
  aa <- 2.5
  bb <- "string me along"
  cc <- "string 'em up"
  dd <- 4:8
}

dummy2 <- function(){
  aa <- 2.5
  bb <- "string me along"
  cc <- "string 'em up"
  dd <- 4:8
  return(dd)}

# if you import and run the two functions, both provide the same return object
foo <- dummy1()
foo
bar <- dummy2()
bar

# the function will end as soon as it evaluates a return command, without executing any remaining code in the function body

#11B Arguments
#Lazy Evaluation
#refers to the fact that expressions are evaluated only when they are needed
multiples1 <- function(x,mat,str1,str2){
  matrix.flags <- sapply(x,FUN=is.matrix)
  if(!any(matrix.flags)){
    return(str1)
  }
  indexes <- which(matrix.flags)
  counter <- 0
  result <- list()
  for(i in indexes){
    temp <- x[[i]]
    if(ncol(temp)==nrow(mat)){
      counter <- counter+1
      result[[counter]] <- temp%*%mat
    }
  }
  if(counter==0){
    return(str2)
  } else{
    return(result)
  }
}

#import and then test the function using 3 lists
foo <- list(matrix(1:4,2,2), "not a matrix", "definitely not a matrix",matrix(1:8,2,4),matrix(1:8,4,2))
bar <- list(1:4, "not a matrix",c(F,T,T,T),"??")
baz <- list(1:4,"not a matrix",c(F,T,T,T),"??",matrix(1:8,2,4))

multiples1(x=foo,mat=diag(2),str1="no matrices in 'x'", str2="matrices in 'x' but none of appropriate dimensions given 'mat'")
multiples1(x=bar,mat=diag(2),str1="no matrices in 'x'", str2="matrices in 'x' but none of appropriate dimensions given 'mat'")
multiples1(x=baz,mat=diag(2),str1="no matrices in 'x'", str2="matrices in 'x' but none of appropriate dimensions given 'mat'")

# in this function, str1 and str2 are required only when the input list doesn't have suitable matrices, so you could lazily ignore providing values for these argument when x=foo
multiples1(x=foo,mat=diag(2))

#Setting Defaults
multiples2 <- function(x,mat,str1="no valid matrices", str2=str1){
  matrix.flags <- sapply(x,FUN=is.matrix)
  if(!any(matrix.flags)){
    return(str1)
  }
  indexes <- which(matrix.flags)
  counter <- 0
  result <- list()
  for(i in indexes){
    temp <- x[[i]]
    if(ncol(temp)==nrow(mat)){
      counter <- counter+1
      result[[counter]] <- temp%*%mat
    }
  }
  if(counter==0){
    return(str2)
  }else{
    return(result)
  }
}

multiples2(foo,mat=diag(2))
multiples2(bar,mat=diag(2))
multiples2(baz,mat=diag(2))


# Checking for Missing Arguments
#you can use missing to avoid the error in multiples1, when str1 was required but not supplied
multiples3 <- function(x,mat,str1,str2){
  matrix.flags <- sapply(a,FUN=is.matrix)
  if(!any(matrix.flags)){
    if(missing(str1)){
      return("'str1' was missing, so this is the message")
    }else{
      return(str1)
    }
  }
  indexes <- which(matrix.flags)
  counter <- 0
  result <- list()
  for(i in indexes){
    temp <- x[[i]]
    if(ncol(temp)==nrow(mat)){
      counter <- counter+1
      result[[counter]] <- temp%*%mat
    }
  }
  if(counter==0){
    if(missing(str2)){
      return("'str2' was missing, so this is the message")
    } else {
      return(str2)
    }
  } else {
    return(result)
  }
}

multiples3(foo,diag(2))
multiples3(bar,diag(2))
multiples3(baz,diag(2))

#dealing with Ellipses
# the ellipsis is often (but not always) placed in the last position because it represents a variable number of arguments
myfibplot <- function(thresh,plotit=TRUE,...){
  fibseq <- c(1,1)
  counter <- 2
  repeat{
    fibseq <- c(fibseq,fibseq[counter-1]+fibseq[counter])
    counter <- counter+1
    if(fibseq[counter]>thresh){
      break
    }
  }
  if(plotit){
    plot(1:length(fibseq),fibseq,...)
  }else{
    return(fibseq)
  }
}
myfibplot(150)
myfibplot(150,type="b",pch=4,lty=2,main="Terms of the Fibonacci sequence",ylab="Fibonacci Number",xlab="Term (n)")

#11C) Specialized Functions
# Helper Functions
# general term used to describe functions written and used specifically to facilitate the computations carried out be another function
# a helper function can be either defined internally (within another function definition) or externally (within the global environment)

#Disposable Functions
# you may need a function that performs a simple, one-line task
#disposable functions allow you to define a function intended for use in a single instance without explicitly creating a new object in your global environment

#Recursive Function
#recursion is when a function calls itself
#This isn't commonly used in statistics or bioinformatics


#12) Exceptions, Timings and Visibility
#12A) Exception Handling
# when there is an unexpected problem during execution of a function, R will notify you with either a warning or an error

#Formal Notifications:Errors and Warnings
#an error forces the function to immediately terminate at the point it occurs
# a warning indicates that the function is being run in an atypical way but tries to work around the issue and continues the execution
warn_test <- function(x){
  if(x<=0){
    warning("'x' is less than or equal to 0 but setting it to 1 and continuing")
    x <- 1
  }
  return(5/x)
}
error_test <- function(x){
  if(x<=0){
    stop("'x' is less than or equal to 0 ... TERMINATE")
  }
  return(5/x)
}
  
warn_test(0)
error_test(0)

#Catching errors with try Statements
# when a function terminates from an error, it also terminates any parent functions.
# silent=True only supresses Error messages, not warnings
attempt1 <- try(error_test(0),silent=TRUE)
attempt2 <- try(warn_test(0),silent=TRUE)

# You can suppress warnings using suppressWarnings
attempt3 <- suppressWarnings(warn_test(0))

#12B Progress and Timing
#Textual Progress Bars: Are we there yet?
# a progress bar shows how far along R is as it executes a set of operations
#sys.sleep command makes R pause for a specified amount of time, in seconds, before continueing
sys.sleep(3)
sleep_test <- function(n){
  result <- 0
  for(i in 1:n){
    result <- result+1
    Sys.sleep(0.5)
  }
  return(result)
}
sleep_test(8)

prog_test <- function(n){
  result <- 0
  progbar <- txtProgressBar(min=0,max=n,style=1,char="=")
  for(i in 1:n){
    result <- result+1
    Sys.sleep(0.5)
    setTxtProgressBar(progbar,value=i)
  }
  close(progbar)
  return(result)
}
prog_test(8)

#Measuring Completion Time:How Long Did it Take?
Sys.time()
t1 <- Sys.time()
Sys.sleep(3)
t2 <- Sys.time()
t2-t1

#12C Masking
#Function and Object Distinction
# when two functions or objects in different environment have the same name, the object that comes earlier in the search path will mask the later one
#when the object is sought, R will use the object or function it finds first, and you'll need extra code to access the other, masked version
search()
foo <- c(4,1.5,3)
sum(foo)

sum <- function(x){
  result <- 0
  for(i in 1:length(x)){
    result <- result + x[i]^2
  }
  return(result)
}

sum(foo)
base::sum(foo)
#rm the sum function from the global environment
rm(sum)

#When Package Objects Clash
# you will get a warning message that something has been masked  so you need to specify which one you want to use or the first on in the search path will be used

#Unmounting packages
detach("package:car",unload=TRUE)

#Data Frame Variable Distinction
#one other common situation in which you are explicitly notified of masking is when you add a data frame to the search path
foo <- data.frame(surname=c("a","b","c","d"),sex=c(0,1,1,0),height=c(170,168,181,180),stringsAsFactors=F)
foo
attach(foo)
search()
surname

bar <- data.frame(surname=c("e","f","g","h"), sex=c(1,0,1,0), weight=c(55,70,87,79),stringAsFactors=F)
bar
attach(bar)
search()
height
detach(foo)
search()