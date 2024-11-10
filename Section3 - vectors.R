vec <- c(21,22,46,32)
is.numeric(vec)
is.integer(vec)
is.double(vec)

#R stores all numbers as double, unless use of L to make it integer

vec2 <- c(21L, 22L, 46L,32L)
is.integer(vec2)
is.double(vec2)

vec3 <- c("a","s","23c","23")
is.character(vec3)
is.numeric(vec3)

#More ways to make a vector - seq- sequence of numbers and rep - repeat a number

seq(1,15)
1:15  
seq(1,10,3)

rep(3,12)

c <- c(30,40)
rep(c,10)

# Accessing elements of vector
x <- c(1,23,45,67,89)
y <- seq(201,260,11)
z <- rep('Hi',3)
x[3]

w <- c("a","b","c","d","e")
w[4]
w[-2] # Access all elements except 2
w[2:4] # Access only 2 3 4 elements
w[c(1,3,5)] # Selecting only 1st 3rd 5th
w[c(-2,-4)] # Selecting all elements without 2nd and 4th
w[c(-3:-5)] # selecting all elements without 3rd to 5th


#VECTORIZE OPERATIONS

x <- rnorm(5)
x

for (i in x){
  print(i)
}

print(x[1])
print(x[-3])

for (j in 1:5){
  print(x[j])
}

# Vectorize and devectorize operations

N <- 100
a <- rnorm(N)
b <- rnorm(N)

# vector approach
c <- a*b
c

# conventional approach - python

d <- rep(NA,N)
for (i in i:N){
  d[i] <- a[i] * b[i]
}


#Functions
rnorm()
c()
seq()
print()
rep()
typeof()
sqrt()
paste()
round()
mean()
max()
min()


#Libraries

?qplot
install.packages("ggplot2")

#HOMEWORK

revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#1 profit for each month - can be negative and positive both

profit1 <- revenue - expenses
profit1

#2 profit after tax of 30%

tax <- round(profit1*0.30,digits=2)
profit2 <- profit1 - tax
profit2

#3 profit margin - tax / revenue in %
profit.margin <- round(profit2 / revenue, digits=2)*100
profit.margin

#4 profit after tax was greater than mean of the year
mean.profit2 <- mean(profit2)
mean.profit2

goodmonth <- profit2 > mean.profit2
goodmonth

#January, June, July, August, September and December

#5 profit after tax was greater than mean of the year

badmonth <- !goodmonth
badmonth
#February, march, april, may, october, november

#6 profit after tax was max for the year

maxprofit <- profit2 == max(profit2)
maxprofit
#December

#7 profit after tax was min for the year

minprofit <- profit2 == min(profit2)
minprofit
#March had the least profit

#RESULTS TO BE REPRESENTED IN UNITS OF 1000

revenue.1000 <- round(revenue/1000,digits=0)
expenses.1000 <- round(expenses/1000,digits=0)
profit1.1000 <- round(profit1/1000,digits=0)
profit2.1000 <- round(profit2/1000,digits=0)

revenue.1000
expenses.1000
profit1.1000
profit2.1000
profit.margin
goodmonth
badmonth
maxprofit
minprofit

#Making a matrix

mat1 <- rbind(revenue.1000,
              expenses.1000,
              profit1.1000,
              profit2.1000,
              profit.margin,
              goodmonth,
              badmonth,
              maxprofit,
              minprofit)
mat1
