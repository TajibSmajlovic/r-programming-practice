myData <- 1:20

A <- matrix(myData, 4, 5, byrow = T)
A[2, 5]

######
# tbind()
r1 <- c("Some", "Char", "Values")
r2 <- c("asd", "dsa", "wsx")
r3 <- c(1, 2, 3)
table <- rbind(r1, r2, r3)
table

# cbind()
c1 <- 1:5
c2 <- -1:-5
C <- cbind(c1, c2)
C


########
# Named vectors
V1 <- 1:5

names(V1) <- c("a", "b", "c", "d", "e") # give names
V1
names(V1)

# Clear names
names(V1) <- NULL


###################
# Naming vector dimensions
Vec <- rep(c("a", "b", "c"), each=3)

Mtrx <- matrix(Vec, 3, 3)
Mtrx

rownames(Mtrx) <- c("How", "are", "you?")
Mtrx

colnames(Mtrx) <- c("I", "am", "fine!")
