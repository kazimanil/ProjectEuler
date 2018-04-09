pnd <- function(maxvalue = 2000000){
  primenumbers <- as.numeric(2)
  for(num in 3:maxvalue){
    for(primenum in 1:length(primenumbers)){
      if(num %% primenumbers[primenum] == 0){
        break()
      } else {
        if(primenum == length(primenumbers)){
          primenumbers = append(primenumbers, num)
        }
      }
    }
  }
  primenumbers
}
