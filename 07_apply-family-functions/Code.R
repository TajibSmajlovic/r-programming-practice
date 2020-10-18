setwd("C:\\Users\\smajl\\Documents\\Tajib\\Programming\\Practice\\R Programming Practice\\07_apply-family-functions")

ChicagoData <- read.csv("Chicago-F.csv", row.names = 1)
HoustonData <- read.csv("Houston-F.csv", row.names = 1)
NewYorkData <- read.csv("NewYork-F.csv", row.names = 1)
SanFranciscoData <- read.csv("SanFrancisco-F.csv", row.names = 1)

# convert to matrices
ChicagoData <- as.matrix(ChicagoData)
HoustonData <- as.matrix(HoustonData)
NewYorkData <- as.matrix(NewYorkData)
SanFranciscoData <- as.matrix(SanFranciscoData)

is.matrix(ChicagoData)

# put all in a list
Weather <- list(Chicago = ChicagoData, Houston = HoustonData, NewYork = NewYorkData, SanFrancisco = SanFranciscoData)
Weather$NewYork

# Using apply()
apply(ChicagoData, 1, max)
apply(ChicagoData, 1, min)

apply(ChicagoData, 1, mean)
apply(HoustonData, 1, mean)
apply(NewYorkData, 1, mean)
apply(SanFranciscoData, 1, mean)

# My implementation of apply()
myApply <- function(data, margin, func) {
  appliedValue <- NULL

  if (margin == 1) {
    for (i in 1:nrow(data)) {
      appliedValue[rownames(data)[i]] <- func(data[i, ])
    }
  }

  if (margin == 2) {
    for (i in 1:ncol(data)) {
      appliedValue[colnames(data)[i]] <- func(data[i, ])
    }
  }

  return(appliedValue)
}

myApply(ChicagoData, 1, mean)

# using lapply()
t(ChicagoData) # transposing data (rows to columns and other way around)
myNewList <- lapply(Weather, t) # list(t(Weather$ChicagoData), t(Weather$NewYorkData), etc...)

lapply(Weather, rbind, NewRow = 1:12)

lapply(Weather, rowMeans) # identitac to apply(ChicagoData, 1, mean)
# rowMeans, colMeans, rowSums, colSums

# Combining lapply with the [] operator
lapply(Weather, "[", 1, )
lapply(Weather, "[", , 3)

# Adding your own functions
lapply(Weather, function(x) x[1, ])
lapply(Weather, function(x) x[, 12])
lapply(Weather, function(x) round((x[1, ] - x[2, ]) / x[2, ], 2))

# Using sapply()
lapply(Weather, "[", 1, 7)
sapply(Weather, "[", 1, 7)
# AvgHigh_F for 4rth quarter:
lapply(Weather, "[", 1, 10:12)
sapply(Weather, "[", 1, 10:12)

lapply(Weather, rowMeans)
round(sapply(Weather, rowMeans), 2)

sapply(Weather, function(x) round((x[1, ] - x[2, ]) / x[2, ], 2))

# Nesting apply()
lapply(Weather, apply, 1, max)
lapply(Weather, function(x) apply(x, 1, max))
sapply(Weather, apply, 1, max)


# which.max()
names(which.max(NewYorkData[1, ]))

apply(NewYorkData, 1, function(x) names(which.max(x)))
sapply(Weather, function(x) apply(x, 1, function(y) names(which.max(y))))
