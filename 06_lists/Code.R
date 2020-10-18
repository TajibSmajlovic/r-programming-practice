setwd("C:\\Users\\smajl\\Documents\\Programming\\Practice\\R Programming Practice\\06_lists")

data <- read.csv("Machine-Utilization.csv")
head(data, 20)
str(data)
summary(data)

# Derive utilization column
data$Utilization <- 1 - data$Percent.Idle

# Handling Date-Times
data$PosixTime <- as.POSIXct(data$Timestamp, format = "%d/%m/%Y %H:%M")

# How to rearrange columns in a df
data$Timestamp <- NULL
data <- data[, c(ncol(data), 1:(ncol(data) - 1))]

# List
RL1 <- data[data$Machine == "RL1", ]
RL1$Machine <- factor(RL1$Machine)
summary(RL1)

RL1UtilStats <- c(
  min(RL1$Utilization, na.rm = T),
  mean(RL1$Utilization, na.rm = T),
  max(RL1$Utilization, na.rm = T)
)
isUtilUnder90 <- as.logical(length(which(RL1$Utilization < 0.90)))

listRL1 <- list("RL1", RL1UtilStats, isUtilUnder90)

# Naming components of a list
names(listRL1) <- c("Machine", "Stats", "LowTreshold")
listRL1 <- list(Machine = "RL1", Stats = RL1UtilStats, LowTresholdisUtilUnder90) # Another way

# Extracting components of a list (3 ways)
# [] - return a list
# [[]] - return actual object
# $ - same as [[]] but prettier
listRL1[1]
listRL1[[1]]
listRL1$Machine

listRL1[2]
listRL1[[2]][3]
listRL1$Stats[3]

# Adding and deleting list components
listRL1[9] <- "New info"
listRL1$UnknownHours <- RL1$PosixTime[is.na(RL1$Utilization)]

listRL1[5:9] <- NULL

listRL1$Data <- RL1
summary(listRL1)

# Subsetting a list
listRL1$UnknownHours[1]
listRL1[1:3]
listRL1[c(1, 4)]
listRL1[c("Machine", "Stats")]

# Building a timeseries plot
library(ggplot2)

p <- ggplot(data = data)
myPlot <- p + geom_line(
  aes(
    x = PosixTime,
    y = Utilization,
    colour = Machine
  ),
  size = 1.2
) + facet_grid(Machine ~ .) + geom_hline(
  yintercept = 0.90,
  color = "Gray",
  size = 1.2,
  linetype = 3
)

listRL1$Plot <- myPlot

summary(listRL1)
str(listRL1)
