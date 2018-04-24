## Functions ----
rm(list = ls())
a <- Sys.time()

library(data.table);
primes = fread("primenumbers-2m.csv");

primedetector = function(numberlist){
  numberlist = as.data.table(numberlist)
  numberlist = `colnames<-`(numberlist, "number")
  numberlist[, prime := ifelse(number %in% primes$V1, TRUE, FALSE)]
  if(nrow(numberlist[prime == TRUE]) == nrow(numberlist)){
    TRUE
  } else {
    FALSE
  }
}
primedetector = Vectorize(primedetector)

numbertruncator = function(number, direction){
  if (direction == "toleft"){
    chars      = nchar(number)
    numberlist = as.numeric(number)
    while (chars > 1){
      truncatednumber = substr(number, 1, chars - 1)
      numberlist      = append(numberlist, truncatednumber)
      chars           = nchar(truncatednumber)
    }
  }
  if (direction == "toright"){
    originalchars = nchar(number) + 2
    chars         = nchar(number)
    numberlist    = as.numeric(number)
    while(chars > 1){
      truncatednumber = substr(number, originalchars - chars, originalchars)
      numberlist      = append(numberlist, truncatednumber)
      chars           = nchar(truncatednumber)      
    }
  }
  numberlist = as.numeric(numberlist)
}
numbertruncator = Vectorize(numbertruncator)

## Solution ----

primelist = fread("primenumbers-2m.csv")
primelist = primelist[V1 > 9][, .(number = V1)]
primelist$toleft  = primedetector(numbertruncator(primelist$number, "toleft"))
primelist$toright = primedetector(numbertruncator(primelist$number, "toright"))
primelist[toleft == TRUE & toright == TRUE, sum(number)] # 748317

# Performance check
# b <- Sys.time()
# difftime(a, b, "secs") 34.677 mins