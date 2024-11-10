# Variables and operations

x <- 2L
typeof(x)

x1<-2.0
typeof(x1)

x2<- 1+2i
typeof(x2)

x3<- "mrunal"
typeof(x3)

x4<- TRUE
x5<- F
typeof(x4)
typeof(x5)

?type.convert

a <- 10
b <- 5

c <- a+b
c

var1 <- 2.5
var2 <- 5

result <- var2 / var1
result

ans <- sqrt(var2)
ans

first <- "mrunal"
last <- "salvi"

fullname <- paste(first,last)
fullname

# Logical variables and operators

# TRUE / T and FALSE / F
2 < 1
4 == 4
4<=4

result1 <- 4 < 5
result1
typeof(result1)

result2 <- !(result1)
result2

result1 | result2
result1 & result2

isTRUE(result1)
isTRUE(result2)


# Looping

# While loop:

while(FALSE){
  print("Hello")
}

counter <- 1
while(counter <= 12){
  print(counter)
  counter <- counter + 1
}


#for loop:

for(i in 1:3){
  print("Hello R")
}

i = 1
for(i in 1:4){
  print(i+1)
  a <- i+1
  print(a)
}

#if loop:
checknumber <- rnorm(1)
if (checknumber<1){
  print("Less than 1")
} else{
  print("Greater than 1")
}


rm(answer)
y <- rnorm(1)
if (y > 1){
  print(y)
  answer <- "Greater than 1"
  print(answer)
} else if (y >= -1){
  print(y)
  answer <- "Between -1 and 1"
  print(answer)
} else {
  answer <- "Less than -1"
  print(y)
  print(answer)
}

#HOMEWORK

# Check if random number lies between -1 to 1 standard deviation

N <- 10
counter <- 1

for(i in rnorm(N)){
  if((i > -1) & (i < 1)){
    counter <- counter + 1
  }
}
answer <- counter / N
answer