myVector <- c(3, 25, 56, 87, 100)
is.numeric(myVector)
is.integer(myVector)
is.double(myVector)

v1 <- c("a", "bda23", "Helloou", 2, 9)
is.character(v1)


seq() # sequence: similar to ":"
rep() #replicate

1 : 50
seq(1, 50, 2)

y <- seq(1,14, 3)
y[2] # access element (2nd)
y[-2] # access every element of vector except second
y[1 : 3] #access first three elements 

rep(3, 800)


############
# R specific loop
x <- rnorm(5)

for (i in x) {
  print(i)
}

# conventional loop
for (j in 1:5) {
  print(x[j])
}

N <- 100
a <- rnorm(N)
b <- rnorm(N)
c <- a * b


###############
rnorm()
c()
seq()
rep()
print()
is.numeric()
is.integer()
is.double()
is.character()
typeof()
?sqrt()
?paste("asd", "dsa")


# install.packages("ggplot2")

library(ggplot2)

?qplot()





