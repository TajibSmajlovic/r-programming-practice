N <- 10000                  #specify sample size
counter <- 0   

for(i in rnorm(N)) {        #iterate over vector of numbers
  if(i > -1 & i < 1) {      #check where iterated variable falls
    counter <- counter + 1  #increase counter if condition is met
  }
}
answar <- counter / N     
answar * 100

