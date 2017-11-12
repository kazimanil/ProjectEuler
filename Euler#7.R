j <- 2
while (i < 10001){
  for(h in 1:j){
    j %% h == 0
  }
  j <- j + 1
  print(j)
}