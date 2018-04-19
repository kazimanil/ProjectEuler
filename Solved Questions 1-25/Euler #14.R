collatz <-
  function(n){
    i <- 1
    while (n != 1){
      if(n %% 2 == 0){
        n = n/2
      } else if(n %% 2 == 1){
        n = 3*n + 1
      }
      i = i + 1 # iteration number
    }
    i
  }

collatz <- Vectorize(collatz)

prob14 <-
  data.table(numbers = seq(1, 1000000, 1))
             
prob14[, collatz_seq := collatz(numbers)]
prob14[collatz_seq == max(collatz_seq)]$numbers #837799
