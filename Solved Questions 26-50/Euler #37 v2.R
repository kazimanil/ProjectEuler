## Note: I would like to thank [Sabri Karagonen](https://www.kaggle.com/sabrikaragonen) for his kind comments which enabled this updated version.

## Functions ----
rm(list = ls())
# a <- Sys.time()
library(data.table);
primes = as.numeric(fread("primenumbers-2m.csv")$V1);

truncatablePrimeCheck = function(number){
  # First truncate left.
  charsLeft      = nchar(number)
  numberlistLeft = as.numeric(number)
    while (charsLeft > 1){
      truncatednumberLeft = substr(number, 1, charsLeft - 1)
      numberlistLeft      = append(numberlistLeft, truncatednumberLeft)
      charsLeft           = nchar(truncatednumberLeft)
    }
  # Next truncate right.
  originalcharsRight = nchar(number) + 2
  charsRight         = nchar(number)
  numberlistRight    = as.numeric(number)
    while(charsRight > 1){
      truncatednumberRight = substr(number, originalcharsRight - charsRight, originalcharsRight)
      numberlistRight      = append(numberlistRight, truncatednumberRight)
      charsRight           = nchar(truncatednumberRight)      
    }
  # Now append and check.
  numberlist = unique(
                append(as.numeric(numberlistLeft),
                       as.numeric(numberlistRight)))
  # The Check.
  length(which(numberlist %in% primes)) == length(numberlist)
}
truncatablePrimeCheck = Vectorize(truncatablePrimeCheck)

## Solution ----

primelist = fread("primenumbers-2m.csv")
primelist = primelist[V1 > 9][, .(number = V1)]
primelist[, .(Check = truncatablePrimeCheck(number))][Check = TRUE]

# Performance check
# b <- Sys.time()
# difftime(a, b, "secs") 12.327 mins