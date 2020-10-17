setwd("C:\\Users\\smajl\\Documents\\Programming\\Practice\\R Programming Practice\\05_data-preparation")
getwd()

fin <- read.csv("Future-500-The-Dataset.csv")
head(fin)
tail(fin)
str(fin)
summary(fin)

fin$ID <- factor(fin$ID)
fin$Inception <- factor(fin$Inception)

# Factor Variable Trap (FVT)
a <- c("7", "8", "3", "4")
a <- as.numeric(a) # convert char to number

b <- factor(a)
b <- as.numeric(as.character(b)) # convert from factor to num
b

fin$Inception <- as.numeric(as.character(fin$Inception))
fin$ID <- as.numeric(as.character(fin$ID))


#############################
# sub(), gsub()
fin$Expenses <- gsub(" Dollars", "", fin$Expenses)
fin$Expenses <- gsub(",", "", fin$Expenses)
fin$Expenses <- as.numeric(fin$Expenses)

fin$Revenue <- gsub("\\$", "", fin$Revenue) # escape sequence
fin$Revenue <- gsub(",", "", fin$Revenue)
fin$Revenue <- as.numeric(fin$Revenue)

fin$Growth <- gsub("%", "", fin$Growth)
fin$Growth <- as.integer(fin$Growth)

head(fin)
str(fin)
summary(fin)


##########################
# Dealing with missing data
fin <- read.csv("Future-500-The-Dataset.csv", na.strings = c("")) # replace empty string values with NA

complete.cases(fin) # checks if there are NA values in row
fin[!complete.cases(fin), ]
str(fin)

# using which() for non-missing data
fin[which(fin$Revenue == 9684527), ]
fin[which(fin$Employees == 25), ]

# using is.na() for missing data
fin[is.na(fin$Expenses), ]
fin$Name[is.na(fin$Expenses)]

fin[is.na(fin$State), ]

# Removing records with missing data
backup <- fin

fin[!complete.cases(fin), ]
fin <- fin[!is.na(fin$Industry), ] # remove rows which have NA value for Industry column

# resetting the dataframe index
rownames(fin) <- 1:nrow(fin) # 1 way
rownames(fin) <- NULL # 2 way

# Replacing missing data: Factual Alysis
fin[is.na(fin$State) & fin$City == "New York", "State"] <- "NY"
fin[c(11, 377), ]

fin[is.na(fin$State) & fin$City == "San Francisco", "State"] <- "CA"
fin[!complete.cases(fin), ]


# Replacing missing data: Median Imputation Method
medianEmployeeRetail1 <- median(fin[fin$Industry == "Retail", "Employees"], na.rm = T)
medianEmployeeRetail2 <- median(fin$Employees[fin$Industry == "Retail"], na.rm = T)
medianEmployeeRetail3 <- median(fin$Employees[which(fin$Industry == "Retail")], na.rm = T)

fin[is.na(fin$Employees) & fin$Industry == "Retail", "Employees"] <- medianEmployeeRetail1
fin$Employees[is.na(fin$Employees) & fin$Industry == "Retail"] <- medianEmployeeRetail1
fin[3, ]

medianEmployeeFinancialService <- median(fin[fin$Industry == "Financial Services", "Employees"], na.rm = T)
fin$Employees[is.na(fin$Employees) & fin$Industry == "Financial Services"] <- medianEmployeeFinancialService
fin[330, ]

medianGrowthConstruction <- median(fin$Growth[fin$Industry == "Construction"], na.rm = T)
fin$Growth[is.na(fin$Growth) & fin$Industry == "Construction"] <- medianGrowthConstruction
fin[8, ]

medianRevenueConstruction <- median(fin$Revenue[fin$Industry == "Construction"], na.rm = T)
medianExpensesConstruction <- median(fin$Expenses[fin$Industry == "Construction"], na.rm = T)
fin$Revenue[is.na(fin$Revenue) & fin$Industry == "Construction"] <- medianRevenueConstruction
fin$Expenses[is.na(fin$Expenses) & fin$Industry == "Construction" & is.na(fin$Profit)] <- medianExpensesConstruction

# Replace missing data: deriving values
fin$Profit[is.na(fin$Profit)] <- fin$Revenue[is.na(fin$Profit)] - fin$Expenses[is.na(fin$Profit)]
fin[c(8, 42), ]

fin$Expenses[is.na(fin$Expenses)] <- fin$Revenue[is.na(fin$Expenses)] - fin$Profit[is.na(fin$Expenses)]
fin[15, ]

fin[!complete.cases(fin), ]


###########################
# Visualising results
library(ggplot2)

p <- ggplot(data = fin)

p + geom_point(aes(
  x = Revenue, y = Expenses,
  colour = Industry, size = Profit
))

# A scatterplot that includes industry trends for the expenses-revenue
d <- ggplot(data = fin, aes(
  x = Revenue, y = Expenses,
  colour = Industry
))

d + geom_point() + geom_smooth(fill = NA, size = 1.2) # geom_point shows the data points and geom_smooth displays the trends

# box plots showing growth by industry
f <- ggplot(data = fin, aes(
  x = Industry, y = Growth,
  colour = Industry
))

f + geom_boxplot(size = 1)

# Extra
f + geom_jitter() +
  geom_boxplot(size = 1, alpha = 0.5, outlier.color = NA)
