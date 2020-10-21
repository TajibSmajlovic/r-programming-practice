setwd("C:\\Users\\smajl\\Documents\\Tajib\\Programming\\Practice\\R Programming Practice\\08_data-preprocesing")

dataset <- read.csv("Data.csv")

str(dataset)
typeof(dataset)

#### test = apply(dataset, 2, function(x) ifelse(is.na(x), ave(x, FUN = function(y) mean(y, na.rm = T)), x))

# Taking care of missing data
dataset$Age <- ifelse(is.na(dataset$Age), ave(dataset$Age, FUN = function(x) mean(x, na.rm = T)), dataset$Age)
dataset$Salary <- ifelse(is.na(dataset$Salary), ave(dataset$Salary, FUN = function(x) mean(x, na.rm = T)), dataset$Salary)

# Encoding categorical data
dataset$Country <- factor(dataset$Country, c("France", "Spain", "Germany"), c(1, 2, 3))
dataset$Purchased <- factor(dataset$Purchased, c("No", "Yes"), c(0, 1))

str(dataset)
summary(dataset)

# Splitting the dataset into the Training set and Test set
install.packages("caTools")
library(caTools)

set.seed(123)
split <- sample.split(dataset$Purchased, 0.8)
training_set <- subset(dataset, split == T)
test_set <- subset(dataset, split == F)

# Feature Scaling
training_set[, 2:3] <- scale(training_set[, 2:3])
test_set[, 2:3] <- scale(test_set[, 2:3])
