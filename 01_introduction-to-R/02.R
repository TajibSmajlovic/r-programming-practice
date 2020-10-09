# install.packages("styler")

counter <- 1

while (counter < 10) {
  print("Counter: ", counter)

  counter <- counter + 1
}

for (i in 1:5) {
  print("Execution for loop")
}


randomNumber <- rnorm(1)

if (randomNumber > 1) {
  print("Greater than 1")
} else if (randomNumber >= -1) {
  print("Between -1 and 1")
} else {
  print("Less than -1")
}
